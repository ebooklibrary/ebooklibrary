<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko"> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>포도서관</title>
<!-- 스마트에디터 -->
<script type="text/javascript" src="<c:url value='/smarteditor/js/HuskyEZCreator.js'/>" charset="utf-8"></script>
<!-- W3 폼태그 -->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

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

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/clear.css" />
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
		window.open("<c:url value='/library/memo/toMemo.do'/>",
				"memoList",
		"width=725,height=800,left=50,top=50,resizable=yes,location=yes");		
	});
	
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
	
	//우측 메뉴 장바구니
	if(${!empty sessionScope.userId}){
		$.ajax({
			url:"<c:url value='/library/mainCart.do'/>",
			data:"userId=${sessionScope.userId}",			
			type:"GET",
			dataType:"json",
			success:function(res){
				/* alert("응답결과, 개수:"+res.length); */
				
				if (res.length>0) {
					var result="<p>장바구니 목록</p>";
					$.each(res, function(idx,item) {
						result+="<p>"+item.title+"</p>";
					});
					result+="<p><a href='<c:url value='/shop/cart/cartList.do'/>'>구매 페이지</a></p>";
					$("#sidecartDiv").html(result);
				}
			},
			error:function(xhr, status, error){
				alertify.alert(status+":"+error);
			}
		});//ajax
	}//if
	
	
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
		<a href="<c:url value='/library/qna/qnaList.do'/>">QNA</a>
		<!-- <div class="menuFlagColor" id="qnaDivColor"></div> -->
	</div>
	<div class="menuform">
		<a href="<c:url value='/library/notice/noticelist.do'/>"> 
		공지사항
		</a>
		<!-- <div class="menuFlagColor" id="noticeDivColor"></div> -->
	</div>
	<div class="menuform">
		<a href="<c:url value='/book/bookList.do'/>">책검색</a>
		<!-- <div class="menuFlagColor" id="schDivColor"></div> -->
	</div>
	<div class="menuform" id="lastMenuForm">
		<a href="<c:url value='/library/request/requestList.do'/>">요청게시판</a>
		<!-- <div class="menuFlagColor" id="requestDivColor"></div> -->
	</div>
	<%-- <div class="menuform" id="lastMenuForm">
		<a href ="<c:url value='/library/serviceCenter/libraryServiceCenter.do'/>">고객센터</a>
	</div> --%>
	
	<c:if test="${!empty sessionScope.userId }">
	<!-- 사이드 메뉴 장바구니 -->
	<div id="sidecartDiv" class="menuformBottom">
		<%-- <p><a href="<c:url value='/shop/cart/cartList.do'/>">구매 페이지</a></p> --%>
	</div>
	</c:if>
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
				<a href="<c:url value='/mybooks/mybookmain.do'/>">내 서재</a>
            	</li>
				<li>
				<a href="#" id="memoList">쪽지(<span id="memoCount"></span>)
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
	
	<!--logo Start-->   
	<h2 class="skip">로고</h2>
		 <div id="logo"><a href="<c:url value='/library/librarymain.do'/>">
	<img alt="로고 이미지" src="<c:url value='/images/library/main/logo.JPG'/>">
	</a></div>
	<!--//#logo End-->
	
	
	
</div>
<!--header end-->
	<div id="menuController">
		<span class="menuBut" onclick="openNav()">&#9776; menu open</span>
		<a href="javascript:void(0)" class="menuBut" onclick="closeNav()">&times; menu close</a>
	</div>
  
<div id="container">
<!-- include top -->