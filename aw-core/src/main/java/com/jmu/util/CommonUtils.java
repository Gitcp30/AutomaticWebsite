package com.jmu.util;

/**
 * @Description: 通用工具类
 * @author: zhouzunrong
 * @create: 2017-04-24 22:12
 * @version: 1.0
 **/
public class CommonUtils {

    public static String createVerificationCode(){
        return((int)((Math.random()*9+1)*100000))+"";
    }
}