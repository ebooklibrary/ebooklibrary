<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여기가 내 서재</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mybook/mybookmain.css" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".mybook").click(function() {
			alert($(this).find(".mybook1").val());
		});
		$(".mybook").click(function() {
			var bookNo=$(this).find(".mybook1").val();
			window.open("<c:url value='/mybooks/mybook.do?bookNo="+bookNo+"'/>", "책보기", "top=50, left=50, width=1550, height=900, resizable=0, location=0");
		});
		$(".purchasedBookDiv").click(function() {
			var bookNo=$(this).find(".mybook1").val();
			alert(bookNo);
			window.open("<c:url value='/mybooks/mybook.do?bookNo="+bookNo+"'/>", "책보기", "top=50, left=50, width=1550, height=900, resizable=0, location=0");
		});
		$(".rentBookDiv").click(function() {
			var bookNo=$(this).find(".mybook1").val();
			alert(bookNo);
			window.open("<c:url value='/mybooks/mybook.do?bookNo="+bookNo+"'/>", "책보기", "top=50, left=50, width=1550, height=900, resizable=0, location=0");
		});
		$(".recentMyBook").click(function() {
			var bookNo=$(this).find(".mybook1").val();
			alert(bookNo);
			window.open("<c:url value='/mybooks/mybook.do?bookNo="+bookNo+"'/>", "책보기", "top=50, left=50, width=1550, height=900, resizable=0, location=0");
		});
		
		
		/* 
		$(".mybook").hover(function() {
				$(this).css("cursor","pointer");
			}, function() {
				$(this).css("cursor","");
		});
		 */
		 
		 /* 
		 var Ca = /\+/g;
			decodeURIComponent( bimg.replace(Ca, " ") );
			//var bimg=encodeURIComponent(bimg);
		*/
		  
		/* 한글 깨짐 현상 해결을 위한 디코딩, 공백 존재시 생기는 '+' 제거 */
		var bgImage="${bgImage}";
		var Ca = /\+/g;
		var bgImage=decodeURIComponent(bgImage);
		var bgImage=bgImage.replace(Ca, "");
		//alert(bgImage);
		
		/* 배경화면 설정 */
		$("html").css({"background":"url(${pageContext.request.contextPath }/backimg/"+bgImage+")  no-repeat center center fixed",
							"-webkit-background-size": "cover",
							"-moz-background-size": "cover",
							"-o-background-size": "cover",
							"background-size": "cover"
		});
		
		/* 책 검색 */
		$("#menuDiv input[type=text]").focus(function() {
			$("#menuDiv #searchInfo").hide();
		});
		$("#menuDiv input[type=text]").blur(function() {
			$("#menuDiv #searchInfo")
			  .delay(800)
			  .queue(function (next) { 
			    $(this).show(); 
			    next(); 
			});
		});
		
		/* 배경화면 메뉴 */
		$("#changeBackground").click(function() {
			$("#upFileBox").toggle();
		});
		/* 
		//책 전체 검색
		$("#search").keyup(function() {
			//1 , 해당 아이디가 존재하는 경우
			//2 , 해당 아이디가 존재하지 않는 경우
			alert($("#search").val());
			if (vaildate_userid($("#userid").val()) && $("#userid").val().length>=2) {
				$.ajax({
					url:"<c:url value='/member/ajaxCheckUserid.do'/>",
					type:"GET",
					data: "bookTitle="+$("#userid").val(),
					success:function(res){
						var result="";
						if (res==1) {
							result="이미 등록된 아이디";
							$("#chkId").val("N");
						}else if(res==2){
							result="사용 가능한 아이디";
							$("#chkId").val("Y");
						}
						$("#message").html(result);
						
					},
					error:function(xhr, status, error){
						alert(status+":"+error);
					}
				});
			}else{
				//유효성 검사를 통과하지 못한 경우
				$("#message").html("아이디 규칙에 맞지 않습니다.");
				$("#chkId").val("N");
			}
		});
 */
		
		/* 책목록 */
		$("#purchasedBook").click(function() {
			//$(".modal").css("display","block");
			$("#purchasedBookList").css("display","block");
			$("#rentBookList").css("display","none");
			$("#rentBook").find("input").attr("id",""); //myInput
			$("#rentBook").find("table").attr("id",""); //myTable
		});
		$("#rentBook").click(function() {
			//$(".modal").css("display","block");
			$("#rentBookList").css("display","block");
			$("#purchasedBookList").css("display","none");
			$("#purchasedBookList").find("input").attr("id",""); //myInput
			$("#purchasedBookList").find("table").attr("id",""); //myTable
		});
		
		$(".close").click(function() {
			$(".modal").css("display","none");
			$(".modal-content").find("input").attr("id","myInput"); //myInput
			$(".modal-content").find("table").attr("id","myTable"); //myTable
		});
		
		/* 책보기 새창 열림 */
		$("#booktestatag").click(function() {
			window.open("<c:url value='/mybooks/mybook.do'/>", "책보기", "top=50, left=50, width=1550, height=900, resizable=0, location=0")
		});
		
		/* 배경 바꾸는 ajax */
		$("#bookfrm").submit(function() {
			var formData = new FormData($('#bookfrm')[0]);
			$.ajax({
				url:"<c:url value='/mybooks/changeBackImg.do'/>",
					type:"POST",
					processData: false,
					contentType: false,
					/* contentType: "application/x-www-form-urlencoded; charset=UTF-8", */
					data: formData,
					success:function(bimg){
						
						var Ca = /\+/g;
						/* var bimg=encodeURIComponent(bimg); */
						var bimg=decodeURIComponent(bimg);
						var bimg=bimg.replace(Ca, "");
						
						alert("${pageContext.request.contextPath }/backimg/"+bimg);
						
						$("html").css({"background":"url(${pageContext.request.contextPath }/backimg/"+bimg+")  no-repeat center center fixed",
							"-webkit-background-size": "cover",
							"-moz-background-size": "cover",
							"-o-background-size": "cover",
							"background-size": "cover"
						});
						/* location.reload(); */
					},
					error: function(xhr,status, error){
						alert("에러발생"+status+":"+error);
					}
			});
			
			event.preventDefault();
		});
		
	}); //ready
	
	/* 
	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks the button, open the modal
	btn.onclick = function() {
	    modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
	 */
	
	/* 책목록 */
	function myFunction() {
		  var input, filter, table, tr, td, i;
		  input = document.getElementById("myInput");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("myTable");
		  tr = table.getElementsByTagName("tr");
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[0];
		    if (td) {
		      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
		        tr[i].style.display = "";
		      } else {
		        tr[i].style.display = "none";
		      }
		    }
		  }
		}
	 
	
	
