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

<!-- alert -->
<!-- ideally at the bottom of the page -->
<!-- also works in the <head> -->
<%-- <c:url value='/alertify.js-0.3.11/themes/alertify.core.css'/> --%>
<script src="<c:url value='/alertify.js-0.3.11/lib/alertify.min.js'/>"></script>
<!-- include the core styles -->
<link rel="stylesheet" href="<c:url value='/alertify.js-0.3.11/themes/alertify.core.css'/>" />
<%-- <link rel="stylesheet" href="<c:url value='/alertify.js-0.3.11/themes/alertify.bootstrap.css'/>" /> --%>
<!-- include a theme, can be included into the core instead of 2 separate files -->
<link rel="stylesheet" href="<c:url value='/alertify.js-0.3.11/themes/alertify.default.css'/>" />

<!-- W3 폼태그 -->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/main_all.css" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".menuform").click(function() {
			var href=$(this).find("a").attr("href");
			$(location).attr('href', href);
		});
	
		/* 사이드메뉴 */
		$("#menuController a").hide();
		//열기
		$("#menuController span").click(function() {
			$("#rightmenu").css("width", "180px");
			$("#menuController span").hide();
			$("#menuController a").show();
		});
		//닫기
		$("#menuController a").click(function() {
			$("#rightmenu").css("width", "0");
			$("#menuController a").hide();
			$("#menuController span").show();
		});
	});
	/* 
	function openNav() {
	    document.getElementById("rightmenu").style.width = "180px";
	}

	function closeNav() {
	    document.getElementById("rightmenu").style.width = "0";
	}
	 */
</script>
</head>
<body>

<div id="fakeHeader"></div>

<!-- 옆에붙을 메뉴 -->
<div id="rightmenu" class="sidemenu">

	
	<div class="menuform">
		<a style="margin: 2px 0 0 2px;" href="<c:url value='/library/notice/noticelist.do'/>">공지사항</a>
		<!-- <div class="menuFlagColor" id="qnaDivColor"></div> -->
	</div>
	<div class="menuform">
		<a href="<c:url value='/admin/book/registerBook.do'/>">책 등록</a>
	</div>
	<div class="menuform">
		<a href="<c:url value='/admin/member/memberList.do'/>">회원 관리</a>
	</div>
	<div class="menuform">
		<a href="<c:url value='/library/request/requestList.do'/>">요청게시판</a>
	</div>
	<div class="menuform" id="lastMenuForm">
		<a style="margin: 2px 0 0 2px;" href="<c:url value='/admin/book/bookList.do'/>">책 목록</a>
	</div>
	<%-- 
	<c:if test="${!empty sessionScope.userId }">
	<!-- 사이드 메뉴 장바구니 -->
	<div id="sidecartDiv" class="menuformBottom">
		<p><a href="<c:url value='/shop/cart/cartList.do'/>">구매 페이지</a></p>
	</div>
	</c:if>
	 --%>
</div>


<!--container_out-->
<div id="container_out">

  <div id="header">  
	<!--global_menu Start-->
	<h2 class="skip">글로벌메뉴</h2>
	<div id="gnb">      
		<ul id="global">
            <li class="first">
            <a href="<c:url value='/index.do'/>">
            <!-- <img src="/images/gmi/inc/gnb_home.gif" alt="첫화면" /> -->
            관리자 페이지
            </a></li>			
			<c:if test="${!empty sessionScope.adminUserId }">
				<li>
				<a href="<c:url value='/admin/logout.do'/>">
				<!-- <img src="/images/gmi/inc/gnb_login.gif" alt="로그인" /> -->
				로그아웃
				</a></li>				
	            <c:if test="${sessionScope.adminAuchCode=='ADMIN' }">
	            <li>
	            <a href="<c:url value='/library/librarymain.do'/>">
	            <!-- <img src="/images/gmi/inc/gnb_join.gif" alt="회원가입" /> -->
	            도서관 페이지
	            </a>
	            </li>
	            </c:if>         
			</c:if>	
		</ul>
    </div>
	<!--//#gnb_menu-->
	
	<!--logo Start-->   
	<h2 class="skip">로고</h2>
	<div id="logo">
		<a href="<c:url value='/admin/adminMain.do'/>">
			<img alt="로고 이미지" src="<c:url value='/images/library/main/logo.JPG'/>">
		</a>
	</div>
	<!--//#logo End-->
	
</div>
<!--header end-->

	<div id="menuController">
		<span class="menuBut">&#9776; menu open</span>
		<a href="javascript:void(0)" class="menuBut">&times; menu close</a>
	</div>

<div id="container">
<!-- include top -->