<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이벤트 등록</title>
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
		<input type="submit" value="등록">	
	</form>
</body>
</html>