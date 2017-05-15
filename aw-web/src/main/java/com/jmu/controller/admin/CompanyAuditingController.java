package com.jmu.controller.admin;

import com.google.common.collect.Lists;
import com.jmu.common.AjaxPageResponse;
import com.jmu.common.AjaxResponse;
import com.jmu.constant.Constants;
import com.jmu.domain.vo.CompanyVo;
import com.jmu.domain.vo.UserVo;
import com.jmu.service.admin.CompanyService;
import com.jmu.service.admin.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Description: 单位控制类
 * @author: zhouzunrong
 * @create: 2017-05-10 14:10
 * @version: 1.0
 **/
@Controller
@RequestMapping("/admin/sys")
public class CompanyAuditingController {

    @Autowired
    private CompanyService companyService;
    @Autowired
    private UserService userService;



   @RequestMapping(value = "companyAuditing",method = RequestMethod.GET)
   public String page(){
       return "admin/sys/companyAuditing";
   }



   @ResponseBody
   @RequestMapping("getCompanyAuditing")
   public AjaxPageResponse getCompany(CompanyVo companyVo, AjaxPageResponse page){
       // 审核中，以及未核实状态
       Short[] companyStates = {Constants.AUDITING_FAIL,Constants.AUDITING_ING};
       companyVo.setCompanyStates(companyStates);
       return companyService.findAll(companyVo,page);
   }

    @ResponseBody
    @RequestMapping("getUserAndAuditing")
    public AjaxResponse getUserAndAuditing(String companyId){
        if(companyId == null ){
            AjaxResponse.fail("没有单位id!");
        }
        UserVo userVo = userService.getUserAndAuditing(companyId);
        AjaxResponse ajaxResponse = new AjaxResponse();
        ajaxResponse.setData(Lists.newArrayList(userVo));
        return ajaxResponse;
    }

}