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
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".menuform").click(function() {
			var href=$(this).find("a").attr("href");
			$(location).attr('href', href);
		});
	});
</script>
</head>
<body>
<!--container_out-->
<div id="container_out">

<!-- 옆에붙을 메뉴 -->
	<div id="rightmenu">
		<div class="menuform">
			<a style="margin: 2px 0 0 2px;" href="<c:url value='/library/notice/noticelist.do'/>">공지사항<br> 등록/수정</a>
			<div class="menuFlagColor" id="noticeDivColor"></div>
		</div>
		<div class="menuform">
			<a href="<c:url value='/admin/book/registerBook.do'/>">책 등록</a>
			<div class="menuFlagColor" id="bookRegiDivColor"></div>
		</div>
		<div class="menuform">
			<a href="<c:url value='/admin/member/memberList.do'/>">회원 관리</a>
			<div class="menuFlagColor" id="memDivColor"></div>
		</div>
		<div class="menuform">
			<a style="margin: 2px 0 0 2px;" href="<c:url value='/admin/book/bookList.do'/>">책 목록</a>
			<div class="menuFlagColor" id="bookListDivColor"></div>
		</div>
	</div>
  <div id="header">  
  <!--logo Start-->   
	 <h2 class="skip">로고</h2>
	 <%-- 
	 	 <div id="logo"><a href="<c:url value='/library/librarymain.do'/>">
	 	 로고
	 	 </a></div>
	 	  --%>
	 	 <div id="logo"><a href="<c:url value='/library/librarymain.do'/>">
	 	 	<img alt="로고 이미지" src="<c:url value='/images/library/main/logo.JPG'/>">
	 	 </a></div>
  <!--//#logo End-->
	<!--global_menu Start-->
	<h2 class="skip">글로벌메뉴</h2>
	<div id="gnb">      
		<ul id="global">
            <li class="first">
            <a href="<c:url value='/index.do'/>">
            <!-- <img src="/images/gmi/inc/gnb_home.gif" alt="첫화면" /> -->
            관리자 페이지
            </a></li>			
			<c:if test="${!empty sessionScope.userId }">
				<li>
				<a href="<c:url value='/member/logout.do'/>">
				<!-- <img src="/images/gmi/inc/gnb_login.gif" alt="로그인" /> -->
				로그아웃
				</a></li>				
	            <c:if test="${sessionScope.auchCode=='ADMIN' }">
	            <li>
	            <a href="<c:url value='/library/librarymain.do'/>">
	            <!-- <img src="/images/gmi/inc/gnb_join.gif" alt="회원가입" /> -->
	            도서관 페이지
	            </a>
	            </li>
	            </c:if>         
			</c:if>			 
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
<div id="container">
<!-- include top -->