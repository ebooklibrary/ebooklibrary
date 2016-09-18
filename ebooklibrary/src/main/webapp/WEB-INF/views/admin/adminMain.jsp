<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="libraryAdminTop.jsp" %>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>
<script type="text/javascript">
	$(function() {		
		$("#btnapi").click(function() {
			window.open("<c:url value='http://admin.iamport.kr/payments'/>",
					"iamport",
			"width=1500,height=800,left=50,top=50,resizable=yes,location=yes");
		})//button
		
		$("#event1").click(function() {
			window.open("<c:url value='/event/eventWrite.do'/>",
					"event",
			"width=700,height=450,left=50,top=50,resizable=yes,location=yes");
		});
		
	})

</script>
관리자 메인페이지<br>
<button id="btnapi">매출 전표 페이지</button>
<c:import url="/event/mainEvent.do"></c:import>

<button id="event1">이벤트 이미지등록</button>


<%@ include file="libraryAdminBottom.jsp" %>