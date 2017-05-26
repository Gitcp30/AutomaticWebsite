package com.jmu.domain.vo;

import com.jmu.domain.Sysfunction;

/**
 * @Description: 功能扩展类
 * @author: zhouzunrong
 * @create: 2017-05-26 14:45
 * @version: 1.0
 **/
public class SysfunctionVo extends Sysfunction{

    private Short[] functionTypes;

    public Short[] getFunctionTypes() {
        return functionTypes;
    }

    public void setFunctionTypes(Short[] functionTypes) {
        this.functionTypes = functionTypes;
    }
}