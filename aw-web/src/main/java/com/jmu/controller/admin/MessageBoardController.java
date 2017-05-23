package com.jmu.controller.admin;

import com.jmu.common.AjaxPageResponse;
import com.jmu.common.AjaxResponse;
import com.jmu.domain.User;
import com.jmu.domain.vo.MessageBoardVo;
import com.jmu.service.admin.MessageBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @Description: 留言板控制类
 * @author: zhouzunrong
 * @create: 2017-05-10 14:10
 * @version: 1.0
 **/
@Controller
@RequestMapping("/admin/web")
public class MessageBoardController {

    @Autowired
    private MessageBoardService messageBoardService;

   @RequestMapping(value = "messageBoardPage",method = RequestMethod.GET)
   public String page(){
       return "admin/web/messageBoardList";
   }


    /**
     * 获取留言板列表
     * @param messageBoardVo
     * @param page
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("getMessageBoard")
    public AjaxPageResponse getMessageBoard(MessageBoardVo messageBoardVo, AjaxPageResponse page, HttpSession session){
        User user = (User) session.getAttribute("currentUser");
        messageBoardVo.setCompanyId(user.getCompanyId());
        return messageBoardService.findAll(messageBoardVo,page);
    }


    /**
     * 删除留言板
     * @param messageBoardIds
     * @return
     */
    @ResponseBody
    @RequestMapping("deleteMessageBoard")
    public AjaxResponse deleteMessageBoard(@RequestParam(value="messageBoardIds[]",required=true) String[] messageBoardIds){
        if (messageBoardIds != null && messageBoardIds.length > 0){
            return messageBoardService.deleteMessageBoard(messageBoardIds);
        }
        return AjaxResponse.fail("没有可删除的数据！");
    }





}