package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.common.AjaxPageResponse;
import com.jmu.domain.MessageBoard;
import com.jmu.domain.vo.MessageBoardVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageBoardMapper extends BaseMapper<MessageBoard> {

    int batchDeleteByCompanyId(String[] companyIds);

    int batchDeleteByPrimaryId(String[] ids);

    List selectByCompanyId(MessageBoardVo messageBoardVo, AjaxPageResponse page);
}