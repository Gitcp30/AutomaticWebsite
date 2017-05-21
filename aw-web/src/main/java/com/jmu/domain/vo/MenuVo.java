package com.jmu.domain.vo;

import com.jmu.domain.Sysfunction;

import java.io.Serializable;
import java.util.List;

/**
 * @Description: 功能菜单栏实体类
 * @author: zhouzunrong
 * @create: 2017-05-21 22:06
 * @version: 1.0
 **/
public class MenuVo implements Serializable {

    private Sysfunction mainmenu;
    private List<Sysfunction> submenu;


    public Sysfunction getMainmenu() {
        return mainmenu;
    }

    public void setMainmenu(Sysfunction mainmenu) {
        this.mainmenu = mainmenu;
    }

    public List<Sysfunction> getSubmenu() {
        return submenu;
    }

    public void setSubmenu(List<Sysfunction> submenu) {
        this.submenu = submenu;
    }
}