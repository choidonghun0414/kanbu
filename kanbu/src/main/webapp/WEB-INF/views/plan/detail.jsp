<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>나의 일정 상세</title>
   <script src="/kanbu/resources/js/jquery-3.6.0.min.js" type="text/javascript"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
   <script src='//code.jquery.com/jquery.min.js'></script>
   <script src="/kanbu/jquery.cookie.js" type="text/javascript"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
   <!-- 
   <script type="text/javascript">
      $(document).ready(function() {
         console.log("##쿠키 꺼내기##");
         var userId = $("#userId").val();
         console.log("사용자Id::"+userId);
         var title = $("#title").val();
         console.log("일정제목::"+title);
         var Num = "일정번호";
		 console.log("일정번호::"+Num);
		 
         // 쿠키꺼내기
         var cookieTitleVal = $.cookie(userId+'_'+title);
         console.log("쿠키당::"+cookieTitleVal);
         var cookieNumVal = $.cookie(userId+'_'+Num);
         console.log("쿠키당::"+cookieNumVal);
         
         // 쿠키에서 꺼내 문자열(~|~|~|) 쪼개서 html 만들기
         var htmlCookieList = "";
         var favorTitleList = cookieTitleVal.split("|");
         for(var i=0; i<favorTitleList.length; i++) {
            var favorTitle = favorTitleList[i];
            if(favorTitle != "") {
               console.log("favorTitle["+i+"]:"+favorTitle);
               htmlCookieList += "<div><p>"+favorTitle+"</p></div>";
            }
         }
         
      	// 쿠키에서 꺼내 문자열(~|~|~|) 쪼개서 html 만들기
         var htmlCookieNumList = "";
         var favorNumList = cookieNumVal.split("|");
         for(var i=0; i<favorNumList.length; i++) {
            var favorNum = favorNumList[i];
            if(favorNum != "") {
               console.log("favorNum["+i+"]:"+favorNum);
               htmlCookieNumList += "<div><p>"+favorNum+"</p></div>";
            }
         }
         
         // 여행지 일정에 상세(디테일)에 보여주기
         $("#cookie_list").html(htmlCookieList+","+htmlCookieNumList);
      });
   
   </script>
    -->
   
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
    
	<style>
	   #t {
	      font:normal normal 28px/1.6  "나눔고딕";
	        color: #111111;
	        margin: 5px 0px 3px 0px;
	   }
	</style>
	
	<c:if test="${empty (sessionScope.status)}">
		<script type="text/javascript">
			alert("로그인 후 이용가능합니다.");
			window.location = "/kanbu/login.com";
		</script>
	</c:if>
   
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
                                        <img src="/kanbu/resources/img/kanbulogo.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6">
                                <div class="main-menu  d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a class="active" href="/kanbu/main.com">home</a></li>
                                            <li><a href="/kanbu/mapView.com">일정만들기</a></li>
                                            <li><a href="/kanbu/place.com">여행지정보</a></li>
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
                                              <c:if test="${sessionScope.status == 1}">
                                                 <li><a href="/kanbu/mypage.com"> <i class="fa fa-user"></i> </a></li>
                                              </c:if>
                                              <c:if test="${sessionScope.status == 100}">
                                                 <li><a href="/kanbu/admin.com"> <i class="fa fa-dashboard"></i> </a></li>
                                              </c:if>
                                              <li><a href="/kanbu/logout.com"> <i class="fa fa-unlock"></i> </a></li>
                                           </c:if>
                                           <c:if test="${empty(sessionScope.status)}">
                                              <li><a href="/kanbu/login.com"> <i class="fa fa-lock"></i> </a></li>
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
      <p style="font:normal normal 27px/1.6  "나눔고딕";">${sessionScope.nick}님의 이번 여행일정</p>
      <br>
      <div>
         <input type="hidden" name="title" id="title" value="${plan.title}">
         <input type="hidden" id="userId" value="${sessionScope.id}">
         <p id=t><b>${plan.title}</b></p>
      </div>
      
      <span><b>여행일</b></span>
      <fmt:formatDate value="${plan.reg_date}" pattern="yyyy.MM.dd"/> 
      <span>
         ${plan.startDay}
         ~
         ${plan.arrivalDay}
      </span>
      
      <br><br>
   
      <div>
         <p>❤️<b>이번 여행 찜장소</b></p>
            ${sessionScope.nick}님의 찜장소입니다.
            <br><br>
            <div id="cookie">
               <div id="cookie_list">
               		<c:if test="${scheduleCount > 0}">
               			<c:forEach var="schedule" items="${scheduleList}">
               				<c:if test="${plan.index_num == schedule.list_num}">
               					<p>${schedule.name}</p>
               				</c:if>
               			</c:forEach>
               		</c:if>
               		<c:if test="${scheduleCount == 0 }">
               			등록된 장소가 없습니다.
               		</c:if>
               </div>
            </div>
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