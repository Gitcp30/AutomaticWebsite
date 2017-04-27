package com.jmu.base.impl;

import com.jmu.base.BaseMapper;
import com.jmu.base.BaseService;

import java.io.Serializable;

/**
 * @Description: service基础实现类
 * @author: zhouzunrong
 * @create: 2017-04-21 9:28
 * @version: 1.0
 **/
public abstract class BaseServiceImpl<T extends Serializable> implements BaseService<T> {

    private BaseMapper<T> baseMapper;

    public void setBaseMapper(BaseMapper<T> baseMapper) {
        this.baseMapper = baseMapper;
    }


    @Override
    public int deleteByPrimaryKey(String id) {
        return baseMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int save(T record) {
        return baseMapper.insert(record);
    }

    @Override
    public int saveSelective(T record) {
        return baseMapper.insertSelective(record);
    }

    @Override
    public T findByPrimaryKey(String id) {
        return baseMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(T record) {
        return baseMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(T record) {
        return baseMapper.updateByPrimaryKey(record);
    }
}