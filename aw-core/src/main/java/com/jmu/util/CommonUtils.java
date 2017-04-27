package com.jmu.util;

import org.apache.commons.lang3.StringUtils;

import java.security.MessageDigest;

/**
 * @Description: 通用工具类
 * @author: zhouzunrong
 * @create: 2017-04-24 22:12
 * @version: 1.0
 **/
public class CommonUtils {

    /**
     * 创建6位验证码
     * @return
     */
    public static String createVerificationCode(){
        return((int)((Math.random()*9+1)*100000))+"";
    }

    /**
     * MD5加密
     * @param s
     * @return
     */
    public static String MD5(String s) {
        char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
        try {
            byte[] btInput = s.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    /**
     * 创建系统账号
     * @param mailbox
     * @return
     */
    public static String createSysAccount(String mailbox){
        String[] strings = StringUtils.split(mailbox,"@");
        if (strings.length>0){
            return "aw_" +strings[0];
        }
        return null;
    }
}