<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
	/* 책 검색 */
	$("#searchAllBook").submit(function() {
		var title=$("#searchMain").val();
		$("#search").val("");
	});


</script>
<!--도서검색-->
<div id="m_search">
	<div class="mSearchDiv">
		<form action="<c:url value='/admin/book/bookList.do'/>" name="searchAllBook" id="searchAllBook" method="post">
			<input type="text" id="searchMain" name="searchKeyword" placeholder="책제목, 작가, 출판사를 입력하세요..">
		</form>
	</div>
</div>
<!--도서검색-->