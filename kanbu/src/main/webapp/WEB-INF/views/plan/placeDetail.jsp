<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>장소 상세 화면</title>
	
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
   <link rel="stylesheet" href="/kanbu/resources/css/slicknav.css">
   <link rel="stylesheet" href="/kanbu/resources/css/style.css">
   
	<style>
		.title {
			font:normal normal 18px/1.6  "나눔고딕";
		  	color: #111111;
		  	margin: 5px 0px 3px 0px;
		}
		
		.content {
			font:normal normal 14px/1.6  "나눔고딕";
		  	color: #111111;
		  	margin: 5px 0px 3px 0px;
		}
	</style>
</head>
<body>
	<div style="height:800px; width:450px;">	<!-- 전체 감싸는 폼 -->
		<c:if test="${placeCount > 0}">
		<c:forEach var="place" items="${placeList}">
			<!-- <div style="height:390px; width:400px; float:left;"> -->	<!-- 대표 사진 -->
			<div style="float:left; margin-bottom:10px;">
				<img src="${place.picture1}" height=390; width=390;>
			</div>
			
			<!-- <div style="height:390px; width:400px; float:left;"> -->
			<div style="float:left;">
				<p class="title"> <b>${place.name}</b> </p>
				<p class="content"> <b>주소: </b>${place.addr}</p>
				<p class="content"> <b>주차여부: </b>
					<c:if test="${place.parking == 1}">
						주차가능
					</c:if>
					<c:if test="${place.parking != 1}">
						주차불가
					</c:if>
				</p>
				<p class="content"> <b>오픈 시간: </b>
						<c:if test="${place.opening > 0 && place.opening < 10}">
							0${place.opening}:00
						</c:if>
						<c:if test="${place.opening >= 10}">
							${place.opening}:00
						</c:if>
						<c:if test="${place.opening == 0}">
							<span> 시간정보가 없습니다. </span>
						</c:if>
					</p>
				<p class="content"> <b>마감시간: </b>
					<c:if test="${place.closing > 0 && place.closing < 10}">
						0${place.closing}:00
					</c:if>
					<c:if test="${place.closing >= 10}">
						${place.closing}:00
					</c:if>
					<c:if test="${place.closing == 0}">
						<span> 시간정보가 없습니다. </span>
					</c:if>
				</p>
				<p class="content"> 💸 <b>입장료</b> </p>
					<p class="content"> 🧑 <b>어른 요금: </b>
								 <c:if test="${place.fee1 > 0}">
								 <fmt:formatNumber value="${place.fee1}" type="currency"/>
								 </c:if>
								 <c:if test="${place.fee1 == 0}">
								 	<span> 요금 정보가 없습니다. </span>
								 </c:if>
					</p>
					<p class="content"> 👶 <b>아이 요금: </b>
								  <c:if test="${place.fee2 > 0}">
								  <fmt:formatNumber value="${place.fee2}" type="currency"/>
								  </c:if>
								  <c:if test="${place.fee2 == 0}">
								  	<span> 요금 정보가 없습니다. </span>
								  </c:if>
					</p>
			</div>
		</c:forEach>
		</c:if>
	</div>

</body>
</html>