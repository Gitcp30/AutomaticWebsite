package com.jmu.controller.admin;

import com.jmu.common.AjaxResponse;
import com.jmu.constant.Constants;
import com.jmu.domain.User;
import com.jmu.service.admin.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @Description: 用户控制类
 * @author: zhouzunrong
 * @create: 2017-05-10 14:10
 * @version: 1.0
 **/
@Controller
@RequestMapping("/admin/web")
public class UserController {

    @Autowired
    private UserService userService;

   @RequestMapping(value = "userPage",method = RequestMethod.GET)
   public String page(){
       return "admin/web/user";
   }


    /**
     *  查询用户信息
     * @return
     */
    @ResponseBody
    @RequestMapping("getUser")
    public User deleteFunction(HttpSession session){
        User user = (User) session.getAttribute("currentUser");
        return  userService.getUser(user.getUserId());
    }



    @ResponseBody
    @RequestMapping(value = "/updateUser")
    public AjaxResponse updateUser(@RequestParam(value = "photo",required = false) MultipartFile fileData,
            User user,HttpSession session) throws IOException {
        //上传图片
        if(fileData!=null && fileData.getOriginalFilename()!=null && fileData.getOriginalFilename().length()>0){
            //原始名称
            String originalFilename = fileData.getOriginalFilename();
            //新的图片名称
            String newFileName =UUID.randomUUID().toString().replace("-", "") + originalFilename.substring(originalFilename.lastIndexOf("."));
            //新图片
            File newFile = new File(Constants.PIC_PATH+newFileName);

            //将内存中的数据写入磁盘
            fileData.transferTo(newFile);
            //将新图片名称写到itemsCustom中
            user.setPicSrc("/pic/profile/"+newFileName);
        }
        User currentUser = (User) session.getAttribute("currentUser");
        user.setModifier(currentUser.getUserId());
        return  userService.updateUser(user);
    }




}