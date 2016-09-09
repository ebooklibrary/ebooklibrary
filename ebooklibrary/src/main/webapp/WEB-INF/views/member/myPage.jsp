<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../library/libraryTop.jsp" %>
<div id="myPage_leftMenu">
	<div>내정보 수정</div>
	<div>주문내역</div>
	<div>회원탈퇴</div>
</div>
<div>
<h1>내정보</h1>
<span>아이디 : </span><span>${memberVo.userId }</span><br>
<span>이름 : </span><span>${memberVo.userName }</span><br>
<span>전화번호 : </span><span>${memberVo.hp1 } - ${memberVo.hp2 } - ${memberVo.hp3 }</span><br>
<span>생일 : </span><span>${memberVo.birth }</span><br>
<span>가입일 : </span><span>${memberVo.regDate }</span><br>
<span>북코인 : </span><span>${memberVo.cash }</span><input type="button" id="btnCharge" value="충전"><br>
<span>내서재 배경화면</span><br>
<c:if test="${!empty memberVo.bgImage }">
<span><div style="background: url(${pageContext.request.contextPath }/images/mybook/${memberVo.bgImage }')"></div>
</c:if>
<c:if test="${empty memberVo.bgImage }">
<span>등록된 배경화면이 없습니다</span>
</c:if>

</div>

<%@ include file="../library/libraryBottom.jsp" %>