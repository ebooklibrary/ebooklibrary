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
			<a href="#">ㆍ자료현황</a><br>
			<a href="#">ㆍ책대출/구매</a>
			<a></a>
		</div>
	</div>
	<div class="siteMap_2">
		<img alt=""
			src="${pageContext.request.contextPath }/images/library/notice/siteMap.png"
			width="250px" height="300px">
		<div>
			<p class="siteMap_text">자료검색</p><br>
			<a href="#">ㆍ책검색</a><br>
			<a href="#">ㆍ신작자료검색</a>
			<a></a>
			<a></a>
		</div>
	</div>
	<div class="siteMap_3">
		<img alt=""
			src="${pageContext.request.contextPath }/images/library/notice/siteMap.png"
			width="250px" height="300px">
		<div>
			<p class="siteMap_text">이용자 서비스</p><br>
			<a href="#">ㆍ공지사항</a><br>
			<a href="#">ㆍ신작도서</a><br>
			<a href="#">ㆍ추천도서</a><br>
			<a href="#">ㆍ베스트셀러</a>
		</div>
	</div>
	<div class="siteMap_4">
		<img alt=""
			src="${pageContext.request.contextPath }/images/library/notice/siteMap.png"
			width="250px" height="300px">
		<div>
			<p class="siteMap_text">열린마당</p><br>
			<a href="#">ㆍQNA</a><br>
			<a href="#">ㆍ자유계시판</a><br>
			<a href="#">ㆍ요청계시판</a>
			<a></a>
			<a></a>
		</div>
	</div>
	<div class="siteMap_5">
		<img alt=""
			src="${pageContext.request.contextPath }/images/library/notice/siteMap.png"
			width="250px" height="300px">
		<div>
			<p class="siteMap_text">ㆍ나의도서관</p><br>
			<a href="#">ㆍ내서제</a><br>
			<a href="#">ㆍ대출/구매현황</a><br>
			<a href="#">ㆍ희망도서신청/확인</a><br>
			<a href="#">ㆍ회원탈퇴</a>
			<a></a>
		</div>
	</div>
	<div class="siteMap_6">
		<img alt=""
			src="${pageContext.request.contextPath }/images/library/notice/siteMap.png"
			width="250px" height="300px">
		<div>
			<p class="siteMap_text">도서관 회원</p><br>
			<a href="#">ㆍ로그인</a><br>
			<a href="#">ㆍ회원가입</a><br>
			<a href="#">ㆍ아이디찾기</a><br>
			<a href="#">ㆍ비밀번호찾기</a><br>
			<a href="#">ㆍ사이트맵</a>
		</div>
	</div>
</div>



<%@include file="../libraryBottom.jsp"%>
