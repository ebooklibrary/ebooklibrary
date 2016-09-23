<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/member.css" />    
<div id="myPage_leftMenu">
	<div class="danger">
	  <p><a href="<c:url value='/member/myInfoChk.do?pwdChange=0'/>">내정보 수정</a></p>
	</div>
	
	<div class="success">
	  <p><a href="<c:url value='/member/myInfoChk.do?pwdChange=1'/>">비밀번호 변경</a> </p>
	</div>
	
	<div class="info">
	  <p>
	  <a href="<c:url value='/shop/order/orderList.do'/>">주문내역</a></p>
	</div>
	
	<div class="warning">
	  <p>
	  	<a href="<c:url value='/member/myInfoChk.do?pwdChange=2'/>">회원탈퇴</a>
	  </p>
	</div>
</div>