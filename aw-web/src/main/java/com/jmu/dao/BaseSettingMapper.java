package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.domain.BaseSetting;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BaseSettingMapper extends BaseMapper<BaseSetting> {


    List<BaseSetting> selectByCompaneyId(String compantId);

    int batchUpdateByPrimaryKey(List<BaseSetting> baseSettingList);

    int batchDeleteByCompanyId(String[] companyIds);

}