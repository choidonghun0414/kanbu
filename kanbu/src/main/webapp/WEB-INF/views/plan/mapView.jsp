<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<!-- 날짜 계산 -->
	<script type="text/javascript">
		$(document).ready (function(){
			$('#startDay').mouseleave(function(){
				var startDay = $('#startDay').val();
			});
			
			$('#arrivalDay').mouseleave(function(){
				var startDay = $('#startDay').val();
				var arrivalDay = $('#arrivalDay').val();
				
				var startArr = startDay.split('-');
				var arrivalArr = arrivalDay.split('-');
				
				var startDate = new Date(startArr[0],startArr[1]-1,startArr[2]);	// Date(년, 월, 일)
				var arrivalDate = new Date(arrivalArr[0],arrivalArr[1]-1,arrivalArr[2]);
				
				// 날짜 차이 구하기
				var diff = arrivalDate - startDate;
				var currDay = 24 * 60 * 60 * 1000;	// 단위환산(시*분*초*밀리세컨)
				var days = parseInt((diff/currDay)+1);
				
				// 날짜 표현하기
				$('.days').text("회원님의 여행기간은 "+days+" 일 입니다.");
				$('.Bigdays').text('<h3>'+i+'일차</h3>');
				
				// 여행 플랜 테이블 생성하기
				for(var i=1; i<=days; i++){
					$('.scheduleTable').append(
						'<h3>'+i+'일차</h3>'+
						'<div class="schedule">'+
						'<input type="text" name="schedule'+i+'" size="30"> <input type="button" class="btnAdd" value="+"> <br>'+
						'</div>'+
						'<br>'		
					);
				};
			});
		});
	</script>
	
	<!-- 데이터 입력 유효성검사 (제목) -->
	<script type="text/javascript" src="script.js?ver=1">
		$("#planSave").click(function() {
			var title=document.mapView.title.value;
 			if(title=="") {
 				alert("여행 제목을 입력하세요.");
 				document.mapView.title.focus();
 				return;
 			}
 			document.mapView.submit();
 		});
	</script>
	
	<!-- 팝업창 가운데 정렬
	<script>
		function popupPlace(href, w, h) {
			var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
			var yPos = (document.body.offsetHeight/2) - (h/2);
			
			window.open(href, "detail_popup", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes, scrollbars=yes");
		}
	</script> -->
	
<style>
   	/* .outer-div{
	  width:100%;
	  height:auto;
	  text-align:center;
	  padding-top: 10%;
	  padding-bottom: 10%;
	  margin:0;
	  font-size:0;
	  word-break:break-all;
	}
	 
	.inner-div{
	  display:inline-block;
	  width:30%;
	  height:30vw;
	  margin:0;
	  word-break:break-all;
	} */
	
	.div1{
		  width:20%;
		  height:830px;
		  padding-top: 20px;
		  margin-right: 5px;
		  border: 1px solid gray;
		  text-align: center;
		  transition-property: background-color;
		  transition-duration: 1s;
		  transition-timing-function: ease-out;
		  transition-delay: 50ms;
		  word-break:break-all;
		  float: left;
	  }
	  
	  .div2{
		  float: left;
		  width: 55%;
		  height:850px;
		  margin-right: 5px;
		  border: 1px solid gray;
		  text-align: center;
	  }
	  
	  .div3{
		  float: left;
		  width: 20%;
		  height: 850px;
		  border: 1px solid gray;
	  }
	  
	  .div_top{
	  	height: 60px;
	  }
	  
	  .font {
	  	size: 2em;
	  	color: #D3D3D3;
	  }
	  
</style>
</head>
<body>

<form id="mapView" name="mapView" method="post" action="/kanbu/insert.com">

	<div class="outer-div">
		<div class="inner-div">
		
			<div class="div_top">
				<img src="resources/img/slogo.png" height="40" style="margin-right:20px;">
				<span style="margin-right:20px;">
					${user.nick} 님의 여행일정
				</span>
				<input name="title" id="title" size="80" placeholder="여행 제목을 입력하세요"
					style="font-size:15px;">
			</div>
			
			<div class="div1">
				<h2>JEJU♡</h2>
				<font style="color:#C0C0C0; size:2em;">Jeju Island</font>
			<div>
			<br>
				<div class="schedule">
					<p id="bigDays"></p>
				</div>
			<p id="days" class="days"></p>
			<a>
			<input type="date" name="startDay" id="startDay" required="required"/>
			~
			<input type="date" name="arrivalDay" id="arrivalDay" required="required"/>
			</a>
			</div>	<br>
			<div>
				<h3>🚗 이동수단</h3>
				이동수단을 선택해주세요. <br><br>
				<select size="1" name="traffic" style="width:80px">
					<option value="자동차">자동차</option>
					<option value="택시">택시</option>
					<option value="버스">버스</option>
					<option value="기차">기차</option>
					<option value="지하철">지하철</option>
					<option value="도보">도보</option>
				</select>
			</div>	<br>
			
			<div>
				<h3>💵 여행경비</h3>
				여행 경비를 입력해주세요. <br><br>
				<input type="text" name="expense" size="10"> 만원
			</div>	<br>
			
			<button type="submit" id="planSave">여행 일정 생성</button>
			<br>
			<hr>
			
			찜 목록
			</div>
			
			<div class="div2">
				<h1>지도API</h1>
			</div>
			
			<div class="div3">
				<div>
					<div style="margin-left:5px; margin-top:5px; margin-bottom:15px;">
						<div>
							<input type="text" placeholder="여행지를 검색하세요.">
							<input type="button" value="검색">
						</div>
					</div>
				</div>
			
				<div style="margin-top:7px; margin-bottom:7px; margin-left:5px; margin-right:5px;">
					<div style="float:left;">
						<img src="resources/img/logo.png" height="100" width="100">
					</div>
					<div style="float:left; margin-left:5px;">
							<h3>장소이름${place.name}</h3>
							<p>주소: ${place.addr}</p>
							<p>주차여부: ${place.parking}</p>
							<input type="button" value="상세보기" onclick="window.open('placeDetail.com?index_num=${place.index_num}',
																		'detail_popup', 'width=700, height=500, location=no, scrollbars=yes');">
							<input type="button" value="♥">
					</div>
				</div>
			</div>
			
		</div>
	</div>


</form>

</body>
</html>