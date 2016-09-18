<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/silde_Notice/style.css" />


<%@include file="../libraryTop.jsp" %>
<script type="text/javascript">
	$().ready(function(){
		
		$("#writeGo").click(function(){
			$(location).attr('href',"<c:url value='/library/qna/qnaWrite.do'/>");
		});
		$("#listGo").click(function(){
			$(location).attr('href',"<c:url value='/library/qna/qnaList.do'/>");
		});	
		$("#container_out").css("background","url(../../images/library/notice/noticeBackground.png) no-repeat center");
	});
	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}	

</script>
<form name="frmPage" method="post" 
	action="<c:url value='/library/qna/qnaList.do'/>">
	<input type="hidden" name="currentPage">
	<input type="hidden" id="memberNo" name="memberNo" value="${sessionScope.memberNo }"/>
	<input type="hidden" id="myWrite" name="myWrite" value="${param.myWrite }">
	<input type="hidden" id="myWrite" name="searchCondition" value="${param.searchCondition }">
	<input type="hidden" id="myWrite" name="searchKeyword" value="${param.searchKeyword }">
	
</form>

<!-- qna 리스트 화면 -->
<div id="notice_head">
	<h2>
		<img alt="qna"
			src="${pageContext.request.contextPath }/images/library/notice/notice.jpg">
	</h2>
</div>
<div id="notice_banner">
	<a href="<c:url value='/library/notice/noticelist.do'/>"><img
		alt="qna 배너"
		src="${pageContext.request.contextPath}/images/library/notice/banner.png"
		width="200px" height="50px"></a>
</div>
<!-- 광고 -->
<%@include file="../libraryAd.jsp"%>
<div id="notice_body">	
	<div class="searchbox">
   	<form name="frmSearch" id="search" method="post" 
   	action="<c:url value='/library/qna/qnaList.do' />" >
        <div class="searchbox">
        <select name="searchCondition">
            <option value="title"
           	   <c:if test="${param.searchCondition=='title'}">
            		selected
               </c:if>
            >제목</option>
            <option value="content" 
            	<c:if test="${param.searchCondition=='content'}">
            		selected
               </c:if>
            >내용</option>
            <option value="user_name" 
            	<c:if test="${param.searchCondition=='user_name'}">
            		selected
               </c:if>
            >작성자</option>
        </select>   
        <input type="text" name="searchKeyword" 
        	title="검색어 입력" value="${param.searchKeyword}" >   
		<input type="submit" value="검색">
    </form>
	</div>
	<div class="list">
	<table
	 	summary="질문게시판에 관한 표로써, 글번호, 제목, 작성자, 작성일, 조회수, 답변완료에 대한 정보를 제공합니다.">
	<colgroup>
		<col style="width:10%;" />
		<col style="width:15%;" />
		<col style="width:35%;" />
		<col style="width:15%;" />
		<col style="width:15%;" />
		<col style="width:10%;" />		
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">번호</th>
	    <th scope="col">분류</th>
	    <th scope="col">제목</th>
	    <th scope="col">작성자</th>
	    <th scope="col">작성일</th>
	    <th scope="col">조회수</th>
	  </tr>
	</thead> 
	<tbody >
		<c:if test="${empty qnaList}">
			<tr>
				<td colspan="6">
				게시글이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:if test="${!empty qnaList}">
			<c:forEach var="vo" items="${qnaList}">
			
				<tr>
					<td>${vo.qnaNo}</td>
					<td>
						<c:if test="${vo.complete=='Y'}">
						[답변완료]
						</c:if>
						<c:if test="${vo.complete=='N'}">
						질문
						</c:if>
						
					</td>
					<td><a href="<c:url value='/library/qna/readCountAdd.do?qnaNo=${vo.qnaNo }'/>">
						<c:if test="${vo.complete=='Y'}">
						<p style="color:#ddd">${vo.title }
						
							<c:if test="${vo.commentCount!=0 }">
								[${vo.commentCount }]
							</c:if>
						</p>
						</c:if>
						<c:if test="${vo.complete=='N'}">
							${vo.title }
							<c:if test="${vo.commentCount!=0 }">
								[${vo.commentCount }]
							</c:if>
						</c:if>
						
						
						</a></td>
					<td>${vo.userName }</td>
					<td style="text-align:center;"><fmt:formatDate value="${vo.regDate }" pattern="MM/dd 
						 HH:mm:ss"/> </td>
					<td>${vo.readCount }</td>
					
				</tr>
				
			</c:forEach>
		</c:if>
	</tbody>
	</table>
	</div>	   
<div class="align_left">
	<input type="button" id="listGo" value="전체목록"/>
	<input type="button" id="writeGo" value="글쓰실?"/>
	<form id="myWrite" method="post" action="<c:url value='/library/qna/qnaList.do'/>">
		<input type="submit" id="myWriting" value="내글 보기"/>
		<input type="hidden" id="memberNo" name="memberNo" value="${sessionScope.memberNo }"/>
		<input type="hidden" id="myWrite" name="myWrite" value="Y">
	</form>			
</div>
<!-- 페이징 처리를 위한 div -->
<div class="divPage">
	<!-- 이전 블럭으로 이동 -->
	<c:if test="${pagingInfo.firstPage>1}">				
		<a href="#" 
	onclick="pageFunc(${pagingInfo.firstPage-1})">
			<img src="<c:url value='/images/first.JPG'/>" 
					alt="이전블럭으로">
		</a>				
	</c:if>
	
	<!-- 페이지 번호 추가 -->						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" 
		begin="${pagingInfo.firstPage }" 
		end="${pagingInfo.lastPage }">
		<c:if test="${i==pagingInfo.currentPage }">					
			<span style="color:blue;font-weight: bold">
				${i}</span>
		</c:if>		
		<c:if test="${i!=pagingInfo.currentPage }">
			<a href="#" onclick="pageFunc(${i})">
				[${i}]</a>
		</c:if>		
	</c:forEach>				
	<!--  페이지 번호 끝 -->
	
	<!-- 다음 블럭으로 이동 -->
	<c:if test
	="${pagingInfo.lastPage<pagingInfo.totalPage}">				
		<a href="#" 
	onclick="pageFunc(${pagingInfo.lastPage+1})">
			<img src="<c:url value='/images/last.JPG'/>" 
					alt="다음블럭으로">
		</a>
	</c:if>
</div>

</div>
</div>
<input type="hidden" value="${sessionScope.memberNo }"/>

<%@include file="../libraryBottom.jsp" %>
