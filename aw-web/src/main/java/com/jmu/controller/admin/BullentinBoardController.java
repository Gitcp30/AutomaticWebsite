package com.jmu.controller.admin;

import com.jmu.common.AjaxPageResponse;
import com.jmu.common.AjaxResponse;
import com.jmu.domain.BullentinBoard;
import com.jmu.domain.User;
import com.jmu.domain.vo.BullentinBoardVo;
import com.jmu.service.admin.BullentinBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * @Description: 公告栏控制类
 * @author: zhouzunrong
 * @create: 2017-05-10 14:10
 * @version: 1.0
 **/
@Controller
@RequestMapping("/admin/web")
public class BullentinBoardController {

    @Autowired
    private BullentinBoardService bullentinBoardService;

   @RequestMapping(value = "bullentinBoardPage",method = RequestMethod.GET)
   public String page(){
       return "admin/web/bullentinBoardList";
   }


    @ResponseBody
    @RequestMapping("getBullentinBoard")
    public AjaxPageResponse getBullentinBoard(BullentinBoardVo bullentinBoardVo, AjaxPageResponse page, HttpSession session){
        User user = (User) session.getAttribute("currentUser");
        bullentinBoardVo.setCompanyId(user.getCompanyId());
        return  bullentinBoardService.findAll(bullentinBoardVo,page);
    }


    /**
     * 新增公告栏
     * @param bullentinBoard
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("saveBullentinBoard")
    public AjaxResponse saveBullentinBoard(@RequestBody BullentinBoard bullentinBoard, HttpSession session){
            User currentUser = (User) session.getAttribute("currentUser");
            bullentinBoard.setCompanyId(currentUser.getCompanyId());
            bullentinBoard.setCreator(currentUser.getUserId());
            return bullentinBoardService.saveBullentinBoard(bullentinBoard);
    }


    /**
     * 公告栏删除
     * @param bullentinBoardIds
     * @return
     */
    @ResponseBody
    @RequestMapping("deleteBullentinBoard")
    public AjaxResponse deleteBullentinBoard(@RequestParam(value="bullentinBoardIds[]",required=true) String[] bullentinBoardIds){
        if (bullentinBoardIds != null && bullentinBoardIds.length > 0){
            return bullentinBoardService.deleteBullentinBoard(bullentinBoardIds);
        }
        return AjaxResponse.fail("没有可删除的数据！");
    }



    @ResponseBody
    @RequestMapping("updateBullentinBoardState")
    public AjaxResponse updateBullentinBoardState(Short Status, @RequestParam(value="bullentinBoardIds[]",required=true) String[] bullentinBoardIds, HttpSession session){

        if(Status == null || bullentinBoardIds ==null){
            return AjaxResponse.fail("用户为空");
        }
        // userVo启用数据
        User user = (User) session.getAttribute("currentUser");

        BullentinBoardVo bullentinBoardVo = new BullentinBoardVo();
        bullentinBoardVo.setModifyTime(new Date());
        bullentinBoardVo.setModifier(user.getUserId());
        bullentinBoardVo.setStatus(Status);
        bullentinBoardVo.setBullentinBoardIds(bullentinBoardIds);

        return bullentinBoardService.updateBullentinBoardState(bullentinBoardVo);
    }


    @ResponseBody
    @RequestMapping(value = "/updateBullentinBoard")
    public AjaxResponse updateBullentinBoard(@RequestBody BullentinBoard bullentinBoard,HttpSession session){
        User currentUser = (User) session.getAttribute("currentUser");
        bullentinBoard.setModifier(currentUser.getUserId());
        return  bullentinBoardService.updateBullentinBoard(bullentinBoard);
    }

}