<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/rolling/jq.rolling.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/rolling/jquery-ui.min.js'/>"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jquery/rolling/jq.rolling.css" />
<script type="text/javascript">
	$(document).ready(function(){
		$("#rolling").rolling(1280,270,{autoscroll:1, delay:2200});
		
	});
</script>
<!-- 이달의 책 -->

<div id="month_book">
	<div>
		<div id="rolling">
			<ul>
				<li class="sp01">SAMPLE 01</li>
				<li class="sp02">SAMPLE 02</li>
				<li class="sp03">SAMPLE 03</li>
				<li class="sp04">SAMPLE 04</li>
				<li class="sp05">SAMPLE 05</li>
			</ul>
		</div>
		<ul class="pages"></ul>
	</div>
</div>

<!-- 이달의 책 -->