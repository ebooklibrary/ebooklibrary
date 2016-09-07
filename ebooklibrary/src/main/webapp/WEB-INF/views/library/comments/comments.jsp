<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table>
	<caption>댓글</caption>
	<colgroup>
		<col style="width:20%;" />
		<col style="width:65%;" />
		<col style="width:15%;" />
	</colgroup>
	<tbody>
		<tr>
			<td>${sessionScope.userName }</td>
			<td>${param.content }</td>
			<td>${param.regDate }</td>
		</tr>
	</tbody>
</table>