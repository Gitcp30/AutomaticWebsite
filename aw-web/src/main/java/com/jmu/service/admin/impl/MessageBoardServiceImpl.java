package com.jmu.service.admin.impl;

import com.jmu.common.AjaxPageResponse;
import com.jmu.common.AjaxResponse;
import com.jmu.dao.MessageBoardMapper;
import com.jmu.domain.MessageBoard;
import com.jmu.domain.vo.MessageBoardVo;
import com.jmu.service.admin.MessageBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description: 留言板服务实现类
 * @author: zhouzunrong
 * @create: 2017-05-24 1:06
 * @version: 1.0
 **/
@Service
public class MessageBoardServiceImpl implements MessageBoardService {

    @Autowired
    private MessageBoardMapper messageBoardMapper;


    @Override
    public AjaxPageResponse findAll(MessageBoardVo messageBoardVo, AjaxPageResponse pageResponse) {
        if(messageBoardVo.getCompanyId() == null){
            return pageResponse;
        }else {
            messageBoardMapper.selectByCompanyId(messageBoardVo,pageResponse);
            return pageResponse;
        }
    }

    @Override
    public AjaxResponse deleteMessageBoard(String[] ids) {
        if(ids != null && ids.length > 0){
            messageBoardMapper.batchDeleteByPrimaryId(ids);
            return  AjaxResponse.success();
        } else {

        }
        return AjaxResponse.fail("留言板id不存在");
    }

    @Override
    public AjaxResponse addMessageBoard(MessageBoard messageBoard) {
        messageBoardMapper.insertSelective(messageBoard);
        return AjaxResponse.success();
    }
}