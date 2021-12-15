<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>kanbu</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
    
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<style>
	p {
		font-family: 'Noto Sans KR', sans-serif;
	}
	
    .submenu > li > a:hover{
	  background-color: #D3D3D3;
	}
	
	
	</style>
	
</head>

<body>


    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

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
                                        <img src="resources/img/kanbulogo.png" alt="">
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

    <!-- slider_area_start -->
    <div class="slider_area">
        <div class="slider_active owl-carousel">
            <div class="single_slider  d-flex align-items-center slider_bg_1 overlay">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                                <h3>Jeju Island</h3>
                                <p></p>
                                <p class="regular">아름다운 제주도에서 추억을 만들어보세요</p>
                                 <a href="/kanbu/mapView.com" class="boxed-btn3">여행가기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider  d-flex align-items-center slider_bg_2 overlay">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                                <h3>Jeju Island</h3>
                                <p></p>
                                <p>은은한 저녁노을을 볼 수 있는 기회</p>
                                <a href="/kanbu/mapView.com" class="boxed-btn3">여행가기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider  d-flex align-items-center slider_bg_3 overlay">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                                <h3>Jeju Island</h3>
                                <p></p>
                                <p>푸른초원 위에서 힐링</p>
                                <a href="/kanbu/mapView.com" class="boxed-btn3">여행가기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider_area_end -->
 
    <!-- popular_destination_area_start  -->
    <div class="popular_destination_area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="section_title text-center mb_70">
                        <p style="font-weight: 800; font-size: xx-large; color: black;">여행지 정보</p>
                        <br>
                        <p>요즘 뜨는 여행지의 정보를 주기적으로 업데이트를 하여 
                        <br>
                        깐부트레블 이용자들에게 꿀팁을 알려드립니다</p>
                    </div>
                </div>
            </div>
            <div class="row">
            	<c:if test="${placeCount == 0}">
            		<p align="center">인기 여행지가 없습니다.</p>
            	</c:if>
            	<c:if test="${placeCount > 0}">
            		<c:forEach var="popularPlace" items="${popularPlaceList}">
		                <div class="col-lg-4 col-md-6">
		                    <div class="single_destination">
		                        <div class="thumb">
		                            <img src="${uploadPath+=popularPlace.picture1}" alt="" style="width: 350px; height: 265px;">
		                        </div>
		                        <div class="content">
		                            <p class="d-flex align-items-center" style="font-weight: 800; font-size: large;">
		                            	${popularPlace.name}
		                            	<a href="/kanbu/info.com?placeNum=${popularPlace.index_num}">보러가기</a>
		                            </p>
		                        </div>
		                    </div>
	                	</div>
                	</c:forEach>
                </c:if>
            </div>
            
            <br>
            
            <div style="float: right; width: 56%;">
            	<a class="boxed-btn4" href="/kanbu/place.com">더보기</a>
            </div>
        </div>
    </div>
    
    <!-- popular_destination_area_end  -->
    <div class="popular_places_area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="section_title text-center mb_70">
                        <p style="font-weight: 800; font-size: xx-large; color: black;">여행후기</p>
                        <br>
                        <p>여행지의 생생한 후기를 볼수있는
                        <br>
                        깐부트레블 커뮤니티 게시판입니다</p>
                    </div>
                </div>
            </div>
            <div class="row">
            	<c:if test="${reviewCount == 0}">
            		<p align="center">인기 리뷰가 없습니다.</p>
            	</c:if>
            	<c:if test="${reviewCount > 0}">
            		<c:forEach var="popularReview" items="${popularReviewList}">
		                <div class="col-lg-4 col-md-6">
		                    <div class="single_place">
		                        <div class="thumb">
		                            <img src="resources/img/place/1.png" alt="">
		                            <a class="prise"><i class="fa fa-eye">&nbsp;${popularReview.views}</i></a>
		                        </div>
		                        <div class="place_info">
		                            <a href="/kanbu/board/reviewDetail.com?reviewNum=${popularReview.index_num}">
		                            	<h3>${popularReview.title}</h3>
		                            </a>
		                            <p>${popularReview.nick}</p>
		                            <div class="rating_days d-flex justify-content-between">
		                                <span class="d-flex justify-content-center align-items-center">
		                                	<a>     
		                                    	<c:if test="${reviewTagCount > 0}">
	                            					<c:forEach var="popularReviewTag" items="${popularReviewTagList}">
	                            						<c:if test="${popularReview.index_num == popularReviewTag.index_num}">
	                            							#${popularReviewTag.name}&nbsp
	                            						</c:if>
	                            					</c:forEach>
	                            			 	</c:if>
		                                    </a>
		                                </span>
		                                <div class="days">
		                                    <i class="fa fa-clock-o"></i>
		                                    <a><fmt:formatDate value="${popularReview.reg_date}" type="date"/></a>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		        	</c:forEach>
                </c:if>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="more_place_btn text-center">
                        <a class="boxed-btn4" href="/kanbu/board/reviewList.com">더보기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="travel_variation_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="single_travel text-center">
                        <div class="icon">
                            <img src="resources/img/svg_icon/map.png" alt="">
                        </div>
                         <h3 style="font-weight: 600; font-size:large; color: black;">편리한 일정</h3>
                        <p>원하는 여행일정을 쉽고 간편하게 <br>기록할 수 있습니다.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_travel text-center">
                        <div class="icon">
                            <img src="resources/img/svg_icon/community1.png" alt="">
                        </div>
                        <h3 style="font-weight: 600; font-size:large; color: black;">여행후기 커뮤니티</h3>
                        <p>여행후기 게시판을 통해 이용자들간에 <br>정보 공유 커뮤니티가 형성되어 있습니다.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_travel text-center">
                        <div class="icon">
                            <img src="resources/img/svg_icon/1.svg" alt="">
                        </div>
                        <h3 style="font-weight: 600; font-size:large; color: black;">성공적인 여행</h3>
                        <p>탄탄한 계획과 정보로 <br>성공적인 여행이 가능합니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>  

    <footer class="footer" style="height: 391px;">
        <div class="footer_top">
            <div class="container" align="center">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer_widget">
                            <div class="footer_logo">
								<img src="/kanbu/resources/img/footer_logo.png" alt="" style="float: left;">
								<p>
										it컴퓨터 학원 5층 FDX 자바 교육반 &nbsp;&nbsp;|&nbsp;&nbsp; 양재역 10분도보 
                                		&nbsp;&nbsp;|&nbsp;&nbsp; +10 367 826 2567
                                		&nbsp;&nbsp;|&nbsp;&nbsp; contact@kanbu.com
                            	</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copy-right_text">
            <div class="container">
                <div class="footer_border"></div>
                <div class="row">
                    <div class="col-xl-12">
                        <p class="copy_right text-center">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Kanbu Travel <i class="fa fa-heart-o" aria-hidden="true"></i> <a href="https://colorlib.com" target="_blank"></a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>

  <!-- 검색창 -->
  <!-- Modal -->
  <div class="modal fade custom_search_pop" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="serch_form">
            <input type="text" name="keyword" id="keyword" placeholder="검색할 장소를 입력해주세요..." >
            <button type="submit" onclick="search();">search</button>
        </div>
      </div>
    </div>
  </div>
    <!-- link that opens popup -->
