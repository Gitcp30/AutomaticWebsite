package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.domain.WebContent;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WebContentMapper extends BaseMapper<WebContent> {

    int batchInsert(List<WebContent> webContentList);

    int deleteByCompanyId(@Param("comumnId") String comumnId,@Param("companyId") String companyId);

    List<WebContent> selectByColumnId(@Param("comumnId") String comumnId,@Param("companyId") String companyId);

    int batchDeleteByCompanyId(String[] companyIds);
}