<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   


<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>여행지검색</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
                        <h3>Search Place</h3>
                        <p>${keyword} ( 검색결과 : ${searchCount}개 )</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->


    <!--================Blog Area =================-->
    <section class="blog_area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">	
                    <div class="blog_left_sidebar">
                        <c:if test="${searchCount == 0}">
                        	<div class="blog_details">
                                <a class="d-inline-block" href="single-blog.html">
                                    <h2>해당 검색결과가 존재하지 않습니다.</h2>
                                </a>
                            </div>
                        </c:if>
                        
                        <c:if test="${searchCount > 0}">
                        	<c:forEach var="place" items="${searchList}">
                        		<article class="blog_item" style="cursor:pointer;" 
                        			     onclick="location.href='/kanbu/info.com?placeNum=${place.index_num}'">
                            		<div class="blog_item_img">
                                		<img class="card-img rounded-0" 
                                			 width="750px" height="375px"
                                			 src="${uploadPath+=place.picture1}" 
                                			 alt="해당 사진이 존재하지 않습니다.">
                            		</div>

                            		<div class="blog_details">
                                		<a class="d-inline-block" href="/kanbu/info.com?placeNum=${place.index_num}">
                                    		<h2>${place.name}</h2>
                                		</a>
                                		<p>${place.info}</p>
                                		<ul class="blog-info-link">
                                    		<li><i class="fa fa-heart"></i>${place.good}</li>
                                    		<li><i class="fa fa-eye"></i>${place.views}</li>
                                		</ul>
                            		</div>
                        		</article>
                        	</c:forEach>
                        </c:if>
                        
						<!-- 페이지 번호 나타내기 -->
						<c:if test="${searchCount > 0}">
							<fmt:parseNumber var="pageCount" 
											 value="${searchCount / pageSize + (searchCount %  pageSize == 0 ? 0 : 1)}"
											 integerOnly="true" />
							<c:set var="pageBlock" value="${5}" />
							<fmt:parseNumber var="result" value="${currentPage/5}" integerOnly="true"/>
							<c:set var="startPage" value="${result*5+1}" />
							<c:set var="endPage" value="${startPage + pageBlock - 1}" />
							<c:if test="${endPage > pageCount}">
								<c:set var="endPage" value="${pageCount}" />
							</c:if>			 
						</c:if>
						
                        <nav class="blog-pagination justify-content-center d-flex">
                        	<ul class="pagination">
                        		<c:if test="${startPage > 5}">
                               		<li class="page-item">
                               			<a href="/kanbu/search.com?keyword=${keyword}&pageNum=${startPage-5}" class="page-link" aria-label="Previous">
                                       		<i class="ti-angle-left"></i>
                                   		</a>	
                               		</li>
                               	</c:if>
                               	
                               	<c:forEach var="i" begin="${startPage}" end="${endPage}">
                               		<li class="page-item">
                               			<a href="/kanbu/search.com?keyword=${keyword}&pageNum=${i}" class="page-link">${i}</a>
                               		</li>
                             	</c:forEach>
                             	
                             	<c:if test="${endPage < pageCount}">
                               		<li class="page-item">
                               			<a href="/kanbu/search.com?keyword=${keyword}&pageNum=${startPage+5}" class="page-link" aria-label="Next">
                                       		<i class="ti-angle-right"></i>
                                   		</a>
                               		</li>
                               	</c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <!-- 검색 영역 -->
                        <aside class="single_sidebar_widget search_widget">
                            <form action="/kanbu/search.com" name="searchPlace" id="searchPlace" method="post">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" name="keyword" id="keyword"
                                        	   placeholder='검색할 장소를 입력해주세요..'
                                               onfocus="this.placeholder = ''"
                                               onblur="this.placeholder = '검색할 장소를 입력해주세요..'">
                                        <div class="input-group-append">
                                            <button class="btn" type="button"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                    	type="submit" onclick="return keywordValueChk();">Search</button>
                            </form>
                        </aside>

						<!-- 최근 등록된 장소 영역 -->
                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">Recent Place</h3>
                            <c:if test='${recentPlaceCount == 0}'>
                            	<div class="media post_item">
                                	<div class="media-body">
                                    	<h3>최신 등록된 장소가 없습니다.</h3>
                                	</div>
                            	</div>
                            </c:if>
                            <c:if test='${recentPlaceCount > 0}'>
                            	<c:forEach var="place" items="${recentPlaceList}" end="5">
                            		<div class="media post_item">
                                		<img width="80px" height="80px" src="${uploadPath+=place.picture1}" alt="place">
                                		<div class="media-body">
                                    		<a href="/kanbu/info.com?placeNum=${place.index_num}">
                                        		<h3>${place.name}</h3>
                                    		</a>
                                    		<p>${place.addr}</p>
                                		</div>
                            		</div>
                            	</c:forEach>
                            </c:if>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->

    <!-- footer start -->
    <footer class="footer" style="height: 391px;">
        <div class="footer_top">
            <div class="container" align="center">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer_widget">
                            <div class="footer_logo">
								<img src="resources/img/footer_logo.png" alt="" style="float: left;">
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
    <!--/ footer end  -->


  <!-- 검색창 -->
  <!-- Modal -->
  <div class="modal fade custom_search_pop" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="serch_form">
            <input type="text" name="keyword" id="searchKeyword" placeholder="검색할 장소를 입력해주세요..." >
            <button type="submit" onclick="return search();">search</button>
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
    <script src="/kanbu/resources/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="/kanbu/resources/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="/kanbu/resources/js/popper.min.js"></script>
    <script src="/kanbu/resources/js/bootstrap.min.js"></script>
    <script src="/kanbu/resources/js/owl.carousel.min.js"></script>
    <script src="/kanbu/resources/js/isotope.pkgd.min.js"></script>
    <script src="/kanbu/resources/js/ajax-form.js"></script>
    <script src="/kanbu/resources/js/waypoints.min.js"></script>
    <script src="/kanbu/resources/js/jquery.counterup.min.js"></script>
    <script src="/kanbu/resources/js/imagesloaded.pkgd.min.js"></script>
    <script src="/kanbu/resources/js/scrollIt.js"></script>
    <script src="/kanbu/resources/js/jquery.scrollUp.min.js"></script>
    <script src="/kanbu/resources/js/wow.min.js"></script>
    <script src="/kanbu/resources/js/nice-select.min.js"></script>
    <script src="/kanbu/resources/js/jquery.slicknav.min.js"></script>
    <script src="/kanbu/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="/kanbu/resources/js/plugins.js"></script>
    <script src="/kanbu/resources/js/gijgo.min.js"></script>
    <script src="/kanbu/resources/js/slick.min.js"></script>
     
    <!--contact js-->
    <script src="/kanbu/resources/js/contact.js"></script>
    <script src="/kanbu/resources/js/jquery.ajaxchimp.min.js"></script>
    <script src="/kanbu/resources/js/jquery.form.js"></script>
    <script src="/kanbu/resources/js/jquery.validate.min.js"></script>
    <script src="/kanbu/resources/js/mail-script.js"></script>

    <script src="/kanbu/resources/js/main.js"></script>
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
    		var place = document.getElementById('searchKeyword').value
    		
    		if(place == null || place == ""){
    			alert("검색할 장소를 입력해주세요.");
    			return false;
    		}else{
    			window.location = '/kanbu/search.com?keyword='+place;
    		}
    	}
    </script>
    
    <!-- 검색 유효성 검사 -->
    <script type="text/javascript">
    	function keywordValueChk(){
			var place = document.searchPlace.keyword.value;
			console.log(place);
    		
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