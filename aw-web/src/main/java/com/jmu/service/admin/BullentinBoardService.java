package com.jmu.service.admin;

import com.jmu.common.AjaxPageResponse;
import com.jmu.common.AjaxResponse;
import com.jmu.domain.BullentinBoard;
import com.jmu.domain.vo.BullentinBoardVo;

import java.util.List;

/**
 * Created by zzr on 2017/5/24.
 */
public interface BullentinBoardService {

    public AjaxPageResponse findAll(BullentinBoardVo bullentinBoardVo, AjaxPageResponse page);

    public AjaxResponse saveBullentinBoard(BullentinBoard bullentinBoard);

    public AjaxResponse deleteBullentinBoard(String[] bullentinBoardIds);

    public AjaxResponse updateBullentinBoardState(BullentinBoardVo bullentinBoardVo);

    public AjaxResponse updateBullentinBoard(BullentinBoard bullentinBoard);

    public List getBullentinBoard(String comapnyUrl);

    public BullentinBoard findOne(String bullentinBoardId);

}
