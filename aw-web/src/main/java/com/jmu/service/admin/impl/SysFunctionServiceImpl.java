package com.jmu.service.admin.impl;

import com.jmu.common.AjaxResponse;
import com.jmu.dao.SysfunctionMapper;
import com.jmu.domain.Sysfunction;
import com.jmu.domain.vo.MenuVo;
import com.jmu.domain.vo.SysfunctionVo;
import com.jmu.service.admin.SysFunctionService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * @Description: 功能服务实现类
 * @author: zhouzunrong
 * @create: 2017-05-21 21:51
 * @version: 1.0
 **/
@Service
public class SysFunctionServiceImpl implements SysFunctionService {

    @Autowired
    private SysfunctionMapper sysFunctionMapper;

    @Override
    public List getFunction(Sysfunction function) {
        if(function.getFunctionType() != null){
            // 查询根目录
            List<Sysfunction> roots =  sysFunctionMapper.selectMainByType(function);
            List<MenuVo> menus = new ArrayList<MenuVo>();
            if (roots != null){
                for(Sysfunction root :roots){
                    MenuVo menuVo = new MenuVo();
                    Sysfunction functionMenu = new Sysfunction();
                    BeanUtils.copyProperties(root,functionMenu);

                    function.setParentId(root.getFunctionId());
                    List<Sysfunction> subs =  sysFunctionMapper.selectSubByType(function);

                    menuVo.setMainmenu(functionMenu);
                    menuVo.setSubmenu(subs);
                    menus.add(menuVo);

                }
            }
            return  menus;
        } else {
            return null;
        }
    }

    @Override
    public List getFunction(SysfunctionVo function) {
        if(function.getFunctionTypes() != null){
            // 查询根目录
            List<Sysfunction> roots =  sysFunctionMapper.selectMainByTypes(function);
            List<MenuVo> menus = new ArrayList<MenuVo>();
            if (roots != null){
                for(Sysfunction root :roots){
                    MenuVo menuVo = new MenuVo();
                    Sysfunction functionMenu = new Sysfunction();
                    BeanUtils.copyProperties(root,functionMenu);

                    function.setParentId(root.getFunctionId());
                    List<Sysfunction> subs =  sysFunctionMapper.selectSubByTypes(function);

                    menuVo.setMainmenu(functionMenu);
                    menuVo.setSubmenu(subs);
                    menus.add(menuVo);

                }
            }
            return  menus;
        } else {
            return null;
        }
    }

    @Override
    public List getAll() {
        return sysFunctionMapper.selectAll();
    }

    @Override
    public List getMainMenu() {
        return sysFunctionMapper.selectMain();
    }

    @Override
    public AjaxResponse deleteFunction(String functionId) {
    if(functionId != "" && functionId!= null){
        sysFunctionMapper.deleteAllByPrimaryKey(functionId);
        return  AjaxResponse.success();
    } else {
        return  AjaxResponse.fail("功能ID不存在");
    }

    }

    @Override
    public AjaxResponse addFunction(Sysfunction sysfunction) {

        if(sysfunction.getText() == "" || sysfunction.getText() == null ){
            return  AjaxResponse.fail("功能名称不能为空!");
        } else {
            sysfunction.setFunctionId(UUID.randomUUID().toString().replace("-", ""));
            sysFunctionMapper.insertSelective(sysfunction);
            return AjaxResponse.success();
        }
    }
}