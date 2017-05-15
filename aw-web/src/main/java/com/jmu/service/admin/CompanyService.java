package com.jmu.service.admin;

import com.jmu.common.AjaxPageResponse;
import com.jmu.domain.Company;
import com.jmu.domain.vo.CompanyVo;

/**公司服务类
 * Created by zzr on 2017/5/7.
 */
public interface CompanyService {

    public Company findByUrl(String url);

    public AjaxPageResponse findAll(CompanyVo companyVo , AjaxPageResponse pageResponse);

}
