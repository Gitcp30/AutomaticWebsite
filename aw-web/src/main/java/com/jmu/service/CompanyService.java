package com.jmu.service;

import com.jmu.domain.Company;

/**公司服务类
 * Created by zzr on 2017/5/7.
 */
public interface CompanyService {

    public Company findByUrl(String url);

}
