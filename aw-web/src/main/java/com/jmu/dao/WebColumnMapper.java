package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.domain.WebColumn;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WebColumnMapper extends BaseMapper<WebColumn> {

    int batchInsert(List<WebColumn> webColumnList);

    List<WebColumn> selectByType(Short columnType);

    List<WebColumn> selectByUrl(String url);

}