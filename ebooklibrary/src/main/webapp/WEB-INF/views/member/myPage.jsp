<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../library/libraryTop.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/member.css" />

<div id="myPageInfoDiv">
<p>내정보</p>
<p><span class="mpSpanInfo">아이디 </span><span class="mpSpanVal">${memberVo.userId }</span></p>
<p><span class="mpSpanInfo">이름 </span><span class="mpSpanVal">${memberVo.userName }</span></p>
<p><span class="mpSpanInfo">전화번호 </span>
<c:if test="${!empty memberVo.hp2 }">
<span class="mpSpanVal">${memberVo.hp1 } - ${memberVo.hp2 } - ${memberVo.hp3 }</span>
</c:if>
</p>
<p><span class="mpSpanInfo">생일 </span><span class="mpSpanVal">${memberVo.birth }</span></p>
<p><span class="mpSpanInfo">가입일 </span><span class="mpSpanVal"><fmt:formatDate value="${memberVo.regDate }" pattern="yyyy-MM-dd"/></span></p>
<p><span class="mpSpanInfo">북코인 </span><input type="button" id="btnCharge" value="충전"><span class="mpSpanVal">${memberVo.cash }</span></p>
<span class="mpSpanInfo">내서재 배경화면</span><br>
<c:if test="${!empty memberVo.bgImage }">
<div class="mpSpanVal" style="width: 60px;height: 60px;background-image: url('${pageContext.request.contextPath}/backimg/${memberVo.bgImage }');
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
"></div>
</c:if>
<c:if test="${empty memberVo.bgImage }">
<span class="mpSpanVal">등록된 배경화면이 없습니다</span>
</c:if>
</div>

<div id="myPage_leftMenu">
	<div class="danger">
	  <p><a href="<c:url value='/member/myInfoChk.do'/>">내정보 수정</a></p>
	</div>
	
	<div class="success">
	  <p>비밀번호 변경</p>
	</div>
	
	<div class="info">
	  <p>주문내역</p>
	</div>
	
	<div class="warning">
	  <p>회원탈퇴</p>
	</div>
</div>
<%-- 
<div id="myPage_leftMenu">
	<div><a href="<c:url value='/member/myInfoChk.do'/>">내정보 수정</a></div>
	<div>비밀번호 변경</div>
	<div>주문내역</div>
	<div>회원탈퇴</div>
</div>
 --%>
<%@ include file="../library/libraryBottom.jsp" %>