package com.ebooklibrary.app.library.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
/*public class LoginInterceptor extends HandlerInterceptorAdapter 
implements HandlerInterceptor*/

public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger=
			LoggerFactory.getLogger(LoginInterceptor.class);
	
	/*
	  
	 	HandlerInterceptor
	 	
	 	memberEdit.do=> DispatcherServlet => HandlerMapping
	 		[1]=>preHandle() - 컨트롤러 실행전 실행되는 메서드
	 	=>해당 Controller의 Handler
	 		[2]=>postHandler() - 컨트롤러 실행후 호출
	 	=>뷰
	 		[3]=>afterCompletion() - 뷰 생성후 호출
	*/
	

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object arg2)
			throws Exception {
		//일반사용자 로그인처리
		logger.info("일반사용자용 인터셉터");
		String uri=request.getRequestURI();		
		//로그인이 안된경우 먼저 로그인 하도록 에러 처리
		HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("userId");
		
		/*if(uri.indexOf("/mybooks/mybookmain.do")!=-1){
			if(userid==null || userid.isEmpty()){
				request.setAttribute("msg", "먼저 로그인 하세요");
				request.setAttribute("url", "/member/loginForm.do");
				RequestDispatcher dispatcher
				=request.getRequestDispatcher("/WEB-INF/views/common/message.jsp");
				
				dispatcher.forward(request, response);
				return false;//컨트롤러 가 실행되지 않음
			}
		}*/
		
		if(userid==null || userid.isEmpty()){
			request.setAttribute("msg", "먼저 로그인 하세요");
			request.setAttribute("url", "/member/login.do");
			RequestDispatcher dispatcher
			=request.getRequestDispatcher("/WEB-INF/views/common/message.jsp");
			
			dispatcher.forward(request, response);
			return false;//컨트롤러 가 실행되지 않음
		}else{
			return true;//다음 컨트롤러 실행
		}		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
	
	
	
}
