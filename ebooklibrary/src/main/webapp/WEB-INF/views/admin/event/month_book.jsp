<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../admin/libraryAdminTop.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/rolling/jq.rolling.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/rolling/jquery-ui.min.js'/>"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jquery/rolling/jq.rolling.css" />
<script type="text/javascript">
	$(document).ready(function(){
		$("#rolling").rolling(1280,270,{autoscroll:1, delay:2200});
		//alert($(".a").val());
		
		$("#event1").click(function() {
			window.open("<c:url value='/event/eventWrite.do'/>",
					"event",
			"width=700,height=450,left=50,top=50,resizable=yes,location=yes");
		});
	});
</script>
<!-- 이달의 책 -->
	<p id="adminTitleP"><img alt="아이콘" src="<c:url value='/images/mybook/icon/process.png'/>"> 이벤트 등록 페이지</p>
<div id="month_book">
	<div>
		<div id="rolling">
			<ul>
			<c:if test="${!empty alist}">
			<c:set var="n" value="1" />
				<c:forEach var="vo" items="${alist }">					
					<li class="sp0${n }">
					<a href="<c:url value='${vo.eventUrl }'/>">
						<img alt="테스트" 
						src="${pageContext.request.contextPath }/bookevent/${vo.eventImageUrl}" ></a>
					</li>
					<c:set var="n" value="${n+1 }" />
				</c:forEach>
				
			</c:if>
					         
				<!-- <li class="sp02">SAMPLE 02</li>
				<li class="sp03">SAMPLE 03</li>
				<li class="sp04">SAMPLE 04</li>
				<li class="sp05">SAMPLE 05</li> -->
			</ul>
		</div>
		<!-- <ul class="pages"></ul> -->
	</div>
</div>
<button id="event1">이벤트 이미지등록</button>
<!-- 이달의 책 -->
<%@include file="../libraryAdminBottom.jsp"%>