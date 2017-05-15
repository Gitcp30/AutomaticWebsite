package com.jmu.service.web;

import com.jmu.domain.WebHeader;

/**
 * Created by zzr on 2017/5/6.
 */
public interface WebHeaderService {

    WebHeader findByCompanyId(String companyId);
}
