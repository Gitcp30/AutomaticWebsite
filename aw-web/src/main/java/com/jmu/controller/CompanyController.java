package com.jmu.controller;

import com.jmu.common.AjaxPageResponse;
import com.jmu.domain.Company;
import com.jmu.service.CompanyService;
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
public class CompanyController {

    @Autowired
    private CompanyService companyService;


   /* public JsonResult GetDepartment(int limit, int offset, string departmentname, string statu)
    {
        var lstRes = new List<Department>();
        for (var i = 0; i < 50; i++)
        {
            var oModel = new Department();
            oModel.ID = Guid.NewGuid().ToString();
            oModel.Name = "销售部" + i ;
            oModel.Level = i.ToString();
            oModel.Desc = "暂无描述信息";
            lstRes.Add(oModel);
        }

        var total = lstRes.Count;
        var rows = lstRes.Skip(offset).Take(limit).ToList();
        return Json(new { total = total, rows = rows }, JsonRequestBehavior.AllowGet);
    }
*/


   @RequestMapping(value = "company",method = RequestMethod.GET)
   public String page(){
       return "admin/sys/company";
   }



   @ResponseBody
   @RequestMapping("getCompany")
   public AjaxPageResponse getCompany(Company company,AjaxPageResponse page){
       return companyService.findAll(company,page);
   }
}