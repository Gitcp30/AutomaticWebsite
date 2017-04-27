package com.jmu.service.impl;

import com.jmu.entity.Email;
import com.jmu.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * @Description: 发送邮箱服务实现类
 * @author: zhouzunrong
 * @create: 2017-04-24 21:44
 * @version: 1.0
 **/
@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    private JavaMailSender mailSender;

    @Override
    public void sendEmail(Email email) {
        // 发送附件方式
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = null;
        try {
            helper = new MimeMessageHelper(message,true);
            helper.setFrom(email.getFrom()!=null?email.getFrom():"931998400@qq.com");
            helper.setTo(email.getTo());
            helper.setSubject(email.getSubject());
            helper.setText(email.getText(),true);
            mailSender.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }


       /* // 发送简单文本
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setFrom(email.getFrom()!=null?email.getFrom():"931998400@qq.com");
        simpleMailMessage.setTo(email.getTo());
        simpleMailMessage.setSubject(email.getSubject());
        simpleMailMessage.setText(email.getText());
        mailSender.send(simpleMailMessage);*/
    }
}