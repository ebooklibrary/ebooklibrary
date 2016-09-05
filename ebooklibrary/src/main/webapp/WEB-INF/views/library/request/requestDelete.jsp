<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../libraryTop.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#prePage").click(function(){
			$(location).attr('href', "<c:url value='/library/request/requestDetail.do?requestNo=${param.requestNo}'/>");
		});
	});
</script>
	
	<form name="frmDelete" id="frmDelete" method="post" 
		action="<c:url value='/library/request/requestDelete.do'/>">
		<input type="text" name="requestNo" value="${param.requestNo }"/>
       <div align=center style="line-height:160%;padding:5px;"><b>글을 삭제하시겠습니까?</b>
       </div>
       <br>
    <div height=30>
        <input type=submit class=submit value=" 확  인 " >
        <input type=button id="prePage" value="이전화면" >
	</div>
	</form>
<%@include file="../libraryBottom.jsp" %>