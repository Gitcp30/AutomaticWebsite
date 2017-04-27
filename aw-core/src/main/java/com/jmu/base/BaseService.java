package com.jmu.base;

import java.io.Serializable;



/**
 * @Description: service接口基础类
 * @author: zhouzunrong
 * @create: 2017-04-21 9:14
 * @version: 1.0
 **/
public interface BaseService<T extends Serializable> {

    /**
     * @Description: 根据id删除对象
     * @param id
     * @return
     */
    int deleteByPrimaryKey(String id);

    /**
     *  @Description: 新增一条记录
     * @param record
     * @return
     */
    int save(T record);

    /**
     * @Description: 新增一条记录（插入对象有判断字段空的处理）
     * @param record
     * @return
     */
    int saveSelective(T record);

    /**
     * @Description: 根据id查询对象
     * @param id
     * @return
     */
    T findByPrimaryKey(String id);

    /**
     * @Description: 更新一条记录（更新对象有判断字段空的处理）
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(T record);

    /**
     * @Description: 更新一条记录
     * @param record
     * @return
     */
    int updateByPrimaryKey(T record);

}
