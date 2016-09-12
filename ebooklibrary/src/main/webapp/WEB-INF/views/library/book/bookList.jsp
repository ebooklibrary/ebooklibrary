<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이건 북리스트</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/library/bookList.css" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/css/jqueryui.css'/>">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<!-- 폼태그 -->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script type="text/javascript">
	$(document).ready(function() {
		$( "#sortDiv input" ).checkboxradio();
		
		/* 
		$("#searchFrm").submit(function() {
			$.ajax({
				url:"<c:url value='/admin/book/bookList.do'/>",
				type:"POST",
				data: $(this).serializeArray(),
				success:function(res){
					
				},
				error:function(xhr, status, error){
					alert(status+":"+error);
				}
			});
		});
		 */
		
		$("#searchSpan span").click(function() {
			$("#searchSpan span").css("border","");
			$(this).css("border","1px solid pink");
			var index=$("#searchSpan").find("span").index(this);
			if (index==0) {
				$("#searchInput").attr("name","title");
			}
			if (index==1) {
				$("#searchInput").attr("name","publisher");
			}
			if (index==2) {
				$("#searchInput").attr("name","writer");
			}
			if (index==3) {
				$("#searchInput").attr("name","genre");
				$("#genre").show();
			}else{
				$("#genre").hide();
			}
			if (index==4) {
			}
		});
		 
		 var title="${bookSearchVo.title}";
		 var publisher="${bookSearchVo.publisher}";
		 var writer="${bookSearchVo.writer}";
		 if (title.length>0 && title!="") {
			 $("#searchSpan span:nth-of-type(1)").css("border","1px solid pink");
			 $("#searchInput").attr("name","title");
		}
		 if (publisher.length>0 && publisher!="") {
			 $("#searchSpan span:nth-of-type(2)").css("border","1px solid pink");
			 $("#searchInput").attr("name","publisher");
		}
		 if (writer.length>0 && writer!="") {
			 $("#searchSpan span:nth-of-type(3)").css("border","1px solid pink");
			 $("#searchInput").attr("name","writer");
		}
		
		
		var gn=["n","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","201","202","203","204","205","206","207","208","209","210","211","212","213","214","215"];
		var gh=["-Select-","판타지","공상과학소설","호러","드라마","액션및어드벤처","로맨스","미스터리","시리즈","트릴로지(3부작책)","만화","풍자","전기","자서전","아동도서","일기형식책","자기계발서","가이드","여행","종교책","기도하는책","역사책","수학책","시(선집),문집","시집","저널,학술지","백과사전","사전","과학책","예술책","요리책","헬스"];
		/* 책 장르 */
		var l="";
		for (var i = 0; i < gn.length; i++) {
			l+="<option value='"+gn[i]+"'>"+gh[i]+"</option>";
		}
		$("#genre").html(l);
		
		
		
		
	});

</script>

</head>
<body>

	<div id="bookListWrapper">
	
		
	
		<p>도서 검색 결과 페이지</p>
		<p>12건의  검색결과 : 
			<c:if test="${!empty bookSearchVo.title}">
				"${bookSearchVo.title}" - 제목별 검색 결과
			</c:if>
			<c:if test="${!empty bookSearchVo.publisher}">
				"${bookSearchVo.publisher}" - 출판사별 검색 결과
			</c:if>
			<c:if test="${!empty bookSearchVo.writer}">
				"${bookSearchVo.writer}" - 작가별 검색 결과
			</c:if>
		</p>
		
		<form action="<c:url value='/admin/book/bookList.do'/>" method="post" id="searchFrm">
			<p id="searchSpan">검색 : 
				<span>제목</span>
				<span>출판사</span>
				<span>작가</span>
				<span>장르<select name="genre" id="genre" style="display:none; margin-left: 5px;"></select></span>
				<span>출판일</span>
			</p>
			<input type="text" class="w3-input" id="searchInput" name="title">
		</form>
		
		<div id="sortDiv">
		  <fieldset>
		  	<legend>정렬</legend>
		    <label for="radio-1">판매량</label>
		    <input type="radio" name="radio-1" id="radio-1">
		    <label for="radio-2">신상품</label>
		    <input type="radio" name="radio-1" id="radio-2">
		    <label for="radio-3">낮은가격</label>
		    <input type="radio" name="radio-1" id="radio-3">
		    <label for="radio-4">높은가격</label>
		    <input type="radio" name="radio-1" id="radio-4">
		  </fieldset>
		</div>
		
		<c:if test="${empty alist }">
			검색하신 책은 없습니다.
		</c:if>
		
		<c:forEach var="vo" items="${alist}">
			<div id="bookListDiv">
				<img alt="테스트" src="<c:url value='/book_upload/${vo.coverFileName }'/>">
				<p id="bookTitleP">[${vo.genre}] ${vo.title }</p>
				<div id="choice">
					<input type="checkbox" id="chkBookList" name="chkBookList">
					
					<input type="button" id="cart" name="cart" value="장바구니">
					<input type="button" id="buy" name="buy" value="바로구매">
					<!-- <input type="text" id="quantity" name="quantity"> -->
				</div>
				<div id="bookSummaryDiv">${vo.summary }</div>
				<div id="bookPriceDiv">
					<p>구매가격 : <fmt:formatNumber value="${vo.price }" pattern="#,###,###" />원</p>
					<p>대여가격 : 일당 100원</p>
				</div>
			</div>
		</c:forEach>
	
	</div>

</body>
</html>