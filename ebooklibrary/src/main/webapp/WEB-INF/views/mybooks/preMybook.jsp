<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mybook/readbook.css" />
		 <div id="custom-goto"></div>
	<div id="display"></div>
	<!-- 
	<div id="custom-menu"></div>
	 -->
	 <p id="titleP"><span>${title }</span><span>페이지 이동 안될 시 책 모양 아이콘을 클릭하여 주십시오.</span></p>
	 
	<div id="wrapper">
		<div id="pageSelDiv">
			 <span>페이지 입력 : </span><input type="text" name="pageSel" id="pageSel">
			 <!-- <input type="button" name="pageSelBt" id="pageSelBt" value="페이지 가기"> -->
			 <img alt="페이지선택" name="pageSelBt" id="pageSelBt" src="<c:url value='/images/mybook/icon/openbook32.png'/>">
		 </div>
		 
		<div id="mybook">
	    	<c:forEach var="al" items="${alist }">
			    <div class="test1">
					<div>${al }</div>
			    </div>
	    	</c:forEach>
		</div>
	
	</div>