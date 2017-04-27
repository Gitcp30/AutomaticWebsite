package com.jmu.interceptor;


import com.jmu.common.AjaxPageResponse;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.apache.ibatis.scripting.defaults.DefaultParameterHandler;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * Created by zzr on 2017/3/21.
 */

@Intercepts({ @Signature(method = "prepare", type = StatementHandler.class, args = { Connection.class, Integer.class }),
        @Signature(method = "query", type = Executor.class, args = { MappedStatement.class, Object.class,
                RowBounds.class, ResultHandler.class }) })
public class MybatisSpringPageInterceptor implements Interceptor {


    protected ThreadLocal<AjaxPageResponse> pageThreadLocal = new ThreadLocal<AjaxPageResponse>();



    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        if (invocation.getTarget() instanceof StatementHandler) { // 控制SQL和查询总数的地方
            AjaxPageResponse page = pageThreadLocal.get();
            if (page == null) { // 不是分页查询
                return invocation.proceed();
            }
            StatementHandler statementHandler = (StatementHandler) invocation.getTarget();
            MetaObject metaStatementHandler = SystemMetaObject.forObject(statementHandler);
            // 分离代理对象链(由于目标类可能被多个拦截器拦截，从而形成多次代理，通过下面的两次循环
            // 可以分离出最原始的的目标类)
            while (metaStatementHandler.hasGetter("h")) {
                Object object = metaStatementHandler.getValue("h");
                metaStatementHandler = SystemMetaObject.forObject(object);
            }
            // 分离最后一个代理对象的目标类
            while (metaStatementHandler.hasGetter("target")) {
                Object object = metaStatementHandler.getValue("target");
                metaStatementHandler = SystemMetaObject.forObject(object);
            }
            MappedStatement mappedStatement = (MappedStatement) metaStatementHandler
                    .getValue("delegate.mappedStatement");
            BoundSql boundSql = (BoundSql) metaStatementHandler.getValue("delegate.boundSql");

            Connection connection = (Connection) invocation.getArgs()[0];

            if (page.getTotalPage() > 0) {
            } else {
                Object parameterObj = boundSql.getParameterObject();
                queryTotalRecord(page, parameterObj, mappedStatement, connection);
            }

            String pageSql = buildPageSql(page, boundSql.getSql());

            Field field= ReflectionUtils.findField(BoundSql.class, "sql");
            ReflectionUtils.makeAccessible(field);
            ReflectionUtils.setField(field, boundSql, pageSql);

            return invocation.proceed();
        } else { // 查询结果的地方

            AjaxPageResponse page = null;
            Object[] args = invocation.getArgs();
            for (Object arg : args) {
                if (arg != null && arg instanceof AjaxPageResponse) {
                    page = (AjaxPageResponse) arg;
                } else if (arg != null && arg instanceof Map) {
                    Map parammap = (Map) arg;
                    for (Object obj : parammap.values()) {
                        if (obj != null && obj instanceof AjaxPageResponse) {
                            page = (AjaxPageResponse) obj;
                        }
                    }
                }
            }

            if (page == null) {
                return invocation.proceed();
            }


            pageThreadLocal.set(page);

            try {
                Object data = invocation.proceed();
                if (data instanceof List) {
                    page.setData((List) data);
                }
                return data;
            } catch (Exception e) {
                e.printStackTrace();
                throw e;
            } finally {
                pageThreadLocal.remove();
            }
        }
    }

    @Override
    public Object plugin(Object o) {
        return Plugin.wrap(o, this);
    }

    @Override
    public void setProperties(Properties properties) {

    }


    /**
     * <pre>
     * 生成分页SQL
     * </pre>
     *
     * @author ylz-sub
     * @param page
     * @param sql
     * @return
     */
    private String buildPageSql(AjaxPageResponse page, String sql) {
            return buildMysqlPageSql(page, sql);
    }


    /**
     * <pre>
     * 生成Mysql分页查询SQL
     * </pre>
     *
     * @author ylz-sub
     * @param page
     * @param sql
     * @return

*/
    private String buildMysqlPageSql(AjaxPageResponse page, String sql) {
        // 计算第一条记录的位置，Mysql中记录的位置是从0开始的。
        int offset = (page.getPageNumber() - 1) * page.getPageSize();
        return new StringBuilder(sql).append(" limit ").append(offset).append(",").append(page.getPageSize())
                .toString();
    }

    /**
     * <pre>
     * 查询总数
     * </pre>
     *
     * @author ylz-sub
     * @param page
     * @param parameterObject
     * @param mappedStatement
     * @param connection
     * @throws Exception
     */
    private void queryTotalRecord(AjaxPageResponse page, Object parameterObject, MappedStatement mappedStatement,
                                    Connection connection) throws Exception {
        BoundSql boundSql = mappedStatement.getBoundSql(parameterObject);
        String countSql = this.buildCountSql(boundSql.getSql());

        List<ParameterMapping> parameterMappings = boundSql.getParameterMappings();
        BoundSql countBoundSql = new BoundSql(mappedStatement.getConfiguration(), countSql, parameterMappings,
                parameterObject);
        ParameterHandler parameterHandler = new DefaultParameterHandler(mappedStatement, parameterObject,
                countBoundSql);
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement(countSql);
            parameterHandler.setParameters(pstmt);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                long totalRecord = rs.getLong(1);
                page.setTotal(totalRecord);
            }
        } finally {
            if (rs != null)
                try {
                    rs.close();
                } catch (Exception e) {
                }
            if (pstmt != null)
                try {
                    pstmt.close();
                } catch (Exception e) {
                }
        }
    }


    /**
     * 根据原Sql语句获取对应的查询总记录数的Sql语句
     *
     * @param sql
     * @return
     */
    private String buildCountSql(String sql) {
        int index = sql.indexOf("from");
        return "select count(*) " + sql.substring(index);
    }
}
