package com.jmu.service.admin;

import com.jmu.common.AjaxResponse;
import com.jmu.domain.Auditing;

/**
 * Created by zzr on 2017/5/16.
 */
public interface AuditingService {

    AjaxResponse updateAuditing(Auditing auditing);

    AjaxResponse deleteAuditing(String[] companyIds);
}
