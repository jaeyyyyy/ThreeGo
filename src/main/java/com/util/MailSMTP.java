package com.util;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Map;
import java.util.Properties;

public class MailSMTP {
    private final Properties serverInfo;
    private final Authenticator auth;

    public MailSMTP() {
        // 네이버 SMTP 서버 접속 정보
        serverInfo = new Properties();
        serverInfo.put("mail.smtp.host", "smtp.gmail.com");
        serverInfo.put("mail.smtp.port", "465");
        serverInfo.put("mail.smtp.starttls.enable", "true");
        serverInfo.put("mail.smtp.auth", "true");
        serverInfo.put("mail.smtp.debug", "true");
        serverInfo.put("mail.smtp.socketFactory.port", "465");
        serverInfo.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        serverInfo.put("mail.smtp.socketFactory.fallback", "false");

        //사용자 인증정보
        auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("t3reego@gmail.com", "nnpl vskg fkep zwqk");
            }
        };
    }

    public void emailSending(Map<String, String> mailInfo) throws MessagingException {
        Session session = Session.getInstance(serverInfo, auth);
        session.setDebug(true);

        //메세지 작성
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(mailInfo.get("from")));
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(mailInfo.get("to")));
        msg.setSubject(mailInfo.get("subject"));
        msg.setContent(mailInfo.get("content"), mailInfo.get("format"));

        Transport.send(msg);
    }
}
