package com.ebooklibrary.app.email;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailSender {
	private static final Logger logger=
			LoggerFactory.getLogger(EmailSender.class);

	@Autowired
	private JavaMailSender mailSender;
	
	public void sendEmail(EmailVO vo) throws AddressException, MessagingException{
		logger.info("메일 발송 메서드 호출");
		
		MimeMessage message=mailSender.createMimeMessage();
		
		//메일제목
		message.setSubject(vo.getSubject());
		//메일내용
		message.setText(vo.getContent());
		//받는사람
		message.setRecipient(RecipientType.TO, new InternetAddress(vo.getReceiver()));
		//=>보내는사람
		message.setFrom(new InternetAddress(vo.getSender()));
		
		//메일발송
		mailSender.send(message);		
	}
	
}
