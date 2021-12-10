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
    
    <!-- bradcam_area  -->
    <div class="bradcam_area bradcam_bg_4">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text text-center">
                        <h3>My Travel is The Best!</h3>
                        <p></p>
                        <p>Wherever You Want To Go, With Kanbu</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

<div style="margin: 40px 20px 20px 10px; text-align: center;">
	<h3>${sessionScope.nick}님의 여행일정</h3>
	<br>
	<div>
		<p><b>${plan.title}</b></p>
	</div>
	
	<span>작성일자</span>
	<fmt:formatDate value="${plan.reg_date}" pattern="yyyy.MM.dd"/> 
	<span>
		${plan.startDay}
		~
		${plan.arrivalDay}
	</span>
	
	<br><br>

	<div>
		<p>❤️<b>이번 여행 찜리스트</b></p>
		${plan.place}
	</div>

	<br><br>
	
	<div> 
		<p>🚗 <b>이동수단</b> </p>
		${sessionScope.nick}님의 이동수단은 <b>${plan.traffic}</b>입니다.
	</div>
	
	<br><br>
	
	<div>
		<p>💵 <b>여행경비</b> </p>
		${sessionScope.nick}님의 경비는 <b>${plan.expense}만원</b>입니다.
	</div>

	<br>
	
	<div>
		<input type="button" class="boxed-btn4" value="수정하기" style="margin-right:5px;"
			onclick="location.href='/kanbu/update.com?index_num=${index_num}'"></input>
		<input type="button" name="btnList" class="boxed-btn4" value="목록보기"
			onclick="location.href='list.com'" />
	</div>
</div>
	

</body>
</html>