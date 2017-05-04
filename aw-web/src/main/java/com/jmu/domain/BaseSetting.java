package com.jmu.domain;

import java.io.Serializable;
import java.util.Date;

public class BaseSetting implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column base_setting.BASE_SETTING_ID
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    private String baseSettingId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column base_setting.COMPANY_ID
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    private String companyId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column base_setting.TYPE
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    private String type;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column base_setting.BS_NAME
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    private String bsName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column base_setting.BS_VALUE
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    private String bsValue;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column base_setting.BS_TARGET
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    private String bsTarget;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column base_setting.BS_CSS
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    private String bsCss;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column base_setting.MODIFY_TIME
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    private Date modifyTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column base_setting.MODIFIER
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    private String modifier;

    public BaseSetting() {
    }

    public BaseSetting(String baseSettingId, String companyId, String type, String bsName, String bsValue, String bsTarget, String bsCss, String modifier) {
        this.baseSettingId = baseSettingId;
        this.companyId = companyId;
        this.type = type;
        this.bsName = bsName;
        this.bsValue = bsValue;
        this.bsTarget = bsTarget;
        this.bsCss = bsCss;
        this.modifier = modifier;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column base_setting.BASE_SETTING_ID
     *
     * @return the value of base_setting.BASE_SETTING_ID
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public String getBaseSettingId() {
        return baseSettingId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column base_setting.BASE_SETTING_ID
     *
     * @param baseSettingId the value for base_setting.BASE_SETTING_ID
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public void setBaseSettingId(String baseSettingId) {
        this.baseSettingId = baseSettingId == null ? null : baseSettingId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column base_setting.COMPANY_ID
     *
     * @return the value of base_setting.COMPANY_ID
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public String getCompanyId() {
        return companyId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column base_setting.COMPANY_ID
     *
     * @param companyId the value for base_setting.COMPANY_ID
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public void setCompanyId(String companyId) {
        this.companyId = companyId == null ? null : companyId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column base_setting.TYPE
     *
     * @return the value of base_setting.TYPE
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public String getType() {
        return type;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column base_setting.TYPE
     *
     * @param type the value for base_setting.TYPE
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column base_setting.BS_NAME
     *
     * @return the value of base_setting.BS_NAME
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public String getBsName() {
        return bsName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column base_setting.BS_NAME
     *
     * @param bsName the value for base_setting.BS_NAME
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public void setBsName(String bsName) {
        this.bsName = bsName == null ? null : bsName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column base_setting.BS_VALUE
     *
     * @return the value of base_setting.BS_VALUE
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public String getBsValue() {
        return bsValue;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column base_setting.BS_VALUE
     *
     * @param bsValue the value for base_setting.BS_VALUE
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public void setBsValue(String bsValue) {
        this.bsValue = bsValue == null ? null : bsValue.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column base_setting.BS_TARGET
     *
     * @return the value of base_setting.BS_TARGET
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public String getBsTarget() {
        return bsTarget;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column base_setting.BS_TARGET
     *
     * @param bsTarget the value for base_setting.BS_TARGET
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public void setBsTarget(String bsTarget) {
        this.bsTarget = bsTarget == null ? null : bsTarget.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column base_setting.BS_CSS
     *
     * @return the value of base_setting.BS_CSS
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public String getBsCss() {
        return bsCss;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column base_setting.BS_CSS
     *
     * @param bsCss the value for base_setting.BS_CSS
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public void setBsCss(String bsCss) {
        this.bsCss = bsCss == null ? null : bsCss.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column base_setting.MODIFY_TIME
     *
     * @return the value of base_setting.MODIFY_TIME
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public Date getModifyTime() {
        return modifyTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column base_setting.MODIFY_TIME
     *
     * @param modifyTime the value for base_setting.MODIFY_TIME
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column base_setting.MODIFIER
     *
     * @return the value of base_setting.MODIFIER
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public String getModifier() {
        return modifier;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column base_setting.MODIFIER
     *
     * @param modifier the value for base_setting.MODIFIER
     *
     * @mbggenerated Thu May 04 08:21:10 CST 2017
     */
    public void setModifier(String modifier) {
        this.modifier = modifier == null ? null : modifier.trim();
    }
}