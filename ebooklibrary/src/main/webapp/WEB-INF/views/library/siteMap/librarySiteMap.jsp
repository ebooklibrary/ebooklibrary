<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../libraryTop.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#container_out")
								.css("background",
										"url(../../images/library/notice/noticeBackground.png) no-repeat center");
					});
</script>
<%@include file="../libraryAd.jsp"%>
<div class="siteMap_head">
	<img alt="사이트맵" src ="${pageContext.request.contextPath }/images/library/notice/siteMap2.png" width="250px" height="70px" style="margin-left: 50px;" />
</div>
<div class="siteMap">
	<div class="siteMap_1">
		<img alt=""
			src="${pageContext.request.contextPath }/images/library/notice/siteMap.png"
			width="250px" height="300px">
		<div>
			<p class="siteMap_text">도서관 안내</p><br>
			<a href="<c:url value='/library/serviceCenter/libraryServiceCenter.do'/>">ㆍ고객센터</a><br>			
		</div>
	</div>
	<div class="siteMap_2">
		<img alt=""
			src="${pageContext.request.contextPath }/images/library/notice/siteMap.png"
			width="250px" height="300px">
		<div>
			<p class="siteMap_text">자료검색</p><br>
			<a href="<c:url value='/book/bookList.do'/>">ㆍ도서검색</a><br>				
		</div>
	</div>
	<div class="siteMap_3">
		<img alt=""
			src="${pageContext.request.contextPath }/images/library/notice/siteMap.png"
			width="250px" height="300px">
		<div>
			<p class="siteMap_text">이용자 서비스</p><br>
			<a href="<c:url value='/library/notice/noticelist.do'/>">ㆍ공지사항</a><br>
		</div>
	</div>
	<div class="siteMap_4">
		<img alt=""
			src="${pageContext.request.contextPath }/images/library/notice/siteMap.png"
			width="250px" height="300px">
		<div>
			<p class="siteMap_text">열린마당</p><br>
			<a href="<c:url value='/library/qna/qnaList.do'/>">ㆍQNA</a><br>
			<a href="<c:url value='/library/request/requestList.do'/>">ㆍ요청게시판</a><br>
		</div>
	</div>
	<div class="siteMap_5">
		<img alt=""
			src="${pageContext.request.contextPath }/images/library/notice/siteMap.png"
			width="250px" height="300px">
		<div>
			<p class="siteMap_text">ㆍ나의도서관</p><br>
			<a href="<c:url value='/mybooks/mybookmain.do'/>">ㆍ내서재</a><br>			
		</div>
	</div>
	<div class="siteMap_6">
		<img alt=""
			src="${pageContext.request.contextPath }/images/library/notice/siteMap.png"
			width="250px" height="300px">
		<div>
			<p class="siteMap_text">도서관 회원</p><br>
			<a href="<c:url value='/member/login.do'/>">ㆍ로그인</a><br>
			<a href="<c:url value='/member/register.do'/>">ㆍ회원가입</a><br>
			<a href="<c:url value='/member/myPage.do'/>">ㆍ내정보</a><br>
		</div>
	</div>
</div>



<%@include file="../libraryBottom.jsp"%>
