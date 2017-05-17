package com.jmu.controller.admin;

import com.jmu.common.AjaxPageResponse;
import com.jmu.common.AjaxResponse;
import com.jmu.constant.Constants;
import com.jmu.domain.User;
import com.jmu.domain.vo.CompanyVo;
import com.jmu.service.admin.CompanyService;
import com.jmu.service.admin.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * @Description: 单位控制类
 * @author: zhouzunrong
 * @create: 2017-05-10 14:10
 * @version: 1.0
 **/
@Controller
@RequestMapping("/admin/sys")
public class CompanyController {

    @Autowired
    private CompanyService companyService;
    @Autowired
    private UserService userService;



   @RequestMapping(value = "companyPage",method = RequestMethod.GET)
   public String page(){
       return "admin/sys/company";
   }

    /**
     * 获取单位列表
     * @param companyVo
     * @param page
     * @return
     */
   @ResponseBody
   @RequestMapping("getCompany")
   public AjaxPageResponse getCompany(CompanyVo companyVo, AjaxPageResponse page){
       // 审核审核通过状态
       Short[] companyStates = {Constants.AUDITING_SUCCESS,Constants.STATE_NORMAL,Constants.STATE_LOCK};
       companyVo.setCompanyStates(companyStates);
       return companyService.findAll(companyVo,page);
   }

    /**
     * 查询单位的员工数量
     * @param companyId
     * @return
     */
    @ResponseBody
    @RequestMapping("getUserCount")
    public String getUserCount(String companyId){
        String str = "";
       if(companyId != null){
           Integer count = userService.getUserCount(companyId);
           str = "{\"count\":"+ count+",\"code\":"+0+"}";
       } else {
           str = "{\"code\":"+1+"}";
       }
        return str;
    }

    /**
     * 查询单位对应的员工
     * @param companyId
     * @param page
     * @return
     */
    @ResponseBody
    @RequestMapping("getCompanyUser")
    public AjaxPageResponse getCompanyUser(String companyId, AjaxPageResponse page){
        return userService.getUser(companyId,page);
    }

    /**
     * 更新单位状态
     * @param companyState
     * @param companyIds
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("updateCompanyState")
    public AjaxResponse updateCompanyState(Short companyState, @RequestParam(value="companyIds[]",required=true) String[] companyIds, HttpSession session){

        if(companyState == null || companyIds ==null){
            return AjaxResponse.fail("单位为空");
        }
        // companyVo启用数据
        CompanyVo companyVo = new CompanyVo();
        companyVo.setCompanyState(companyState);
        companyVo.setCompanyIds(companyIds);
        User user = (User) session.getAttribute("currentUser");
        companyVo.setModifier(user.getUserId());
        companyVo.setModifyTime(new Date());

        return companyService.updateState(companyVo);
    }




    @ResponseBody
    @RequestMapping("deleteCompany")
    public AjaxResponse deleteCompany(@RequestParam(value="companyIds[]",required=true) String[] companyIds){
        if (companyIds != null && companyIds.length > 0){
           // return auditingService.deleteAuditing(companyIds);
        }
        return AjaxResponse.fail("没有可删除的数据！");
    }







}