<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value='/jquery/jquery-ui.css'/>"
	type="text/css">	
<script src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"
	type="text/javascript"></script>
<script src="<c:url value='/jquery/jquery-ui.js'/>"
	type="text/javascript"></script>
<title>이벤트 등록</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#endDay").datepicker({
			dateFormat:"yy-mm-dd",
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월',
			            '7월','8월','9월','10월','11월','12월']
		});
	});
</script>		
</head>
<body>
	<form action="" method="post" enctype="multipart/form-data">
		이벤트 이름 : <input type="text" id="eventName" name="eventName"><br>
		이벤트 종류 : 
		<select id="eventKind" name="eventKind">
			<option value="1">메인 이벤트</option>
			<option value="2">추천 도서</option>
			<option value="3">베스트 셀러</option>			
		</select><br>
		이벤트 사진 : <input type="file" id="eventImageUrl" name="eventimageUrl"><br>
		이벤트 경로 : <input type="text" id="eventUrl" name="eventUrl"><br>	
		이벤트 종료일 : <input type="text" name="endDay" id="endDay" readonly="readonly">
		<input type="submit" value="등록">	
	</form>
</body>
</html>