</script>
</head>
<body>

		<%-- 
			<c:forEach var="map" items="${cartList }">
				<c:set var="sum" value='${map["SELLPRICE"]*map["QUANTITY"] }'/>
			</c:forEach>
	 	--%>


	<div id="wrapper">
	
		<div id="tempMenu">
			<a href="<c:url value='/mybooks/mybook.do'/>" id="booktestatag">내 책 테스트</a> | 
			<a href="<c:url value='/index.do'/>">첫페이지</a> | 
			<a href="<c:url value='/library/librarymain.do'/>">도서관</a>
		</div>
	
		<!-- COVER_FILE_NAME -->
		
		<!-- 최근 책 책장 -->
		<div id="recentBook">
			<c:forEach var="map" items="${alist }">
				<div class="recentMyBook">
					<input class="mybook1" type="hidden" value="${map['BOOK_NO'] }">
					<img title="${map['TITLE'] }" alt="최근책 책장" src="${pageContext.request.contextPath }/book_upload/${map['COVER_FILE_NAME'] }">
				</div>
			</c:forEach>
		</div>
		
		<div id="menuDiv">
			<div id="etc">
				<!-- 배경화면 바꾸기 -->
				<div id="changeBackground">
						<img id="changeback" alt="배경화면 바꾸기" src="<c:url value='/images/mybook/icon/background.png'/>">
						여기를 눌러 배경화면을 바꿔 보세요!!
				</div>
				<div id="upFileBox">
					<form id="bookfrm" name="bookfrm" enctype="multipart/form-data" method="post">
						원하시는 배경이미지를 올려보세요!<br><br>
						<input type="file" id="bgImage" name="bgImage">
