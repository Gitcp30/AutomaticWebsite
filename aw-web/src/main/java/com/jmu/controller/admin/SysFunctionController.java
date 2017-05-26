package com.jmu.controller.admin;

import com.jmu.common.AjaxResponse;
import com.jmu.constant.Constants;
import com.jmu.domain.Sysfunction;
import com.jmu.domain.User;
import com.jmu.domain.vo.SysfunctionVo;
import com.jmu.service.admin.SysFunctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Description: 功能控制类
 * @author: zhouzunrong
 * @create: 2017-05-10 14:10
 * @version: 1.0
 **/
@Controller
@RequestMapping("/admin/sys")
public class SysFunctionController {

    @Autowired
    private SysFunctionService functionService;

   @RequestMapping(value = "functionPage",method = RequestMethod.GET)
   public String page(){
       return "admin/sys/sysFunction";
   }


    /**
     *  获取右侧菜单栏数据
     * @return
     */
    @ResponseBody
    @RequestMapping("getFunction")
    public List getFunction(HttpSession session){

        SysfunctionVo sysfunctionVo = new SysfunctionVo();

        User user = (User) session.getAttribute("currentUser");
        Short userType = user.getUserType();
        // 当前用户为会员
        if( userType == (short) 0){
            Short[] type = {Constants.USER_STAFF};
            sysfunctionVo.setFunctionTypes(type);
            // 当前用户为网站管理员
        } else if( userType == (short) 1){
            Short[] type = {Constants.USER_STAFF,Constants.USER_WEB_ADMIN};
            sysfunctionVo.setFunctionTypes(type);
            // 当前用户为系统管理员
        } else if(userType == (short) 2){
            Short[] type = {Constants.USER_STAFF,Constants.USER_SYS_ADMIN};
            sysfunctionVo.setFunctionTypes(type);
            // 其他，错误直接返回
        } else {
            return null;
        }
        return  functionService.getFunction(sysfunctionVo);
    }


    /**
     *  获取所有菜单栏（编辑）
     * @return
     */
    @ResponseBody
    @RequestMapping("getAllFunction")
    public List getAllFunction(){
        return  functionService.getAll();
    }



    /**
     *  获取所有根菜单栏（编辑）
     * @return
     */
    @ResponseBody
    @RequestMapping("getMainMenu")
    public List getMainMenu(){
        return  functionService.getMainMenu();
    }



    /**
     *  新增功能
     * @return
     */
    @ResponseBody
    @RequestMapping("addFunction")
    public AjaxResponse addFunction(Sysfunction sysfunction){
        if(sysfunction.getText() == "" || sysfunction.getText() == null ){
            return  AjaxResponse.fail("功能名称不能为空!");
        } else {
            return  functionService.addFunction(sysfunction);
        }

    }

    /**
     *  新增功能
     * @return
     */
    @ResponseBody
    @RequestMapping("deleteFunction")
    public AjaxResponse deleteFunction(String functionId){
        if(functionId == "" || functionId == null ){
            return  AjaxResponse.fail("功能名称不能为空!");
        } else {
            return  functionService.deleteFunction(functionId);
        }

    }

}