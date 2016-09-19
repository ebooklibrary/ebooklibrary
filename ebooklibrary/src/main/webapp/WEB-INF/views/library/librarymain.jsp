<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="libraryTop.jsp" %>

<%@include file="mainInclude/m_search.jsp" %>
<c:import url="/event/mainEvent.do"></c:import>
<%-- <%@include file="mainInclude/month_book.jsp" %> --%>
<%@include file="mainInclude/mybook.jsp" %>
<c:import url="/library/notice/mainNotice.do"></c:import>

<%@ include file="libraryBottom.jsp"%>