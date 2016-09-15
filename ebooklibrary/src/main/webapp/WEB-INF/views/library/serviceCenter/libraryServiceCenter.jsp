<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../libraryTop.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/silde_Notice/style.css" />

<script type="text/javascript"
	src="<c:url value ='/jquery/silde_Notice/jquery.js'/>"></script>

<script type="text/javascript">

$(document).ready(function(){
	$("#container_out").css("background","url(../../images/library/notice/noticeBackground.png) no-repeat center");
});

</script>



<%@include file="../libraryAd.jsp"%>


<%@include file="../libraryBottom.jsp"%>