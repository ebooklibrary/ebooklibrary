<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>북코인 충전</title>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>
<script type="text/javascript">
	$(function() {
		//alert($("[input type=checkbox:selected]").val())		
	});
</script>
</head>
<body>
	<label id="3000">3000코인 </label>
	<input type="checkbox" name="cash" value="3000" id="3000" checked="checked">
	<label id="5000">5000코인 </label>
	<input type="checkbox" name="cash" value="5000" id="5000">
	<label id="10000">10000코인 </label>
	<input type="checkbox" name="cash" value="10000" id="10000">
	<label id="20000">20000코인 </label>
	<input type="checkbox" name="cash" value="20000" id="20000">
	<label id="30000">30000코인 </label>
	<input type="checkbox" name="cash" value="30000" id="30000">
	<button>북코인 충전</button>
</body>
</html>