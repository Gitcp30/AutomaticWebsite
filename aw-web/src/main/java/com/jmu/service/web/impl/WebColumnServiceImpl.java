package com.jmu.service.web.impl;

import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.jmu.dao.WebColumnMapper;
import com.jmu.dao.WebFooterMapper;
import com.jmu.domain.WebColumn;
import com.jmu.domain.WebFooter;
import com.jmu.service.web.WebColumnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * @Description: 菜单栏项目服务实现类
 * @author: zhouzunrong
 * @create: 2017-05-06 0:17
 * @version: 1.0
 **/
@Service
public class WebColumnServiceImpl implements WebColumnService {

    @Autowired
    private WebColumnMapper webColumnMapper;
    @Autowired
    private WebFooterMapper webFooterMapper;

    @Override
    public void addWebMenuItem(String companyId, String creator) {
        List<WebColumn> list = new ArrayList<WebColumn>();
        WebColumn index = new WebColumn(UUID.randomUUID().toString().replace("-", ""),"首页",(short) 0,"/index",companyId,creator,(short) 0);
        WebColumn aboutUs = new WebColumn(UUID.randomUUID().toString().replace("-", ""),"关于我们",(short) 0,"/aboutUs",companyId,creator,(short) 0);
        WebColumn memberLogin = new WebColumn(UUID.randomUUID().toString().replace("-", ""),"会员登录",(short) 0,"/memberLogin",companyId,creator,(short) 0);
        WebColumn memberRegister = new WebColumn(UUID.randomUUID().toString().replace("-", ""),"用户注册",(short) 0,"/memberRegister",companyId,creator,(short) 0);
        WebColumn messageBoard = new WebColumn(UUID.randomUUID().toString().replace("-", ""),"留言板",(short) 0,"/messageBoard",companyId,creator,(short) 0);
        WebColumn bulletinBoard = new WebColumn(UUID.randomUUID().toString().replace("-", ""),"公司公告",(short) 0,"/bulletinBoard",companyId,creator,(short) 0);
        WebColumn productDisplay = new WebColumn(UUID.randomUUID().toString().replace("-", ""),"产品展示",(short) 0,"/productDisplay",companyId,creator,(short) 0);
        list.add(index);
        list.add(aboutUs);
        list.add(memberLogin);
        list.add(memberRegister);
        list.add(messageBoard);
        list.add(bulletinBoard);
        list.add(productDisplay);
        webColumnMapper.batchInsert(list);
    }

    @Override
    public List<WebColumn> findAllByType(Short columnType) {
        return webColumnMapper.selectByType(columnType);
    }

    @Override
    public List<WebColumn> getSelectByCompanyId(String companyId, short type) {
        WebFooter webFooter = webFooterMapper.selectByCompanyId(companyId);
        String [] menus = webFooter.getMenuSelectIds().split("/");
        String [] links = webFooter.getLinkSelectIds().split("/");

        List<WebColumn> webColumnList = webColumnMapper.selectByType(type);

        webColumnList = Lists.transform(webColumnList, new Function<WebColumn, WebColumn>() {
            @Override
            public WebColumn apply(WebColumn webColumn) {

                for(int i=0;i<menus.length;i++){
                    if(webColumn.getColumnId().equals(menus[i])) {
                        webColumn.setIsMenu(true);
                        break;
                    }else{
                        webColumn.setIsMenu(false);
                    }
                }
                return webColumn;
            }
        });

        webColumnList = Lists.transform(webColumnList, new Function<WebColumn, WebColumn>() {
            @Override
            public WebColumn apply(WebColumn webColumn) {

                for(int i=0;i<links.length;i++){
                    if(webColumn.getColumnId().equals(links[i])) {
                        webColumn.setIsFooterLink(true);
                        break;
                    }else{
                        webColumn.setIsFooterLink(false);
                    }
                }
                return webColumn;
            }
        });

        return webColumnList;
    }

    @Override
    public Boolean isEffectiveLink(String url) {
       List<WebColumn> webColumnList =  webColumnMapper.selectByUrl(url);
        return !webColumnList.isEmpty();
    }
}