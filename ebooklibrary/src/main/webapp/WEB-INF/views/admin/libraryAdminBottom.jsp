<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- include bottom -->
</div>
<!--container-->
<script type="text/javascript">
	$(function() {
		$.ajax({
			url:"<c:url value='/visitorBottom.do'/>",
			type:"GET",
			success:function(res){
				$("#todayVisitor").text(res.todayVisitor);
				$("#totalVisitor").text(res.totalVisitor);
			}
		});//ajax
	});
</script>


    <!--//footer-->
<div id="footer"> 

<div id="visitor">
  <h2 class="skip">방문자수</h2>
  <dl>
  <dt>오늘 : </dt><dd id="todayVisitor"></dd>
  <dt>전체 : </dt><dd id="totalVisitor"></dd>
  </dl>
  </div> 
 
  <div id="foot_add"> 
  <h2 class="skip">하단 주소</h2>
  <address>[16705] 영통구 반달로 45(영통동 1012-5) 전화 : 201-8350  팩스 : 201-8310</address>           
  <p>Copyright 2012 by 수원시 도서관사업소 All Right Reserved</p>  
  </div>
  
  <div id="foot_menu">
  	
  </div>


 </div>

 <script type="text/javascript">
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-54129288-1', 'auto');
  ga('send', 'pageview');

</script>


    <!--#//footer--> 
</div>
<!--container_out-->  
</body>
</html>