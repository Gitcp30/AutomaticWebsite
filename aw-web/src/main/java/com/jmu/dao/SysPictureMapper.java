package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.domain.SysPicture;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SysPictureMapper extends BaseMapper<SysPicture> {


    List selectByCompanyId(String companyId);

}