package com.jmu.service.admin.impl;

import com.jmu.common.AjaxPageResponse;
import com.jmu.common.AjaxResponse;
import com.jmu.dao.BullentinBoardMapper;
import com.jmu.domain.BullentinBoard;
import com.jmu.domain.vo.BullentinBoardVo;
import com.jmu.service.admin.BullentinBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.UUID;

/**
 * @Description: 公告栏服务实现类
 * @author: zhouzunrong
 * @create: 2017-05-24 13:32
 * @version: 1.0
 **/
@Service
public class BullentinBoardServiceImpl implements BullentinBoardService {

    @Autowired
    private BullentinBoardMapper bullentinBoardMapper;

    @Override
    public AjaxPageResponse findAll(BullentinBoardVo bullentinBoardVo, AjaxPageResponse page) {
        if(bullentinBoardVo.getCompanyId() != null){
            bullentinBoardMapper.selectAllByCompanyId(bullentinBoardVo,page);
        }
        return  page;
    }

    @Override
    public AjaxResponse saveBullentinBoard(BullentinBoard bullentinBoard) {
        bullentinBoard.setBullentinBoardId(UUID.randomUUID().toString().replace("-", ""));
        bullentinBoardMapper.insertSelective(bullentinBoard);
        return AjaxResponse.success();
    }

    @Override
    public AjaxResponse deleteBullentinBoard(String[] bullentinBoardIds) {
        if(bullentinBoardIds!=null  && bullentinBoardIds.length>0){
            bullentinBoardMapper.batchDeleteByPrimaryKey(bullentinBoardIds);
            return  AjaxResponse.success();
        } else {
            return  AjaxResponse.fail("删除ID不存在");
        }
    }

    @Override
    public AjaxResponse updateBullentinBoardState(BullentinBoardVo bullentinBoardVo) {
        if(bullentinBoardVo.getStatus() == null || bullentinBoardVo.getStatus() ==null){
            return AjaxResponse.fail("状态为空");
        }
        bullentinBoardMapper.updateStateByPrimaryKey(bullentinBoardVo);
        return AjaxResponse.success();
    }

    @Override
    public AjaxResponse updateBullentinBoard(BullentinBoard bullentinBoard) {
        if(bullentinBoard.getBullentinBoardId() != null){
            bullentinBoard.setModifyTime(new Date());
            bullentinBoardMapper.updateByPrimaryKeySelective(bullentinBoard);
            return AjaxResponse.success();
        } else{
            return  AjaxResponse.fail("公告栏id为空");
        }
    }
}