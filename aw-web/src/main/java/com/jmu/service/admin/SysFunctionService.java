package com.jmu.service.admin;

import com.jmu.common.AjaxResponse;
import com.jmu.domain.Sysfunction;
import com.jmu.domain.vo.SysfunctionVo;

import java.util.List;

/**
 * Created by zzr on 2017/4/27.
 */
public interface SysFunctionService {

    List getFunction(Sysfunction sysfunction);

    List getFunction(SysfunctionVo sysfunctionvo);

    List getAll();

    List getMainMenu();

    AjaxResponse deleteFunction(String functionId);

    AjaxResponse addFunction(Sysfunction sysfunction);
}
