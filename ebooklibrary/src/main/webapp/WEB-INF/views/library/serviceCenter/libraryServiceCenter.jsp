<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../libraryTop.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/silde_Notice/style.css" />

<script type="text/javascript"
	src="<c:url value ='/jquery/silde_Notice/jquery.js'/>"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#container_out")
								.css("background",
										"url(../../images/library/notice/noticeBackground.png) no-repeat center");
					});
</script>
<div id="ServiceCenter_body">
	<img
		src="${pageContext.request.contextPath }/images/library/ServiceCenter/service.png"
		alt="고객센터" style="width: 250px; height: 60px; margin-right: 430px;">
</div>
<c:import url="/library/serviceCenter/faq/bestFaq.do"></c:import>

<div id="serviceCenter_2">
	<p id="ServiceCenter_bodyP1">
		<img
			src="${pageContext.request.contextPath}/images/library/ServiceCenter/phone.png"
			alt="전화" style="width: 25px; height: 25px;">&nbsp 전화번호 :
		02-000-0000
	</p>
	<p id="ServiceCenter_bodyP2">평일 09:00~18:00 ｜ 점심시간 12:50 ~ 14:00 ｜ 주말 공휴일 휴무 </p>
</div>
<nav class ="Sercive_Nav">
	<ul>
		<li><a
			href="<c:url value ='/library/serviceCenter/questionWrite.do'/>">1:1
				문의 하기</a></li>
		<li><a href="#">아이디 찾기</a></li>
		<li><a href="#">비밀번호 찾기</a></li>
		<il> <a
			href="<c:url value='/library/serviceCenter/myQuestion.do?memberNo=${alist.memberNo }'/>">문의
			내역확인</a> </il>
	</ul>
</nav>

<c:import url="/library/serviceCenter/serviceNotice.do"></c:import>

<%@include file="../libraryBottom.jsp"%>