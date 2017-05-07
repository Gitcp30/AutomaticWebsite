package com.jmu.domain.vo;

import com.jmu.domain.BaseSetting;

import java.io.Serializable;

/**
 * @Description: 内容实体类
 * @author: zhouzunrong
 * @create: 2017-05-07 1:27
 * @version: 1.0
 **/
public class WebSettingVo extends BaseSetting implements Serializable {

    private String comumnId;

    private Integer positionX;

    private Integer positionY;

    private Integer sizeWidth;

    private Integer sizeHeight;

    private String componentId;

    public String getComumnId() {
        return comumnId;
    }

    public void setComumnId(String comumnId) {
        this.comumnId = comumnId;
    }

    public Integer getPositionX() {
        return positionX;
    }

    public void setPositionX(Integer positionX) {
        this.positionX = positionX;
    }

    public Integer getPositionY() {
        return positionY;
    }

    public void setPositionY(Integer positionY) {
        this.positionY = positionY;
    }

    public Integer getSizeWidth() {
        return sizeWidth;
    }

    public void setSizeWidth(Integer sizeWidth) {
        this.sizeWidth = sizeWidth;
    }

    public Integer getSizeHeight() {
        return sizeHeight;
    }

    public void setSizeHeight(Integer sizeHeight) {
        this.sizeHeight = sizeHeight;
    }

    public String getComponentId() {
        return componentId;
    }

    public void setComponentId(String componentId) {
        this.componentId = componentId;
    }
}