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
<script type="text/javascript" src="${path}/include/js/common.js"></script>
<script src="${path}/ckeditor/ckeditor.js"></script>

	<!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="resources/img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/css/magnific-popup.css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/css/themify-icons.css">
    <link rel="stylesheet" href="resources/css/nice-select.css">
    <link rel="stylesheet" href="resources/css/flaticon.css">
    <link rel="stylesheet" href="resources/css/gijgo.css">
    <link rel="stylesheet" href="resources/css/animate.css">
    <link rel="stylesheet" href="resources/css/slick.css">
    <link rel="stylesheet" href="resources/css/slicknav.css">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">

    <link rel="stylesheet" href="resources/css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
    
	<script type="text/javascript">
		$("#btnSave").click(function() {
			var title = document.form1.title.value;
			if (title == "") {
				alert("여행 제목을 입력하세요.");
				document.form1.title.focus();
				return;
			}
			document.form1.submit();
		});

		$('#date').change(function() {
			var date = $('#date').val();
			alert(date);
		});
	</script>
</head>
<body>
	<!-- header-start -->
    <header>
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid">
                    <div class="header_bottom_border">
                        <div class="row align-items-center">
                            <div class="col-xl-2 col-lg-2">
                                <div class="logo">
                                    <a href="/kanbu/main.com">
                                        <img src="resources/img/logo.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6">
                                <div class="main-menu  d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a class="active" href="/kanbu/main.com">home</a></li>
                                            <li><a href="/kanbu/mapView.com">일정만들기</a></li>
                                            <li><a class="" href="travel_destination.html">여행지정보</a></li>
                                            <li><a href="/kanbu/board/reviewList.com">게시판 <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                        <li><a href="/kanbu/board/reviewList.com">여행후기</a></li>
                                                        <li><a href="/kanbu/board/noticeList.com">공지사항</a></li>
                                                        <li><a href="/kanbu/board/questionList.com">자주하는질문</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-4 d-none d-lg-block">
                                <div class="social_wrap d-flex align-items-center justify-content-end">
                                    <div class="social_links d-none d-xl-block">
                                        <ul>
                                        	<c:if test="${sessionScope.status > 0}">
                                        		<li><p>${sessionScope.nick}님 환영합니다.</p></li>
                                        	</c:if>
                                            <li><a href="#"> <i class="fa fa-user"></i> </a></li>
                                            <c:if test="${sessionScope.status > 0}">
                                        		<li><a href="logout.com"> <i class="fa fa-unlock"></i> </a></li>
                                        	</c:if>
                                        	<c:if test="${empty(sessionScope.status)}">
                                        		<li><a href="login.com"> <i class="fa fa-lock"></i> </a></li>
                                        	</c:if>
                                            
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="seach_icon">
                                <a data-toggle="modal" data-target="#exampleModalCenter" href="#">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div>
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </header>
    <!-- header-end -->

	<form name="updatePlan" id="updatePlan" action="/kanbu/updatePro.com?index_num=${plan.index_num}" method="post">
		<div style="margin: 50px 20px 20px 10px; text-align: center;">
			<div>
				<input name="title" id="title" size="80" value="${plan.title}">
			</div>
			<br>
			<div>
				여행 출발날짜 : 
				<input type="date" name="startDay" value="${plan.startDay}"	id="startDay" /> 
				~ 여행 도착날짜 : 
				<input type="date" name="arrivalDay" value="${plan.arrivalDay}" id="arrivalDay" />
			</div>
	
			<hr>
	
			<div>
				<p>일차</p>
				<input type="text" name="schedule1" size="30"> <br> 
				<input type="text" name="schedule2" size="30"> <br> 
				<input type="text" name="schedule3" size="30"> <br> <br>
	
				<p>일차</p>
				<input type="text" name="schedule1" size="30"> <br> 
				<input type="text" name="schedule2" size="30"> <br> 
				<input type="text" name="schedule3" size="30"> <br>
			</div>
	
			<hr>
	
			<div>
				<p>🚗 <b>이동수단</b></p>
				수정할 이동수단을 선택해주세요. <br> 
				<select size="1" name="traffic"	value="${plan.traffic}">
					<option value="자동차">자동차</option>
					<option value="택시">택시</option>
					<option value="버스">버스</option>
					<option value="기차">기차</option>
					<option value="지하철">지하철</option>
					<option value="도보">도보</option>
				</select>
			</div>
			<hr>
	
			<div>
				<p>💵 <b>여행경비</b></p>
				수정할 여행 경비를 입력해주세요. <br> 
				<input type="text" name="expense" size="10"	value="${plan.expense}"> 만원
			</div>
	
			<br>
	
			<div>
				<input type="submit" class="boxed-btn4" name="btnUpdate" style="margin-right:5px;" value="수정완료"> 
				<input type="button" class="boxed-btn4" name="btnList" value="목록보기"
					onclick="location.href='list.com'">
			</div>
		</div>
	</form>


</body>
</html>