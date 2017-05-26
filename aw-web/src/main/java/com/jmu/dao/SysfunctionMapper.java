package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.domain.Sysfunction;
import com.jmu.domain.vo.SysfunctionVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SysfunctionMapper extends BaseMapper<Sysfunction>{

    List selectMainByType(Sysfunction sysfunction);

    List selectMainByTypes(SysfunctionVo sysfunctionVo);

    List selectMain();

    List selectSubByType(Sysfunction sysfunction);

    List selectSubByTypes(SysfunctionVo sysfunctionVo);

    List selectAll();

    int deleteAllByPrimaryKey(String functionId);

}