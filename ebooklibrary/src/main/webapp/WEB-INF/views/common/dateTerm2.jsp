<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="<c:url value='/jquery/jquery-ui.css'/>"
	type="text/css">
	
<script src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"
	type="text/javascript"></script>
<script src="<c:url value='/jquery/jquery-ui.js'/>"
	type="text/javascript"></script>
	    
<script type="text/javascript">
	$(document).ready(function(){
		$("#startDay").datepicker({
			dateFormat:"yy-mm-dd",
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월',
			            '7월','8월','9월','10월','11월','12월']
		});
		$("#endDay").datepicker({
			dateFormat:"yy-mm-dd",
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월',
			            '7월','8월','9월','10월','11월','12월']
		});
		
		$.setToday();
		
		$("#btWeek").click(function(){
			$.setStartDate("d", 7);
		});

		$("#btMonth1").click(function(){
			$.setStartDate("m", 1);
		});
		
		$("#btMonth3").click(function(){
			$.setStartDate("m", 3);
		});
	});
	
	$.setStartDate = function(type, term){
		//종료일을 기준으로 7일전, 1개월전, 3개월전의 날짜를
		//구해서 시작일에 셋팅
		
		//종료일에 해당하는 날짜 구하기
		var str = $("#endDay").val().split("-"); //2016-09-13
		var endDate = new Date(str[0], str[1]-1, str[2]);
		// => new Date(2016, 8, 13)
		
		if(type=="d"){
			endDate.setDate(endDate.getDate()-term);
		}else if(type=="m"){
			endDate.setMonth(endDate.getMonth()-term);
		}
		
		$("#startDay").val($.getDate(endDate));
	}
	
	$.setToday=function(){
		if($("#startDay").val()==null 
			|| $("#startDay").val()==""){
			var today=new Date();
			var str = $.getDate(today);
			
			$("#startDay").val(str);
			$("#endDay").val(str);
		}
	}
	
	$.getDate = function(date){
		var str = date.getFullYear()+"-"
			+ $.findDate(date.getMonth()+1)+"-"
			+ $.findDate(date.getDate());
		
		return str;
	}
	
	$.findDate = function(d){
		var result=d;
		if(d<10){
			result="0"+d;
		}	
		return result;
	}
	
	/* 
	function setToday2(){
		
	} */
</script>
    
	조회기간
	<input type="button" id="btWeek" value="1주일" >
	<input type="button" id="btMonth1" value="1개월" >
	<input type="button" id="btMonth3" value="3개월" >
		
	<input type="text" name="startDay" id="startDay" 
		value="${param.startDay}"> 
	~ 
	<input type="text" name="endDay" id="endDay"
		value="${dateSearchVO.endDay }">
		