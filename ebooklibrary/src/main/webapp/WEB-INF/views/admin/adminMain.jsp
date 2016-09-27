<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="libraryAdminTop.jsp" %>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>
<script type="text/javascript">
	$(function() {		
		$("#btnapi").click(function() {
			window.open("<c:url value='http://admin.iamport.kr/payments'/>",
					"iamport",
			"width=1500,height=800,left=50,top=50,resizable=yes,location=yes");
		});//button
		/* 
		$("#event1").click(function() {
			window.open("<c:url value='/event/eventWrite.do'/>",
					"event",
			"width=700,height=450,left=50,top=50,resizable=yes,location=yes");
		});
		 */
		 
	});

</script>
<p id="adminTitleP"><img alt="아이콘" src="<c:url value='/images/mybook/icon/process.png'/>"> 관리자 초기 페이지</p>

	<p id="adminMainContentP">
		${sessionScope.adminUserId }님 환영합니다.
		이곳은 관리자 페이지입니다. 
	</p>
 
<%-- <c:import url="/admin/statisticsAdmin.do"></c:import> --%>
<%@ include file="libraryAdminBottom.jsp" %>