<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 일정 수정</title>
<script src="/kanbu/resources/js/jquery-3.6.0.min.js" type="text/javascript"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
	<script src='//code.jquery.com/jquery.min.js'></script>
	<script src="/kanbu/resources/js/jquery.cookie.js" type="text/javascript"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

	<!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="/kanbu/resources/img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="/kanbu/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/kanbu/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/kanbu/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/kanbu/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="/kanbu/resources/css/themify-icons.css">
    <link rel="stylesheet" href="/kanbu/resources/css/nice-select.css">
    <link rel="stylesheet" href="/kanbu/resources/css/flaticon.css">
    <link rel="stylesheet" href="/kanbu/resources/css/gijgo.css">
    <link rel="stylesheet" href="/kanbu/resources/css/animate.css">
    <link rel="stylesheet" href="/kanbu/resources/css/slick.css">
    <link rel="stylesheet" href="/kanbu/resources/css/slicknav.css">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">

    <link rel="stylesheet" href="/kanbu/resources/css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
    
    <c:if test="${empty (sessionScope.status)}">
    	<script type="text/javascript">
    		alert("로그인 후 이용가능합니다.");
    		location.href = "/kanbu/login.com";
    	</script>
    </c:if>
    
    <style>
		.div1{
			  width:22%;
			  height:850px;
			  padding-top: 20px;
			  margin-right: 5px;
			  margin-left: 5px;
			  border: 1px solid gray;
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
			  width: 20.5%;
			  height: 850px;
			  border: 1px solid gray;
		  }
		  
		  .div_top{
		  	margin-top: 10px;
		  	margin-bottom: 10px;
		  	height: 40px;
		  }
		  
		  .font {
		  	size: 2em;
		  	color: #D3D3D3;
		  }
		  
		  .pList {
		  	font:normal normal 12px/1.6  "나눔고딕";
		  	color: gray;
		  	margin: 5px 0px 3px 0px;
		  	}
		  	
		  	.p1 {
		  	font:normal normal 18px/1.6  "나눔고딕";
		  	color: #111111;
		  	margin: 5px 0px 3px 0px;
		  	}
		  	
		  	.mini {
		  	font:normal normal 14px/1.6  "나눔고딕";
		  	color: gray;
		  	margin: 5px 0px 3px 0px;
		  	}
		  	
		  	.search {
		  		background-color: #ff4951;
		  		border: 0;
		  		outline: 0;
		  		color: #fff;
		  		border-radius: 0.35em;
		  		wegiht: 9px;
		  		height: 30px;
		  	}	
	</style>
	
	<!-- 지도 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe4da653d661d051c0f1aed85923ec4c"></script>

	<!-- 찜목록 기능 -->
	<script type="text/javascript">
	$(document).ready(function() {
		console.log("##쿠키 꺼내기##");
		var userId = $("#userId").val();
		console.log("사용자Id::"+userId);
		var title = $("#title").val();
		console.log("일정제목::"+title);
		// 쿠키꺼내기
		var cookieVal = $.cookie(userId+'_'+title);
		console.log("쿠키당::"+cookieVal);
		
		var htmlCookieList = "";
		var favorTitleList = cookieVal.split("|");
		for(var i=0; i<favorTitleList.length; i++) {
			var favorTitle = favorTitleList[i];
			if(favorTitle != "") {
				console.log("favorTitle["+i+"]:"+favorTitle);
				htmlCookieList += "<div><p>"+favorTitle+"</p></div>";
			}
		}
		
		// 여행지 일정에 상세(디테일)에 보여주기
		$("#cookie_list").html(htmlCookieList);
		
		
		$(document).on("click", "#fav_add", function() {
			var $place_area = $(this).parent().parent().clone(true);
			$place_area.find(".remove").remove();
			
			var newTitle = $place_area.find("p").text();
			console.log("newTitle::"+newTitle);
			
			// 유효성 체크(중복)
			var isFavAdd = true;
			$("#fav_list div").each(function(index, element){
				var oldTitle = $(element).find("p").text();
				console.log("index:"+index+", oldTitle:"+oldTitle);
				if(oldTitle == newTitle) {
					console.log(newTitle+"이미 존재합니다. 중복불가 항목 입니다.");
					isFavAdd = false;
					$(element).remove();
					return;
				}
			});
			
			if(isFavAdd){
				$("#fav_list").append($place_area);
				var place = $place_area.find("#place").val();
				placeArr.push(place);
				console.log(place);
			}
		});
		
		<!-- 날짜 계산 -->
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
			$('.Bigdays').text('<h3>'+days+'일차</h3>');
		});
		
		<!-- 데이터 입력 유효성검사 (제목) -->
		$("#planSave").click(function() {
			var title=$('#title').val();
			var startDay = $('#startDay').val();
			var arrivalDay = $('#arrivalDay').val();
			var expense=$('#expense').val();
			
 			if(title=="" || title == null) {
 				alert("여행 제목을 입력하세요.");
 				document.mapView.title.focus();
 				return false;
 			}
 			if(startDay == "" || startDay == null){
 				alert("출발 날짜를 선택하세요.");
 				document.mapView.startDay.focus();
 				return false;
 			}
 			if(arrivalDay == "" || arrivalDay == null){
 				alert("도착 날짜를 선택하세요.");
 				document.mapView.arrivalDay.focus();
 				return false;
 			}
 			if(expense == "" || expense == null){
 				alert("여행 경비를 입력하세요.");
 				document.mapView.expense.focus();
 				return false;
 			}

 			document.mapView.submit();
 			
 			/* 쿠키저장 */
 			console.log("##쿠키에 저장됩니다.##");
			var userId = $("#userId").val();
			console.log("사용자ID::"+userId);
			var title = $("#title").val();
			console.log("일정제목::"+title);
			
			var favorTitleList = "";
			$("#fav_list #ddiv").each(function(index, element){
				var favorTitle = $(element).find("p").text();
				favorTitleList += favorTitle;
				favorTitleList += "|";
			});
			console.log("찜목록들::"+favorTitleList);
			//쿠키에 저장 $.cookie('name', 'value', {expires:7});
			$.cookie(userId+'_'+title, favorTitleList, {expires:30});
 		});
	});

		
	</script>
    
