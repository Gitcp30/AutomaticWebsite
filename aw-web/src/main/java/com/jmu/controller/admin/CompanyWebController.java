package com.jmu.controller.admin;

import com.jmu.common.AjaxResponse;
import com.jmu.domain.Company;
import com.jmu.domain.User;
import com.jmu.service.admin.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @Description: 网站单位控制类
 * @author: zhouzunrong
 * @create: 2017-05-10 14:10
 * @version: 1.0
 **/
@Controller
@RequestMapping("/admin/web")
public class CompanyWebController {

    @Autowired
    private CompanyService companyService;


   @RequestMapping(value = "companyPage",method = RequestMethod.GET)
   public String page(){
       return "admin/web/company";
   }



    /**
     *  查询单位
     * @return
     */
    @ResponseBody
    @RequestMapping("getCompany")
    public Company getCompany(HttpSession session){
        User user = (User) session.getAttribute("currentUser");
        return  companyService.getCompany(user.getCompanyId());
    }



    /**
     * 更新单位信息
     * @param company
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("updateCompany")
    public AjaxResponse updateCompany(@RequestBody Company company, HttpSession session){
        if (company.getCompanyId() == null){
            return  AjaxResponse.fail("单位id不存在！");
        }
        User user = (User) session.getAttribute("currentUser");
        company.setModifier(user.getUserId());

        return companyService.updateCompany(company);

    }


}