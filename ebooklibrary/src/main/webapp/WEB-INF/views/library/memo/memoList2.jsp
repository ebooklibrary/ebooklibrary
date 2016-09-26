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
<link rel="stylesheet" type="text/css" href="<c:url value='/css/library/memo.css'/>" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {	
		var article = (".memoTable .show");
		$(".memoTable .title td").click(function() {
			var myArticle = $(this).parents().next("tr");
			
			if ($(myArticle).hasClass('hide')) {
				$(article).removeClass('show').addClass('hide');
				$(myArticle).removeClass('hide').addClass('show');
			} else {
				$(myArticle).addClass('hide').removeClass('show');
			}
		});//click
		
		$("#toMemoMove").click(function() {
			location.href="<c:url value='/library/memo/toMemo.do'/>";
		});//click
		$("#fromMemoMove").click(function() {
			location.href="<c:url value='/library/memo/fromMemo.do'/>";
		});//click
		$("#writeMemo").click(function() {
			$("#tabs").css("display","none");
			$("#memoWrite").css("display","inline");
		})//click
		
		$(".title").click(function() {
			$.ajax({
				url:"<c:url value='/library/memo/memoCheck.do'/>",
				data:"memoNo="+$(this).find("td").first().text(),			
				type:"GET",
				success:function(res){
					
				}
			});//ajax
		});//click
		
		$(".delete").click(function(){
			alert($(this).parent().find("td").first().text())
			if(confirm("삭제 하시겠습니까?")){
				$.ajax({
					url:"<c:url value='/library/memo/memoDelete.do'/>",
					data:"memoNo="+$(this).parent().find("td").first().text(),			
					type:"GET",
					success:function(res){
						location.href="<c:url value='/library/memo/toMemo.do'/>";
					}
				});//ajax
			}//if			
		});//delete
		
	});//jquery
	
	function pagetoMemo(curPage){
		document.toMemo.currentPage.value=curPage;
		toMemo.submit();
	}
	function pagefromMemo(curPage){
		document.fromMemo.currentPage.value=curPage;
		fromMemo.submit();
	}
</script>
</head>
<body>
<form name="toMemo" method="post" 
	action="<c:url value='/library/memo/toMemo.do'/>">
	<input type="hidden" name="currentPage">
</form>
<form name="fromMemo" method="post" 
	action="<c:url value='/library/memo/fromMemo.do'/>">
	<input type="hidden" name="currentPage">
