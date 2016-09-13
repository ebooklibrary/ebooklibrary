<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지함</title>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>    
<script type="text/javascript" src="<c:url value='/jquery/jquery-ui.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/jquery/jquery-ui.css'/>" />    
<script type="text/javascript">
	$(document).ready(function() {
		$('#tabs').tabs(); // 탭
		
		$('#accordion1').accordion();
		$('#accordion2').accordion({heightStyle: "content"});
	});	
</script>
</head>
<body>
	<div id="tabs" style="width: 700px;height: 800px">
		<ul>
			<li><a id="tab1" href="#tabContent_1">받은 쪽지함</a></li>
			<li><a id="tab2" href="#tabContent_2">보낸 쪽지함</a></li>
			<li><a id="tab3" href="#tabContent_3">쪽지 보내기</a></li>
		</ul>
		<div id="tabContent_1">
			<c:if test="${empty toList }">					
				해당 데이터가 없습니다					
			</c:if>
			<c:if test="${!empty toList }">
				<div><p style="float: left">보낸 사람</p><p style="float: left">제목</p><p style="float: left">보낸 시간</p></div><br>		
					<div id="accordion1" style="clear:both;overflow: hidden;">										
						<c:forEach var="vo" items="${toList }">
							<h3>${vo.toId }${vo.title }${vo.sendDate }</h3>
							<div><p>${vo.content }</p></div>	
						</c:forEach>
					</div>
			</c:if>	
		</div>
		<div id="tabContent_2">
			<c:if test="${empty fromList }">					
				해당 데이터가 없습니다					
			</c:if>
			<c:if test="${!empty fromList }">
				<div><p style="float: left">받은 사람</p><p style="float: left">제목</p><p style="float: left">보낸 시간</p></div><br>		
					<div id="accordion2" style="clear:both;overflow: hidden;height: 80%">										
						<c:forEach var="vo" items="${fromList }">
							<h3>${vo.toId }${vo.title }${vo.sendDate }</h3>
							<div><p>${vo.content }</p></div>	
						</c:forEach>
					</div>
			</c:if>	
		</div>
		<div id="tabContent_3">
			<!-- 쪽지 보내기 -->
			<form action="<c:url value='/library/memo/memoWrite.do'/>" method="post" id="memoWrite">
				<input type="hidden" value="${sessionScope.userId }" name="fromId">
				받는아이디 : <input type="text" name="toId"><br>
				제목 : <input type="text" name="title"><br>
				내용<br>
				<textarea rows="10" cols="70" name="content"></textarea>
				<input type="submit" value="보내기">				
			</form>
		</div>
	</div>
</body>
</html>