</head>
<body>

	<form name="updatePlan" id="updatePlan" action="/kanbu/updatePro.com?index_num=${plan.index_num}" method="post">
		
		<div class="outer-div">
		<div class="inner-div">
		
			<div class="div_top">
				<a href="/kanbu/main.com">
					<img src="/kanbu/resources/img/logo.png" height="40" style="margin-right:20px; margin-left: 10px;">
				</a>
				<span style="margin-right:20px;">
					<font face="나눔고딕" size="4"><b>${sessionScope.nick}님의 여행일정</b></font>
				</span>
				<input name="title" id="title" size="80" placeholder="여행 제목을 입력하세요" style="font-size:15px;" value="${plan.title}">
				<input type="hidden" id="userId" value="${sessionScope.id}">
			</div>
			
			<div class="div1">
				<div style="text-align: center;">
					<br><br>
					<font face="나눔고딕" size="6"><b>JEJU Island♡</b></font> <br>
					<font style="color:#C0C0C0; size:2em;">Enjoy Your Travel!</font>
					<div>
					<br><br>
						<div class="schedule">
							<p id="bigDays"></p>
						</div>
					<p id="days" class="days"></p>
					<a>
					<input type="date" name="startDay" id="startDay" value="${plan.startDay}"/>
					~
					<input type="date" name="arrivalDay" id="arrivalDay" value="${plan.arrivalDay}"/>
					</a>
					</div>	<br>
					<div>
						<font face="나눔고딕" size="4">🚗 <b>이동수단</b></font> <br>
						<p class="mini">이동수단을 선택해주세요.</p>
						<select size="1" name="traffic" value="${plan.traffic}" style="width:80px">
							<option value="자동차">자동차</option>
							<option value="택시">택시</option>
							<option value="버스">버스</option>
							<option value="기차">기차</option>
							<option value="지하철">지하철</option>
							<option value="도보">도보</option>
						</select>
					</div>	<br>
					
					<div>
						<font face="나눔고딕" size="4">💵 <b>여행경비</b></font> <br>
						<p class="mini">여행 경비를 입력해주세요.</p>
						<input type="text" name="expense" id="expense" value="${plan.expense}" size="10"> 만원
					</div>	<br>
					
					<div>
						<input type="submit" class="boxed-btn4" name="btnUpdate" style="margin-right:5px;" value="수정완료"> 
						<input type="button" class="boxed-btn4" name="btnList" value="목록보기"
							onclick="location.href='list.com'">
					</div>
					<br>
				</div>
					<hr>
						<div style="text-align: center;">
							<font face="나눔고딕" size="4">❤️ <b>찜 목록</b></font>
						</div>
						<div style="width:100%; height:252px; overflow:auto;">
							<div id="fav_list" style="margin-top:3px; margin-bottom:3px; margin-left:5px; margin-right:5px;">
								<div id=cookie_list style="text-align:center;"> </div>
							</div>
						</div>
			</div>
			
			<div class="div2">
				<!-- 지도 -->
   				<div id="map" style="width:100%;height:100%;"></div>
			</div>
			
			<div class="div3" style="overflow:auto;">
				<div>
					<div style="margin-left:7px; margin-top:5px; margin-bottom:15px;">
						<div>
							<input type="text" id="keyword" size="30" placeholder="여행지를 검색하세요.">
							<input type="button" class="search" value="검색" onclick="return searchPlace();">
						</div>
					</div>
				</div>
				
			
			<!-- 여행지 목록 -->
			<c:if test="${placeCount > 0}">
			<c:forEach var="place" items="${placeList}" varStatus="status">
			<div style="height:150px; width:350px;">
				<div class="place_area" style="margin-top:3px; margin-bottom:3px; margin-left:5px; margin-right:5px;">
					<div style="float:left;">
						<img src="${uploadPath+=place.picture1}" height="100" width="100">
					</div>
					<div style="float:left; margin-left:5px; height:100px; width:230px; 
						 display:inline-block; text-overflow:ellipsis;">
							<p class="p1" id="${status.index}" style="cursor: pointer;" 
							   onclick="markMap(${status.index});"><b>${place.name}</b></p>
							<p class="pList" id="addr"><b>주소:</b> ${place.addr}</p>
							<p class="pList" id="parking"><b>주차여부:</b> 
								<c:if test="${place.parking == 1}">
									가능
								</c:if>
								<c:if test="${place.parking != 1}">
									불가능
								</c:if>
							</p>
							<input type="hidden" id="place" value="${place.index_num}"/>
							<input type="hidden" id="latitude${status.index}" value="${place.latitude}" />
							<input type="hidden" id="longitude${status.index}" value="${place.longitude}" />
							<input type="button" value="상세보기" class="remove" style="float:right; cursor: pointer;" onclick="window.open('/kanbu/info.com?placeNum=${place.index_num}',
																			'detail_popup', 'width=800, height=500, location=no, scrollbars=yes');">
							<input type="button" value="❤️" id="fav_add" class="remove" style="float:right; margin-right:5px; cursor: pointer;">
					</div>
					</div>
				</div>
			</c:forEach>
			
			</c:if>
			
			<c:if test="${placeCount == 0}">
				<div style="margin-top:7px; margin-bottom:7px; margin-left:5px; margin-right:5px;">
					<div style="float:left; margin-left:5px;">
							<h5>해당 장소가 없습니다.</h5>
					</div>
				</div>
			</c:if>

			</div>		
		</div>
	</div>

	</form>

	<!-- 지도 기본값(제주도 위도, 경도) -->
 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe4da653d661d051c0f1aed85923ec4c"></script>
   	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    	mapOption = { 
       		center: new kakao.maps.LatLng(33.3616837, 126.5204118), // 지도의 중심좌표(해당 장소 위도, 경도)
       		level: 10 // 지도의 확대 레벨
    	};
			
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var marker = new kakao.maps.Marker();

		// 타일 로드가 완료되면 지도 중심에 마커를 표시합니다
		kakao.maps.event.addListener(map, 'tilesloaded', displayMarker);

		function displayMarker() {
    		// 마커의 위치를 지도중심으로 설정합니다 
    		marker.setPosition(map.getCenter()); 
    		marker.setMap(map); 

    		// 아래 코드는 최초 한번만 타일로드 이벤트가 발생했을 때 어떤 처리를 하고 
    		// 지도에 등록된 타일로드 이벤트를 제거하는 코드입니다 
    		// kakao.maps.event.removeListener(map, 'tilesloaded', displayMarker);
		}
	</script>
	
	<script type="text/javascript">
	function markMap(index){
			<!-- 클릭시 해당 장소 마크 -->
   			var latitude = $('#latitude'+index).val();
   			var longitude = $('#longitude'+index).val();
   			console.log(latitude);
   			console.log(longitude);
		
   			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    		mapOption = { 
        		center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표(해당 장소 위도, 경도)
        		level: 3 // 지도의 확대 레벨
    		};
				
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			var marker = new kakao.maps.Marker();
	
			// 타일 로드가 완료되면 지도 중심에 마커를 표시합니다
			kakao.maps.event.addListener(map, 'tilesloaded', displayMarker);
	
			function displayMarker() {
	    		// 마커의 위치를 지도중심으로 설정합니다 
	    		marker.setPosition(map.getCenter()); 
	    		marker.setMap(map); 
	
	    		// 아래 코드는 최초 한번만 타일로드 이벤트가 발생했을 때 어떤 처리를 하고 
	    		// 지도에 등록된 타일로드 이벤트를 제거하는 코드입니다 
	    		// kakao.maps.event.removeListener(map, 'tilesloaded', displayMarker);
			};
   		};
	</script>
	
	<script type="text/javascript">
		function searchPlace(){
			var keyword = $('#keyword').val();
			
			<!--유효성 검사 -->
			if(keyword != null && keyword !=""){
				window.location.href = "/kanbu/mapView/search.com?keyword="+keyword;
			}else{
				alert("검색할 장소를 입력해주세요.");
				return false;
			}
			
		}
	
	
	</script>


</body>
</html>