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
<div id="ServiceCenter_head">
	<h1>고객 센터</h1>
</div>
<div id ="serivceCenter_1">
	<div>
		<a href="<c:url value ='/library/serviceCenter/questionWrite.do'/>">1:1
			문의 하기</a>
	</div>
	<div>아이디 찾기</div>
	<div>비밀번호 찾기</div>
	<div><a href="<c:url value='/library/serviceCenter/myQuestion.do?memberNo=${alist.memberNo }'/>">문의 내역확인</a></div>
</div>
<div id="ServiceCenter_body">
	<img src ="${pageContext.request.contextPath }/images/library/ServiceCenter/service.png"
	 alt="고객센터" style="width:250px; height :60px; margin-right:440px;" >
</div>


<c:import url="/library/serviceCenter/serviceNotice.do"></c:import>

<div id="serviceCenter_2">
	<p id="ServiceCenter_bodyP1">
		<img
			src="${pageContext.request.contextPath}/images/library/ServiceCenter/phone.png"
			alt="전화" style="width: 25px; height: 25px;">&nbsp 전화번호 :
		02-000-0000
	</p>
	<p id="ServiceCenter_bodyP2">평일 09:00~18:00 주말 공휴일 휴일은 쉽니다.</p>
</div>
<%@include file="../libraryBottom.jsp"%>