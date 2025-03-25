package com.mylogin.dao;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.time.LocalDateTime;
import java.util.Properties;
import java.util.UUID;

public class resetService {

    private final int LIMIT_MINUS = 10;
    private final String from = "hieunmde180173@fpt.edu.vn";
    private final String password = "wqpc fhav cjny vxxb";

    public String generateToken() {
        return UUID.randomUUID().toString();
    }

    public LocalDateTime expireDateTime() {
        return LocalDateTime.now().plusMinutes(LIMIT_MINUS);
    }

    public boolean isExpireTime(LocalDateTime time) {
        return LocalDateTime.now().isAfter(time);
    }

    public boolean sendEmail(String to, String link, String name) {
        Properties pros = new Properties();

        pros.put("mail.smtp.host", "smtp.gmail.com");
        pros.put("mail.smtp.port", "587");
        pros.put("mail.smtp.auth", "true");
        pros.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };
        Session session = Session.getInstance(pros, auth);
        MimeMessage msg = new MimeMessage(session);

        try {
            msg.addHeader("Content-type", "text/html; charset=UTF-8");
            msg.setFrom(from);
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            msg.setSubject("Reset Password", "UTF-8");
            String content = "<h1>Hello" + name + "</h1>" + "<p>Click link to reset Password"
                    + " <a href=" + link + ">Click here</a></p>";
            msg.setContent(content, "text/html; charset=UTF-8");
            Transport.send(msg);
            System.out.println("Send Sucessfully");
            return true;
        } catch (Exception e) {
            System.out.println("Send error");
            System.out.println(e);
            return false;
        }

    }
}
