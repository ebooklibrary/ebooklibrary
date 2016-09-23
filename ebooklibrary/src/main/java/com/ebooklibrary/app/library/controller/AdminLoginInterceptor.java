package com.ebooklibrary.app.library.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class AdminLoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger=
			LoggerFactory.getLogger(AdminLoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("컨트롤러 수행전 호출 - preHandle()");
		
		//uri 읽어오기
		String uri=request.getRequestURI();
		//에러처리시 관리자 로그인페이지는 걸러낸다
		//http://localhost:9090/springherb/admin/login/adminLogin.do
		//uri=/springherb/admin/login/adminLogin.do
		logger.info("uri={}",uri);
		if(uri.indexOf("/admin/login/adminLogin.do")!=-1){
			return true;//에러처리하지 않는다
		}
		if(uri.indexOf("/admin/book/bookList.do")!=-1){
			return true;
		}
		if(uri.indexOf("/admin/book/bookDetail.do")!=-1){
			return true;
		}
		HttpSession session=request.getSession();
		String adminUserId=(String)session.getAttribute("adminUserId");
		//관리자 로그인되지 않은 경우 에러 처리
		if(adminUserId==null || adminUserId.isEmpty()){
			request.setAttribute("msg", "먼저 관리자 로그인 하세요");
			request.setAttribute("url", "/admin/login/adminLogin.do");
			RequestDispatcher dispatcher
			=request.getRequestDispatcher("/WEB-INF/views/common/message.jsp");
			dispatcher.forward(request, response);
			return false;
		}else{
			return true;			
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
	
	
}
