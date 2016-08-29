<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko"> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>포도서관</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/main_all.css" />
<script type="text/javascript" src="<c:url value='/jquery/js_scroll.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/js.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">

</script>
</head>
<body>
<!--container_out-->
<div id="container_out">

<!-- 옆에붙을 메뉴 -->
<div id="rightmenu">
	<div class="menuform">
	
	</div>
	<div class="menuform">
	
	</div>
	<div class="menuform">
	
	</div>
	<div class="menuform">
	
	</div>
</div>


	<!--container-->
	<!-- <div id="container"> -->
		<!--skipnavigation Start-->
		<!-- <dl id="skipnavigation">
		 <dt><strong class="skip">바로가기 메뉴</strong></dt>
		 <dd><a href="#topmenu" class="skip_navi">메인메뉴 바로가기</a></dd>
		</dl>
	<noscript>*  본 브라우저는 스크립트를 지원하지 않습니다. 홈페이지가 정상적으로 보이지 않을때는 최신 브라우저를 설치하여 사용하시길 권장합니다.</noscript> -->
	<!--//#skipnavigation End--> 
<!--header Start--> 
  <div id="header">  
  <!--logo Start--> 
	 <h2 class="skip">로고</h2>
	 	 <div id="logo"><a href="<c:url value='/library/librarymain.do'/>">
	 	 로고
	 	 </a></div>
  <!--//#logo End-->
	<!--global_menu Start-->
	<h2 class="skip">글로벌메뉴</h2>
	<div id="gnb">      
		<ul id="global">
            <li class="first">
            <a href="<c:url value='/index.do'/>">
            <!-- <img src="/images/gmi/inc/gnb_home.gif" alt="첫화면" /> -->
            첫화면
            </a></li>
			
			<li>
			<a href="<c:url value='/member/login.do'/>">
			<!-- <img src="/images/gmi/inc/gnb_login.gif" alt="로그인" /> -->
			로그인
			</a></li>
            <li>
            <a href="<c:url value='/member/register.do'/>">
            <!-- <img src="/images/gmi/inc/gnb_join.gif" alt="회원가입" /> -->
            회원가입
            </a></li>
			 
            <li class="last">
            <a href="/html/06_sitemap/sitemap.asp">
            <!-- <img src="/images/gmi/inc/gnb_sitemap.gif" alt="사이트맵" /> -->
            사이트맵
            </a></li>
		</ul>
    </div>
	<!--//#gnb_menu-->
	
</div>
<!--header end-->
<!-- include top -->