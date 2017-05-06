package com.jmu.domain;

import java.io.Serializable;
import java.util.Date;

public class WebBannerImg implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column web_banner_img.BANNER_IMG_ID
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    private String bannerImgId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column web_banner_img.COMPANY_ID
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    private String companyId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column web_banner_img.BANNER_PIC
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    private String bannerPic;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column web_banner_img.PIC_URL
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    private String picUrl;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column web_banner_img.MODIFY_TIME
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    private Date modifyTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column web_banner_img.MODIFIER
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    private String modifier;




    public WebBannerImg() {
    }



    public WebBannerImg(String bannerImgId, String companyId, String bannerPic, String picUrl, String modifier) {
        this.bannerImgId = bannerImgId;
        this.companyId = companyId;
        this.bannerPic = bannerPic;
        this.picUrl = picUrl;
        this.modifier = modifier;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column web_banner_img.BANNER_IMG_ID
     *
     * @return the value of web_banner_img.BANNER_IMG_ID
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    public String getBannerImgId() {
        return bannerImgId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column web_banner_img.BANNER_IMG_ID
     *
     * @param bannerImgId the value for web_banner_img.BANNER_IMG_ID
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    public void setBannerImgId(String bannerImgId) {
        this.bannerImgId = bannerImgId == null ? null : bannerImgId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column web_banner_img.COMPANY_ID
     *
     * @return the value of web_banner_img.COMPANY_ID
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    public String getCompanyId() {
        return companyId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column web_banner_img.COMPANY_ID
     *
     * @param companyId the value for web_banner_img.COMPANY_ID
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    public void setCompanyId(String companyId) {
        this.companyId = companyId == null ? null : companyId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column web_banner_img.BANNER_PIC
     *
     * @return the value of web_banner_img.BANNER_PIC
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    public String getBannerPic() {
        return bannerPic;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column web_banner_img.BANNER_PIC
     *
     * @param bannerPic the value for web_banner_img.BANNER_PIC
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    public void setBannerPic(String bannerPic) {
        this.bannerPic = bannerPic == null ? null : bannerPic.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column web_banner_img.PIC_URL
     *
     * @return the value of web_banner_img.PIC_URL
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    public String getPicUrl() {
        return picUrl;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column web_banner_img.PIC_URL
     *
     * @param picUrl the value for web_banner_img.PIC_URL
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl == null ? null : picUrl.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column web_banner_img.MODIFY_TIME
     *
     * @return the value of web_banner_img.MODIFY_TIME
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    public Date getModifyTime() {
        return modifyTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column web_banner_img.MODIFY_TIME
     *
     * @param modifyTime the value for web_banner_img.MODIFY_TIME
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column web_banner_img.MODIFIER
     *
     * @return the value of web_banner_img.MODIFIER
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    public String getModifier() {
        return modifier;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column web_banner_img.MODIFIER
     *
     * @param modifier the value for web_banner_img.MODIFIER
     *
     * @mbggenerated Sat May 06 20:19:54 CST 2017
     */
    public void setModifier(String modifier) {
        this.modifier = modifier == null ? null : modifier.trim();
    }
}