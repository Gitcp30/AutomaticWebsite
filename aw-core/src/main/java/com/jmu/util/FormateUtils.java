package com.jmu.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @Description: 格式验证工具类
 * @author: zhouzunrong
 * @create: 2017-04-23 10:51
 * @version: 1.0
 **/
public class FormateUtils {

    /**
     * 验证邮箱格式
     * @param email
     * @return
     */
    public static Boolean isEmailBox(String email){
        boolean flag = false;
        try{
            String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
            Pattern regex = Pattern.compile(check);
            Matcher matcher = regex.matcher(email);
            flag = matcher.matches();
        }catch(Exception e){
            flag = false;
        }
        return flag;
    }

    public static void main(String[] args) {
        System.out.println(isEmailBox("14_8@qw.df.com"));
    }
}