<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../libraryAdminTop.jsp" %>
<script type="text/javascript">
	$(function() {
		$("#memDivColor").css("background-color","rgba(0, 250, 250, 0.5)");
		$("#excelSave").click(function() {
			/* $.ajax({
				url:"<c:url value='/admin/member/memberSave.do'/>",
				type:"GET",
				success:function(res){
					if(res>0){
						alert("d:\\download에 저장되었습니다");
					}else{
						alert("저장 실패");
					}
					
				},
				error:function(xhr, status, error){
					alert(status+":"+error);
				}	
			});//ajax */
			location.href="<c:url value='/admin/member/memberSave.do'/>";
		});
	});
</script>
<!-- <h1>회원관리</h1> -->
<p id="adminTitleP"><img alt="아이콘" src="<c:url value='/images/mybook/icon/process.png'/>"> 회원관리 페이지</p>
<!-- <h1>회원관리</h1> -->
<div id="AdminMemDiv">
	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>가입일</th>
				<th>탈퇴일</th>
				<th>북코인</th>
			</tr>		
		</thead>
		<tbody>		
			<c:if test="${empty alist}">
				<tr>
					<th colspan="6">데이터가 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${!empty alist}">
				<c:forEach var="vo" items="${alist }">
					<tr>
						<td>${vo.memberNo }</td>
						<td>${vo.userId }</td>
						<td>${vo.userName }</td>
						<td><fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${vo.outDate }" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatNumber value="${vo.cash }" pattern="#,###"/>원</td>
					</tr>
				</c:forEach>
			</c:if>		
		</tbody>	
	</table>
</div>
<button id="excelSave">회원정보 excel저장</button>
<%@ include file="../libraryAdminBottom.jsp" %>