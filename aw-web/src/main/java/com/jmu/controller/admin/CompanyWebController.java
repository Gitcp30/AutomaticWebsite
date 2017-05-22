package com.jmu.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Description: 网站单位控制类
 * @author: zhouzunrong
 * @create: 2017-05-10 14:10
 * @version: 1.0
 **/
@Controller
@RequestMapping("/admin/web")
public class CompanyWebController {


   @RequestMapping(value = "companyPage",method = RequestMethod.GET)
   public String page(){
       return "admin/web/company";
   }




}