<!--     
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>

    <script src=" https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"> </script> -->
    <!-- JS here -->
    <script src="resources/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="resources/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="resources/js/popper.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/isotope.pkgd.min.js"></script>
    <script src="resources/js/ajax-form.js"></script>
    <script src="resources/js/waypoints.min.js"></script>
    <script src="resources/js/jquery.counterup.min.js"></script>
    <script src="resources/js/imagesloaded.pkgd.min.js"></script>
    <script src="resources/js/scrollIt.js"></script>
    <script src="resources/js/jquery.scrollUp.min.js"></script>
    <script src="resources/js/wow.min.js"></script>
    <script src="resources/js/nice-select.min.js"></script>
    <script src="resources/js/jquery.slicknav.min.js"></script>
    <script src="resources/js/jquery.magnific-popup.min.js"></script>
    <script src="resources/js/plugins.js"></script>
    <script src="resources/js/gijgo.min.js"></script>
    <script src="resources/js/slick.min.js"></script>
   

    
    <!--contact js-->
    <script src="resources/js/contact.js"></script>
    <script src="resources/js/jquery.ajaxchimp.min.js"></script>
    <script src="resources/js/jquery.form.js"></script>
    <script src="resources/js/jquery.validate.min.js"></script>
    <script src="resources/js/mail-script.js"></script>


    <script src="resources/js/main.js"></script>
    <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }
        });
    </script>
    
    <script type="text/javascript">
    	function logOut(){
    		alert("로그아웃 되었습니다.");
    	}
    </script>
    
    <script type="text/javascript">
    	function search(){
    		var place = document.getElementById('keyword').value
    		
    		if(place == null || place == ""){
    			alert("검색할 장소를 입력해주세요.");
    			return false;
    		}else{
    			window.location = '/kanbu/search.com?keyword='+place;
    		}
    	}
    </script>
    
</body>

</html>