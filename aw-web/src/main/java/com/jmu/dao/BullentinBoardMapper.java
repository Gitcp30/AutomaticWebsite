package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.common.AjaxPageResponse;
import com.jmu.domain.BullentinBoard;
import com.jmu.domain.vo.BullentinBoardVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BullentinBoardMapper extends BaseMapper<BullentinBoard> {

    int batchDeleteByCompanyId(String[] companyIds);

    List<BullentinBoard> selectAllByCompanyId(BullentinBoardVo bullentinBoardVo, AjaxPageResponse page);


    int batchDeleteByPrimaryKey(String[] bullentinBoardIds);

    int updateStateByPrimaryKey(BullentinBoardVo bullentinBoardVo);

    List<BullentinBoard> selectByCompanyId(String companyId);
}