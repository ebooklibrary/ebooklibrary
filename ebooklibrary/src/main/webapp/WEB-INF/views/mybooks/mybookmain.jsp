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
			$("#menuDiv span").hide();
		});
		$("#menuDiv input[type=text]").blur(function() {
			$("#menuDiv span")
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
		var test;
		
		/* 책목록 */
		$("#boughtBook").click(function() {
			//$(".modal").css("display","block");
			$("#boughtBookList").css("display","block");
			$("#rentBookList").css("display","none");
		});
		$("#rentBook").click(function() {
			//$(".modal").css("display","block");
			$("#rentBookList").css("display","block");
			$("#boughtBookList").css("display","none");
		});
		
		$(".close").click(function() {
			$(".modal").css("display","none");
		});
		/* 
		$("#myBtn").click(function() {
			$(".modal").css("display","block");
		});
		 */
		
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
	
		<!-- 최근 책 책장 -->
		<div id="recentBook">
		
			<div class="imgtest">
				<img alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			
			
			<div class="imgtest">
				<img title="QQ규" alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			
			<div class="imgtest">
				<img title="QQ규" alt="최근책 책장" src="${pageContext.request.contextPath }/images/mybook/testimg.jpg">
			</div>
			
		
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
			
			
			
			<input type="text" name="search" placeholder="Search..">
			<span id="searchInfo">찾고 싶은 책이 있으시다면 여기에서!</span>
		</div>
		
		<!-- 보관 책장 -->
		<div id="BookList">
			<p>${sessionScope.userId } 님의 책장</p>
			
			<a id="rentBook" href="#">대여책 목록</a>
			<a id="boughtBook" href="#">구매책 목록</a>
			
					<!-- <a href="#"><FONT style="WRITING-MODE: tb-rl; HEIGHT: 50pt">12345</FONT></a> -->
			<div id="myBooks">
			
			<!-- SELECT M.BOOK_NO, M.RENT_START, M.RENT_END, B.BOOK_FILE_NAME, B.COVER_FILE_NAME, B.TITLE, B.PUBLISHER, B.WRITER, B.PUBLICATION, B.GENRE, B.SUMMARY -->
			<c:forEach var="map" items="${alist }">
				<div class="mybook">
					<span>${map["TITLE"] }</span>
					<input class="mybook1" type="hidden" value="${map['BOOK_NO'] }">
					<div class="mybookColor"></div>
				</div>
			</c:forEach>
			
			<!-- 
				<div class="mybook" id="b01">
					<span>Game<br><br>Of<br><br>Thrones</span>
					<input class="mybook1" type="hidden" value="fileUrl">
					<div id="mybookColor"></div>
				</div>
			 -->
				 
			</div> <!-- mybooks -->
			
		</div> <!-- BookList -->
		
	</div> <!-- wrapper -->
	
	
	<!-- 
	<button id="myBtn">Open Modal</button>
	 -->
	<!-- 책목록 미니창 띄우기 -->
	<!-- myModal -->
	<div id="boughtBookList" class="modal">
	  <div class="modal-content">
	    <p>나의 구매(대여)책 목록</p>
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
						<td>${map["TITLE"] }</td>
						<td>${map["PUBLISHER"] }</td>
						<td><fmt:formatDate value="${map['RENT_END'] }" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:if>
			</c:forEach>
			
				
		<!-- 
			<tr>
				<td>음악은 그런거니깐</td>
				<td>Germany</td>
				<td>오늘내일</td>
			</tr>
		-->
		  </tbody>
		  
		</table>

	  </div>
	</div>
			
	<!-- 책목록 미니창 띄우기 -->
	<!-- myModal -->
	<div id="rentBookList" class="modal">
	  <div class="modal-content">
	    <p>나의 구매(대여)책 목록</p>
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
						<td>${map["TITLE"] }</td>
						<td>${map["PUBLISHER"] }</td>
						<td><fmt:formatDate value="${map['RENT_END'] }" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:if>
			</c:forEach>
			
				
		<!-- 
			<tr>
				<td>음악은 그런거니깐</td>
				<td>Germany</td>
				<td>오늘내일</td>
			</tr>
		-->
		  </tbody>
		  
		</table>

	  </div>
	</div>
	
	
	

</body>
</html>