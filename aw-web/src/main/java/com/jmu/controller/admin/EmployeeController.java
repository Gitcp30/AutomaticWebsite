package com.jmu.controller.admin;

import com.jmu.common.AjaxPageResponse;
import com.jmu.common.AjaxResponse;
import com.jmu.constant.ResponseCode;
import com.jmu.domain.User;
import com.jmu.domain.vo.UserVo;
import com.jmu.service.admin.UserService;
import com.jmu.service.front.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * @Description: 员工控制类
 * @author: zhouzunrong
 * @create: 2017-05-10 14:10
 * @version: 1.0
 **/
@Controller
@RequestMapping("/admin/web")
public class EmployeeController {

    @Autowired
    private UserService userService;
    @Autowired
    private RegisterService registerService;

   @RequestMapping(value = "employeePage",method = RequestMethod.GET)
   public String page(){
       return "admin/web/employeeList";
   }


    @ResponseBody
    @RequestMapping("getEmployee")
    public AjaxPageResponse getEmployee(UserVo userVo, AjaxPageResponse page, HttpSession session){
        User user = (User) session.getAttribute("currentUser");
        userVo.setCompanyId(user.getCompanyId());
        return  userService.findAll(userVo,page);
    }


    /**
     *  新增员工
     * @param user
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("saveEmployee")
    public AjaxResponse saveEmployee(@RequestBody User user, HttpSession session){
        // 检查 邮箱是否重复
        AjaxResponse ajaxResponse = registerService.checkMailbox(user.getMailbox());
        if(ajaxResponse.getCode() == ResponseCode.FAIL){
            return ajaxResponse;
        } else {
            User currentUser = (User) session.getAttribute("currentUser");
            user.setCompanyId(currentUser.getCompanyId());
            return userService.saveUser(user);

        }

    }


    /**
     * 删除员工
     * @param userIds
     * @return
     */
    @ResponseBody
    @RequestMapping("deleteEmployee")
    public AjaxResponse deleteEmployee(@RequestParam(value="userIds[]",required=true) String[] userIds){
        if (userIds != null && userIds.length > 0){
            return userService.deleteUser(userIds);
        }
        return AjaxResponse.fail("没有可删除的数据！");
    }



    @ResponseBody
    @RequestMapping("updateUserState")
    public AjaxResponse updateUserState(Short userState, @RequestParam(value="userIds[]",required=true) String[] userIds, HttpSession session){

        if(userState == null || userIds ==null){
            return AjaxResponse.fail("用户为空");
        }
        // userVo启用数据
        UserVo userVo = new UserVo();
        userVo.setUserState(userState);
        userVo.setUserIds(userIds);
        User user = (User) session.getAttribute("currentUser");
        userVo.setModifier(user.getUserId());
        userVo.setModifyTime(new Date());

        return userService.updateUserState(userVo);
    }


    /**
     *  更新员工信息
     * @param user
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("updateEmployee")
    public AjaxResponse updateEmployee(@RequestBody User user, HttpSession session){
        if (user.getUserId() == null){
            return  AjaxResponse.fail("员工id不存在！");
        }
        User currentUser = (User) session.getAttribute("currentUser");
        user.setModifier(user.getUserId());
        return userService.updateUser(user);
    }


}