<!-- 						<input type="hidden" id="defalutImage" name="defalutImage" value="defalutImage.jpg"> -->
						<input type="submit" id="btImg" name="btImg" value="확인">
					</form>
						<!-- <span id="defalutImage">기본 배경화면</span> -->
				</div>
			</div>
			
			<!-- 책 전체 검색 -->
			<div id="moreBookDiv">
				<input type="text" id="search" name="search" placeholder="Search..">
				<span id="searchInfo">더 보고 싶은 책이 있으시다면 여기에서!</span>
				<span id="moreBook">상점으로 고고</span>
			</div>
		</div>
		
		<!-- 보관 책장 -->
		<div id="BookList">
			<p>${sessionScope.userId } 님의 책장</p>
			<a id="rentBook" href="#">대여책 목록</a>
			<a id="purchasedBook" href="#">구매책 목록</a>
					<!-- <a href="#"><FONT style="WRITING-MODE: tb-rl; HEIGHT: 50pt">12345</FONT></a> -->
			<div id="myBooks">
			<!-- SELECT M.BOOK_NO, M.RENT_START, M.RENT_END, B.BOOK_FILE_NAME, B.COVER_FILE_NAME, B.TITLE, B.PUBLISHER, B.WRITER, B.PUBLICATION, B.GENRE, B.SUMMARY -->
			<c:forEach var="map" items="${alist }">
				<div class="mybook">
					<span>${map["TITLE"] }</span>
					<input class="mybook1" type="hidden" value="${map['BOOK_NO'] }">
					<c:if test="${empty map['RENT_END'] }">
						<div class="mybookColor"></div>
					</c:if>
					<c:if test="${!empty map['RENT_END'] }">
						<div class="mybookColor1"></div>
					</c:if>
				</div>
			</c:forEach>
			</div> <!-- mybooks -->
		</div> <!-- BookList -->
	</div> <!-- wrapper -->
	
	<!-- 구매책목록 미니창 띄우기 -->
	<!-- myModal -->
	<div id="purchasedBookList" class="modal">
	  <div class="modal-content">
	    <p>나의 구매책 목록</p>
	    <br>
	    <span class="close">닫기</span>
	    <!-- 미니창 안의 책목록및검색 -->
		<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
		<table id="myTable">
		  <tr class="header">
		    <th style="width:40%;">책제목</th>
		    <th style="width:40%;">출판사</th>
		    <th style="width:20%;">유효날짜</th>
		  </tr>
		<tbody>
			<c:forEach var="map" items="${alist }">
				<c:if test="${empty map['RENT_END'] }">
					<tr>
						<td><div class="purchasedBookDiv">${map["TITLE"] }<input class="mybook1" type="hidden" value="${map['BOOK_NO'] }"></div></td>
						<td><div class="purchasedBookDiv">${map["PUBLISHER"] }<input class="mybook1" type="hidden" value="${map['BOOK_NO'] }"></div></td>
						<td><div class="purchasedBookDiv"><fmt:formatDate value="${map['RENT_END'] }" pattern="yyyy-MM-dd"/><input class="mybook1" type="hidden" value="${map['BOOK_NO'] }"></div></td></td>
						
					</tr>
				</c:if>
			</c:forEach>
		  </tbody>
		</table>
	  </div>
	</div>
			
	<!-- 대여책목록 미니창 띄우기 -->
	<!-- myModal -->
	<div id="rentBookList" class="modal">
	  <div class="modal-content">
	    <p>나의 대여책 목록</p>
	    <br>
	    <span class="close">닫기</span>
	    <!-- 미니창 안의 책목록및검색 -->
		<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
		<table id="myTable">
		  <tr class="header">
		    <th style="width:40%;">책제목</th>
		    <th style="width:40%;">출판사</th>
		    <th style="width:20%;">유효날짜</th>
		  </tr>
		<tbody>
			<c:forEach var="map" items="${alist }">
				<c:if test="${!empty map['RENT_END'] }">
					<tr>
						<td><div class="rentBookDiv">${map["TITLE"] }<input class="mybook1" type="hidden" value="${map['BOOK_NO'] }"></div></td>
						<td><div class="rentBookDiv">${map["PUBLISHER"] }<input class="mybook1" type="hidden" value="${map['BOOK_NO'] }"></div></td>
						<td><div class="rentBookDiv"><fmt:formatDate value="${map['RENT_END'] }" pattern="yyyy-MM-dd"/><input class="mybook1" type="hidden" value="${map['BOOK_NO'] }"></div></td>
					</tr>
				</c:if>
			</c:forEach>
		  </tbody>
		</table>
	  </div>
	</div>
	
	
	

</body>
</html>