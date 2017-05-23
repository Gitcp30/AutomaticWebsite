package com.jmu.service.admin;

import com.jmu.common.AjaxPageResponse;
import com.jmu.common.AjaxResponse;
import com.jmu.domain.MessageBoard;
import com.jmu.domain.vo.MessageBoardVo;

/**
 * 留言板接口实现类
 * Created by zzr on 2017/5/24.
 */
public interface MessageBoardService {

    public AjaxPageResponse findAll(MessageBoardVo messageBoardVo, AjaxPageResponse pageResponse);

    public AjaxResponse deleteMessageBoard(String[] ids);

    public AjaxResponse addMessageBoard(MessageBoard messageBoard);

}
