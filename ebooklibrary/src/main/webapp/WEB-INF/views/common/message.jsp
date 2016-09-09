<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- alert -->
<!-- ideally at the bottom of the page -->
<!-- also works in the <head> -->
<%-- <c:url value='/alertify.js-0.3.11/themes/alertify.core.css'/> --%>
<script src="<c:url value='/alertify.js-0.3.11/lib/alertify.min.js'/>"></script>
<!-- include the core styles -->
<link rel="stylesheet" href="<c:url value='/alertify.js-0.3.11/themes/alertify.core.css'/>" />
<%-- <link rel="stylesheet" href="<c:url value='/alertify.js-0.3.11/themes/alertify.bootstrap.css'/>" /> --%>
<!-- include a theme, can be included into the core instead of 2 separate files -->
<link rel="stylesheet" href="<c:url value='/alertify.js-0.3.11/themes/alertify.default.css'/>" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>common/message.jsp</title>
</head>
<body>

	<script type="text/javascript">
	    
	    alertify.set({ buttonReverse: true });
	
		<c:if test="${!empty msg}">
		
		alertify.alert("${msg}", function (e) {
		    if (e) {
		    	location.href
				="${pageContext.request.contextPath}${url}";
		    }
		});
		</c:if>
		<c:if test="${empty msg}">
		location.href="${pageContext.request.contextPath}${url}";
		</c:if>
		
		
		//=>/springweb/pd/pdList.do
	</script>
</body>
</html>








