<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/rolling/jq.rolling.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/rolling/jquery-ui.min.js'/>"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jquery/rolling/jq.rolling2.css" />
<script type="text/javascript">
	$(document).ready(function(){
		$("#rolling").rolling(450,270,{autoscroll:1, delay:2200});
		$("#rolling2").rolling(450,270,{autoscroll:1, delay:2200});
		//alert($(".a").val());	
	});
</script>
<div class="notice_Ad">
	<p class="notice_p">추천 도서</p>
		<div id="rolling">
				<ul>
				<c:if test="${!empty recommandList}">
				<c:set var="n" value="1" />
					<c:forEach var="vo" items="${recommandList }">					
						<li class="sp0${n }">
						<a href="${vo.eventUrl }">
							<img alt="테스트" 
							src="${pageContext.request.contextPath }/bookevent/${vo.eventImageUrl}" ></a>
						</li>
						<c:set var="n" value="${n+1 }" />
					</c:forEach>
					
				</c:if>
						         
					<!-- <li class="sp02">SAMPLE 02</li>
					<li class="sp03">SAMPLE 03</li>
					<li class="sp04">SAMPLE 04</li>
					<li class="sp05">SAMPLE 05</li> -->
				</ul>
			</div>

	<p class="notice_p2">베스트 셀러</p>
		<div id="rolling2">
				<ul>
				<c:if test="${!empty bestList}">
				<c:set var="n" value="1" />
					<c:forEach var="vo" items="${bestList }">					
						<li class="sp0${n }">
						<a href="${vo.eventUrl }">
							<img alt="테스트" 
							src="${pageContext.request.contextPath }/bookevent/${vo.eventImageUrl}" ></a>
						</li>
						<c:set var="n" value="${n+1 }" />
					</c:forEach>
					
				</c:if>
						         
					<!-- <li class="sp02">SAMPLE 02</li>
					<li class="sp03">SAMPLE 03</li>
					<li class="sp04">SAMPLE 04</li>
					<li class="sp05">SAMPLE 05</li> -->
				</ul>
			</div>
</div>