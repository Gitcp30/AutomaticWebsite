package com.jmu.core.persistence;

import org.apache.commons.lang3.StringUtils;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.core.type.classreading.CachingMetadataReaderFactory;
import org.springframework.core.type.classreading.MetadataReader;
import org.springframework.core.type.classreading.MetadataReaderFactory;
import org.springframework.util.ClassUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by zzr on 2017/3/20.
 *
 *typeAliasesPackage 默认只能扫描某一个路径下，或以逗号等分割的 几个路径下的内容，
 * 不支持通配符和正则，采用重写的方式解决
 *
 */
public class MySqlSessionFactoryBean extends SqlSessionFactoryBean {

    private static final Logger LOGGER = LoggerFactory.getLogger(SqlSessionFactoryBean.class);

    static final String DEFAULT_RESOURCE_PATTERN = "**/*.class";



    @Override
    public void setTypeAliasesPackage(String typeAliasesPackage) {
        String[] basePackages = org.springframework.util.StringUtils.tokenizeToStringArray(typeAliasesPackage, ConfigurableApplicationContext.CONFIG_LOCATION_DELIMITERS);

        Set<String> packageSet = new LinkedHashSet<>();

        for (String basePackage : basePackages) {
            packageSet.addAll(doScan(basePackage));
        }

        if (packageSet.size() > 0) {
            super.setTypeAliasesPackage(StringUtils.join(packageSet.toArray(), ","));
        } else {
            LOGGER.warn("包路径typeAliasesPackage:" + typeAliasesPackage + "，未匹配到任何包");
        }
    }



    /**
     * 根据通配符和正则解析出具体包
     *
     * @param basePackage 基础包
     * @return
     */
    private List<String> doScan(String basePackage) {
        basePackage = ResourcePatternResolver.CLASSPATH_ALL_URL_PREFIX +
                ClassUtils.convertClassNameToResourcePath(basePackage) + "/" + DEFAULT_RESOURCE_PATTERN;

        ResourcePatternResolver resolver = (ResourcePatternResolver) new PathMatchingResourcePatternResolver();
        MetadataReaderFactory metadataReaderFactory = new CachingMetadataReaderFactory(resolver);
        List<String> result = new ArrayList<String>();
        try {
            Resource[] resources = resolver.getResources(basePackage);
            if (resources != null && resources.length > 0) {
                MetadataReader metadataReader = null;
                for (Resource resource : resources) {
                    if (resource.isReadable()) {
                        metadataReader = metadataReaderFactory.getMetadataReader(resource);
                        try {
                            result.add(Class.forName(metadataReader.getClassMetadata().getClassName()).getPackage().getName());
                        } catch (ClassNotFoundException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }

        } catch (IOException e) {
            LOGGER.error("解析包出错！");
        }
        return result;
    }
}
