package com.ebooklibrary.app.email;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmailController {
	private static final Logger logger=
			LoggerFactory.getLogger(EmailController.class);
	
	@Autowired
	private EmailSender emailSender;
	
	@RequestMapping("/emailConfirm.do")
	@ResponseBody
	public String emailSender(@ModelAttribute EmailVO vo){
		logger.info("이메일 인증");
		String result="";
		for(int i=0;i<6;i++){
			int random=(int)(Math.random()*10);
			result+=random;
		}
		vo.setSubject("포도서관 인증번호 메일입니다");
		vo.setContent("인증 번호는 : "+result+" 입니다");
		vo.setSender("admin@podolibrary.co.kr");
		logger.info("인증번호 : "+result);
		try {
			emailSender.sendEmail(vo);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
