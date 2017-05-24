package com.jmu.domain.vo;

import com.jmu.domain.BullentinBoard;

import java.util.Date;

/**
 * @Description: 公告栏实体扩展类
 * @author: zhouzunrong
 * @create: 2017-05-24 13:24
 * @version: 1.0
 **/
public class BullentinBoardVo extends BullentinBoard {

    private String[] bullentinBoardIds;

    private Date createTimeBegin;
    private Date createTimeEnd;


    public String[] getBullentinBoardIds() {
        return bullentinBoardIds;
    }

    public void setBullentinBoardIds(String[] bullentinBoardIds) {
        this.bullentinBoardIds = bullentinBoardIds;
    }

    public Date getCreateTimeBegin() {
        return createTimeBegin;
    }

    public void setCreateTimeBegin(Date createTimeBegin) {
        this.createTimeBegin = createTimeBegin;
    }

    public Date getCreateTimeEnd() {
        return createTimeEnd;
    }

    public void setCreateTimeEnd(Date createTimeEnd) {
        this.createTimeEnd = createTimeEnd;
    }
}