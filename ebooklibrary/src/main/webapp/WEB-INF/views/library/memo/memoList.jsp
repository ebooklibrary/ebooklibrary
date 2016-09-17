<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지함</title>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>    
<script type="text/javascript" src="<c:url value='/jquery/jquery-ui.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/jquery/jquery-ui.css'/>" />    
<script type="text/javascript">
	$(document).ready(function() {
		$('#tabs').tabs(); // 탭
		
		$('#accordion1').accordion();
		$('#accordion2').accordion({heightStyle: "content"});
		
		$(".memoDetail").click(function() {
			$.ajax({
				url:"<c:url value='/library/memo/memoCheck.do'/>",
				data:"memoNo="+$(this).find("p").text(),			
				type:"GET",
				success:function(res){
					
				}
			});//ajax
		});
		
		$(".delete").click(function(){
			if(confirm("삭제 하시겠습니까?")){
				$.ajax({
					url:"<c:url value='/library/memo/memoDelete.do'/>",
					data:"memoNo="+$(this).next().text(),			
					type:"GET",
					success:function(res){
						location.href="<c:url value='/library/memo/memo.do'/>";
					}
				});//ajax
			}//if			
		});//delete
			
		
	});	
	
	function pageFunc(curPage,tf){
		document.frmPage.currentPage.value=curPage;
		document.frmPage.toFrom.value=tf;
		frmPage.submit();
	}	
</script>
</head>
<body>
<form name="frmPage" method="post" 
	action="<c:url value='/library/memo/memo.do'/>">
	<input type="hidden" name="currentPage">
	<input type="hidden" id="toFrom" name="toFrom">
</form>
	<div id="tabs" style="width: 700px;height: 800px">
		<ul>
			<li><a id="tab1" href="#tabContent_1">받은 쪽지함</a></li>
			<li><a id="tab2" href="#tabContent_2">보낸 쪽지함</a></li>
			<li><a id="tab3" href="#tabContent_3">쪽지 보내기</a></li>
		</ul>
		<div id="tabContent_1">
			<c:if test="${empty toList }">					
				해당 데이터가 없습니다					
			</c:if>
			<c:if test="${!empty toList }">
				<div><p style="float: left">보낸 사람</p><p style="float: left">제목</p><p style="float: left">보낸 시간</p></div><br>		
					<div id="accordion1" style="clear:both;overflow: hidden;">										
						<c:forEach var="vo" items="${toList }">							
							<h3 class="memoDetail">${vo.toId }${vo.title }${vo.sendDate }
							<button class="delete">삭제</button><p style="display: none;">${vo.memoNo }</p></h3>
							<div><p>${vo.content }</p></div>
						</c:forEach>							
					</div>
					<!-- 페이징 처리를 위한 div -->
						<p class="divPage">
							<!-- 이전 블럭으로 이동 -->
							<c:if test="${toPagingInfo.firstPage>1}">				
								<a href="#" 
							onclick="pageFunc(${toPagingInfo.firstPage-1},'T')">
									<img src="<c:url value='/images/first.JPG'/>" 
											alt="이전블럭으로">
								</a>				
							</c:if>
							
							<!-- 페이지 번호 추가 -->						
							<!-- [1][2][3][4][5][6][7][8][9][10] -->
							<c:forEach var="i" 
								begin="${toPagingInfo.firstPage }" 
								end="${toPagingInfo.lastPage }">
								<c:if test="${i==toPagingInfo.currentPage }">					
									<span style="color:blue;font-weight: bold">
										${i}</span>
								</c:if>		
								<c:if test="${i!=toPagingInfo.currentPage }">
									<a href="#" onclick="pageFunc(${i},'T')">
										[${i}]</a>
								</c:if>		
							</c:forEach>				
							<!--  페이지 번호 끝 -->
							
							<!-- 다음 블럭으로 이동 -->
							<c:if test
							="${toPagingInfo.lastPage<toPagingInfo.totalPage}">				
								<a href="#" 
							onclick="pageFunc(${toPagingInfo.lastPage+1},'T')">
									<img src="<c:url value='/images/last.JPG'/>" 
											alt="다음블럭으로">
								</a>
							</c:if>
						</p>
			</c:if>	
		</div>
		<div id="tabContent_2">
			<c:if test="${empty fromList }">					
				해당 데이터가 없습니다					
			</c:if>
			<c:if test="${!empty fromList }">
				<div><p style="float: left">받은 사람</p><p style="float: left">제목</p><p style="float: left">보낸 시간</p></div><br>		
					<div id="accordion2" style="clear:both;overflow: hidden;">										
						<c:forEach var="vo" items="${toList }">							
							<h3 class="memoDetail">${vo.fromId }${vo.title }${vo.sendDate }
							<button class="delete">삭제</button><p style="display: none;">${vo.memoNo }</p></h3>
							<div><p>${vo.content }</p></div>
						</c:forEach>
					</div>
					<!-- 페이징 처리를 위한 div -->
						<p class="divPage">
							<!-- 이전 블럭으로 이동 -->
							<c:if test="${fromPagingInfo.firstPage>1}">				
								<a href="#" 
							onclick="pageFunc(${fromPagingInfo.firstPage-1},'T')">
									<img src="<c:url value='/images/first.JPG'/>" 
											alt="이전블럭으로">
								</a>				
							</c:if>
							
							<!-- 페이지 번호 추가 -->						
							<!-- [1][2][3][4][5][6][7][8][9][10] -->
							<c:forEach var="i" 
								begin="${fromPagingInfo.firstPage }" 
								end="${fromPagingInfo.lastPage }">
								<c:if test="${i==fromPagingInfo.currentPage }">					
									<span style="color:blue;font-weight: bold">
										${i}</span>
								</c:if>		
								<c:if test="${i!=fromPagingInfo.currentPage }">
									<a href="#" onclick="pageFunc(${i},'T')">
										[${i}]</a>
								</c:if>		
							</c:forEach>				
							<!--  페이지 번호 끝 -->
							
							<!-- 다음 블럭으로 이동 -->
							<c:if test
							="${fromPagingInfo.lastPage<fromPagingInfo.totalPage}">				
								<a href="#" 
							onclick="pageFunc(${fromPagingInfo.lastPage+1},'T')">
									<img src="<c:url value='/images/last.JPG'/>" 
											alt="다음블럭으로">
								</a>
							</c:if>
						</p>
			</c:if>	
		</div>
		<div id="tabContent_3">
			<!-- 쪽지 보내기 -->
			<form action="<c:url value='/library/memo/memoWrite.do'/>" method="post" id="memoWrite">
				<input type="hidden" value="${sessionScope.userId }" name="fromId">
				받는아이디 : <input type="text" name="toId"><br>
				제목 : <input type="text" name="title"><br>
				내용<br>
				<textarea rows="10" cols="70" name="content"></textarea>
				<input type="submit" value="보내기">				
			</form>
		</div>
	</div>
</body>
</html>