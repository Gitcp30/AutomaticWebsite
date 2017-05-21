package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.domain.BullentinBoard;
import org.springframework.stereotype.Repository;

@Repository
public interface BullentinBoardMapper extends BaseMapper<BullentinBoard> {

    int batchDeleteByCompanyId(String[] companyIds);

}