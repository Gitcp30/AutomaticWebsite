package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.domain.BaseSetting;

import java.util.List;

public interface BaseSettingMapper extends BaseMapper<BaseSetting> {


    List<BaseSetting> selectByCompaneyId(String compantId);

}