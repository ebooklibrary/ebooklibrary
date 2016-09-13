package com.ebooklibrary.app.email;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component
public class EmailPwdsearch {
	private static final Logger logger=
			LoggerFactory.getLogger(EmailPwdsearch.class);
	
	@Autowired
	private EmailSender emailSender;
	
	public String emailSender(String userId){
		logger.info("임시 비밀번호 이메일로 보내기");
		String random[]={"0","1","2","3","4",
				"5","6","7","8","9","A","B","C","D"
				,"E","F","G","H","I","J","K","L","M"
				,"N","O","P","Q","R","S","T","U","V"
				,"W","X","Y","Z"};
		String result="";
		for(int i=0;i<14;i++){
			int num=(int)(Math.random()*36);			
			result+=random[num];
		}
		EmailVO vo=new EmailVO();
		vo.setReceiver(userId);
		vo.setSubject("포도서관 임시 비밀번호 메일입니다");
		String content="임시 비밀번호는 : "+result+" 입니다<br>"
				+ "임시비밀번호는 http://192.168.0.6:9090/ebooklibrary/member/login.do<br>"
				+ "에서 임시 비밀번호로 로그인후 비밀번호를 변경해주세요";
		vo.setContent(content);
		vo.setSender("admin@podolibrary.co.kr");
		logger.info("임시비밀번호 : "+result);
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
