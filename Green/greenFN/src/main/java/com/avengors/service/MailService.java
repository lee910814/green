package com.avengors.service;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class MailService {
	
	public String getAuthNumber() {
		Random ran = new Random();
		String authNumber = "";
		
		for(int i = 0; i < 6; i++) {
			authNumber += ran.nextInt(9);
		}
		return authNumber;
	}

	public String sendMail(String mailAddress, String authNumber, String account) {
		
		String host = "smtp.naver.com";
		int port = 465;
		final String username = account.split("/")[0];
		System.out.println(username);
		final String password = account.split("/")[1];
		System.out.println(password);
		
		String subject = "[GREEN] 인증번호 입니다.";
		String body = String.format("인증번호는 [%s]입니다 \n\n", authNumber);
		
		Properties props = System.getProperties();
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.trust", host);
		
		Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
			String un = username;
			String pw = password;
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		mailSession.setDebug(true);
		
		
		Message mimeMessage = new MimeMessage(mailSession);
		
		try {
			mimeMessage.setFrom(new InternetAddress(username + "@naver.com"));
			
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(mailAddress));
			
			mimeMessage.setSubject(subject);
			mimeMessage.setText(body);
			
			Transport.send(mimeMessage);
			
		} catch(MessagingException e) {
			return "주소가 잘못되었습니다";
		}
		
		return authNumber;
	}
}
