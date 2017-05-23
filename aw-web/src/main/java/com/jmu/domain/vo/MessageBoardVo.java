package com.jmu.domain.vo;

import com.jmu.domain.MessageBoard;

import java.util.Date;

/**
 * @Description: 留言板扩展实体类
 * @author: zhouzunrong
 * @create: 2017-05-24 1:02
 * @version: 1.0
 **/
public class MessageBoardVo extends MessageBoard {


    private Date createTimeBegin;

    private Date createTimeEnd;

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