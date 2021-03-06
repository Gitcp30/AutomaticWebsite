package com.jmu.entity;

/**
 * @Description: 邮箱发送实体
 * @author: zhouzunrong
 * @create: 2017-04-24 21:40
 * @version: 1.0
 **/
public class Email {

    private String from;
    private String to;
    // 标题
    private String subject;
    private String text;

    public Email(){

    }

    public Email(String to, String subject, String text) {
        this.to = to;
        this.subject = subject;
        this.text = text;
    }

    public Email(String from, String to, String subject, String text) {
        this.from = from;
        this.to = to;
        this.subject = subject;
        this.text = text;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}