</form>	
	<button id="toMemoMove">받은쪽지</button>
	<button id="fromMemoMove">보낸쪽지</button>
	<button id="writeMemo">쪽지 쓰기</button>
	<div id="tabs" style="width: 700px; height: 800px" class=".show">	
		<c:if test="${ToFrom=='T' }">
		<div class="Tomemo">
			<h1>받은 쪽지함</h1>
			<table summary="" class="memoTable">							
				<colgroup>
					<col width="15%">
					<col width="45%">
					<col width="35%">
					<col width="5%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="head">보낸 사람</th>
						<th scope="col" class="head">제목</th>
						<th scope="col" class="head">보낸시간</th>
						<th scope="col" class="head">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty toList }">
						<tr>
							<td style="text-align: center;" colspan="3">해당 데이터가 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${!empty toList }">
						<c:forEach var="vo" items="${toList }">
							<tr class="title">
								<td style="display: none;">${vo.memoNo }</td>
								<td style="text-align: center">${vo.fromId }</td>
								<td style="text-align: center">${vo.title }</td>
								<td><fmt:formatDate value="${vo.sendDate }"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td class="delete">
								<a href="#">삭제</a>
								<td>
							</tr>
							<tr class="hide">
								<td
									style="text-align: left; font-size: 1.3em; padding: 10px; background: #f5f5f5; border-top: 1px solid #e0e0e0;"
									colspan="3">본문 : ${vo.content }</td>
							</tr>
						</c:forEach>

						<!-- 페이징 처리를 위한 div -->
						<p class="divPage">
							<!-- 이전 블럭으로 이동 -->
							<c:if test="${pagingInfo.firstPage>1}">
								<a href="#" onclick="pagetoMemo(${pagingInfo.firstPage-1})">
									<img src="<c:url value='/images/first.JPG'/>" alt="이전블럭으로">
								</a>
							</c:if>

							<!-- 페이지 번호 추가 -->
							<!-- [1][2][3][4][5][6][7][8][9][10] -->
							<c:forEach var="i" begin="${pagingInfo.firstPage }"
								end="${pagingInfo.lastPage }">
								<c:if test="${i==pagingInfo.currentPage }">
									<span style="color: blue; font-weight: bold"> ${i}</span>
								</c:if>
								<c:if test="${i!=pagingInfo.currentPage }">
									<a href="#" onclick="pagetoMemo(${i})"> [${i}]</a>
								</c:if>
							</c:forEach>
							<!--  페이지 번호 끝 -->

							<!-- 다음 블럭으로 이동 -->
							<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage}">
								<a href="#" onclick="pagetoMemo(${pagingInfo.lastPage+1})">
									<img src="<c:url value='/images/last.JPG'/>" alt="다음블럭으로">
								</a>
							</c:if>
						</p>
					</c:if>
				</tbody>
			</table>
		</div>
		</c:if>
		<c:if test="${ToFrom=='F' }">
			<div class="FromMemo">
				<h1>보낸 쪽지함</h1>
				<table summary="" class="memoTable">
					<colgroup>
						<col width="20%">
						<col width="45%">
						<col width="35%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="head">받는 사람</th>
							<th scope="col" class="head">제목</th>
							<th scope="col" class="head">보낸시간</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty fromList }">
							<tr>
								<td style="text-align: center;" colspan="3">해당 데이터가 없습니다</td>
							</tr>
						</c:if>
						<c:if test="${!empty fromList }">
							<c:forEach var="vo" items="${fromList }">
								<tr class="title">
									<p style="display: none;">${vo.memoNo }</p>
									<td style="text-align: center">${vo.fromId }</td>
									<td style="text-align: center">${vo.title }</td>
									<td><fmt:formatDate value="${vo.sendDate }"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
								</tr>
								<tr class="hide">
									<td
										style="text-align: left; font-size: 1.3em; padding: 10px; background: #f5f5f5; border-top: 1px solid #e0e0e0;"
										colspan="3">${vo.content }</td>
								</tr>
							</c:forEach>
	
							<!-- 페이징 처리를 위한 div -->
							<p class="divPage">
								<!-- 이전 블럭으로 이동 -->
								<c:if test="${pagingInfo.firstPage>1}">
									<a href="#" onclick="pagefromMemo(${pagingInfo.firstPage-1})">
										<img src="<c:url value='/images/first.JPG'/>" alt="이전블럭으로">
									</a>
								</c:if>
	
								<!-- 페이지 번호 추가 -->
								<!-- [1][2][3][4][5][6][7][8][9][10] -->
								<c:forEach var="i" begin="${pagingInfo.firstPage }"
									end="${pagingInfo.lastPage }">
									<c:if test="${i==pagingInfo.currentPage }">
										<span style="color: blue; font-weight: bold"> ${i}</span>
									</c:if>
									<c:if test="${i!=pagingInfo.currentPage }">
										<a href="#" onclick="pagefromMemo(${i})"> [${i}]</a>
									</c:if>
								</c:forEach>
								<!--  페이지 번호 끝 -->
	
								<!-- 다음 블럭으로 이동 -->
								<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage}">
									<a href="#" onclick="pagefromMemo(${pagingInfo.lastPage+1})">
										<img src="<c:url value='/images/last.JPG'/>" alt="다음블럭으로">
									</a>
								</c:if>
							</p>
						</c:if>
					</tbody>
				</table>
			</div>
		</c:if>
	</div>
	<div id="memoWrite" style="width: 700px; height: 800px; display: none;">
		<h1>쪽지 보내기</h1>
		<form action="<c:url value='/library/memo/memoWrite.do'/>" method="post" id="memoWrite">
			<input type="hidden" value="${sessionScope.userId }" name="fromId">
			받는아이디 : <input type="text" name="toId"><br>
			제목 : <input type="text" name="title"><br>
			내용<br>
			<textarea rows="10" cols="70" name="content"></textarea>
			<input type="submit" value="보내기">				
		</form>
	</div>
</body>
</html>