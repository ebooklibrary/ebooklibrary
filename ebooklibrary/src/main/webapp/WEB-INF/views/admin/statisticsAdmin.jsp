<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="libraryAdminTop.jsp" %>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>
<script type="text/javascript">
	$(function() {		
		
		$("#btnapi").click(function() {
			window.open("<c:url value='http://admin.iamport.kr/payments'/>",
					"iamport",
			"width=1500,height=800,left=50,top=50,resizable=yes,location=yes");
		});//button
		
		var today = new Date();
		var thisYear=today.getFullYear();
		
		$('#highchartDiv').highcharts({
            /* 
			chart: {
	            type: 'column'
	        },
	         */
			title: {
                text: thisYear+'년 매출',
                x: -20 //center
            },
            subtitle: {
                text: '',
                x: -20
            },
            xAxis: {
                categories: ['1월', '2월', '3월', '4월', '5월', '6월',
                    '7월', '8월', '9월', '10월', '11월', '12월']
            },
            yAxis: {
                title: {
                    text: '매출(원)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: '원'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series: [{
                name: '판매',
                /* data: [100,120 ,150, 140, 135, 110, 120, 120, 120, 130, 160, 105] // <--여기에 배열값을 넘겨야함 */
                data : [${fn:join(alist, ',')}]
            }/* ,{
                name: '대여',
                data : [${fn:join(rent, ',')}]
            } */]
        });
		 
	});

</script>
<p id="adminTitleP"><img alt="아이콘" src="<c:url value='/images/mybook/icon/process.png'/>"> 매출 요약 페이지</p>
<%-- 
<c:import url="/event/mainEvent.do"></c:import>
<button id="event1">이벤트 이미지등록</button>
 --%>
	<div id="highchartDiv" style="min-width: 310px; height: 400px; margin: 0 auto">
	
	<c:set var="buyPrice" value="0"/>
	<c:set var="rentPrice" value="0"/>
 	<c:forEach var="list" items="${alist}">
		 ${list}
		 <input type="hidden" id="val_${list}" value="${list}"/>
	</c:forEach>
	
	<%-- 
 	<c:forEach var="json" items="${sell}">
		 ${json}
		 <input type="hidden" id="val_${json}" value="${json}"/>
	</c:forEach>
 	<c:forEach var="json" items="${rent}">
		 ${json}
		 <input type="hidden" id="val_${json}" value="${json}"/>
	</c:forEach>
	 --%>
	</div>
	<button id="btnapi">매출 전표 페이지</button>

<%@ include file="libraryAdminBottom.jsp" %>