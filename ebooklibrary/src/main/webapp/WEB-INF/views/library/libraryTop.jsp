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
<!-- 스마트에디터 -->
<script type="text/javascript" src="<c:url value='/smarteditor/js/HuskyEZCreator.js'/>" charset="utf-8"></script>

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


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/main_all.css" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/silde_Notice/slide.css" />

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
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>
<script type="text/javascript">
$(function() {
	var memoCount=0;
	if(${!empty sessionScope.userId}){
		$.ajax({
			url:"<c:url value='/library/memo/NewMemoCount.do'/>",
			data:"userId=${sessionScope.userId}",			
			type:"GET",
			success:function(res){
				$("#memoCount").text(res);
				memoCount=res;
			}
		});//ajax
	}//if
	setInterval(function() {
		if(${!empty sessionScope.userId}){
			$.ajax({
				url:"<c:url value='/library/memo/NewMemoCount.do'/>",
				data:"userId=${sessionScope.userId}",
				type:"GET",
				success:function(res){
					$("#memoCount").text(res);
					memoCount=res;
				}
			});//ajax
		}//if
	},3000);
	
	$("#memoList").click(function() {
		window.open("<c:url value='/library/memo/memo.do'/>",
				"memoList",
		"width=725,height=800,left=50,top=50,resizable=yes,location=yes");		
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
		<a href="<c:url value='/library/qna/qnaList.do'/>">QNA</a>
	</div>
	<div class="menuform">
		<a href="<c:url value='/library/notice/noticelist.do'/>"> 
		공지사항
		</a>
	</div>
	<div class="menuform">
		책검색
	</div>
	<div class="menuform">
		<a href="<c:url value='/library/request/requestList.do'/>">요청게시판</a>
	</div>
</div>
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
			<c:if test="${empty sessionScope.userId }">
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
			</c:if>
			<c:if test="${!empty sessionScope.userId }">
				<li>
				<a href="#" id="memoList">				
				쪽지(<span id="memoCount"></span>)
				</a></li>				
				<li>
				<a href="<c:url value='/member/myPage.do'/>">
				<!-- <img src="/images/gmi/inc/gnb_login.gif" alt="로그인" /> -->
				마이페이지
				</a></li>
				<li>
				<a href="<c:url value='/member/logout.do'/>">
				<!-- <img src="/images/gmi/inc/gnb_login.gif" alt="로그인" /> -->
				로그아웃
				</a></li>				
				<li>
	            <a href="<c:url value='/shop/cart/cartList.do'/>">
	            <!-- <img src="/images/gmi/inc/gnb_join.gif" alt="회원가입" /> -->
	            장바구니
	            </a></li>
			</c:if>			 
            <li class="last">
            <a href="<c:url value='/library/siteMap/librarySiteMap.do'/>">
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