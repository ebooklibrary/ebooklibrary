<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../libraryTop.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/silde_Notice/style.css" />

<script type="text/javascript"
	src="<c:url value ='/jquery/silde_Notice/jquery.js'/>"></script>

<script type="text/javascript">

$(document).ready(function(){
	$("#container_out").css("background","url(../../images/library/notice/noticeBackground.png) no-repeat center");
});

</script>
<div id ="ServiceCenter_head">
	<h1>고객 센터</h1>
</div>

<div>
	<p>고객센터 정보</p>
</div>
<div>
	<a href="#">1:1 문의</a>
</div>
<div>
	<a href="<c:url value='/library/notice/noticelist.do'/>">공지사항</a>
</div>
<div id="ServiceCenter_body">
	<h1>고객센터</h1>
	<p id="ServiceCenter_bodyP1"><img src="${pageContext.request.contextPath}/images/library/ServiceCenter/phone.png" alt="전화" style="width: 25px; height: 25px;">&nbsp 전화번호 : 02-000-0000</p>
	<p id="ServiceCenter_bodyP2">평일 09:00~18:00 주말 공휴일 휴일은 쉽니다.</p>
</div>
<%@include file="../libraryBottom.jsp"%>