package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.domain.Sysfunction;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SysfunctionMapper extends BaseMapper<Sysfunction>{

    List selectMainByType(Sysfunction sysfunction);

    List selectMain();

    List selectSubByType(Sysfunction sysfunction);

    List selectAll();

    int deleteAllByPrimaryKey(String functionId);

}