<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>        
    
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>QUESTION</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap1.min.css">
    <link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../resources/css/magnific-popup.css">
    <link rel="stylesheet" href="../resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="../resources/css/themify-icons.css">
    <link rel="stylesheet" href="../resources/css/nice-select.css">
    <link rel="stylesheet" href="../resources/css/flaticon.css">
    <link rel="stylesheet" href="../resources/css/gijgo.css">
    <link rel="stylesheet" href="../resources/css/animate.css">
    <link rel="stylesheet" href="../resources/css/slicknav.css">
    <link rel="stylesheet" href="../resources/css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
    
<style>
     /* 푸터 사이즈 조절, 컨텐츠와 간격 조절 */
    .footer .footer_top {
   		margin-top: 110px;
   		padding-top: 50px;
   		padding-bottom: 30px;
	}
	
	h3.md-30 {
	    text-align: center;
	    margin-top: 60px;
	    margin-bottom: 60px;
	    font-size: 60px;
	}

	.progress-table .country {
	    width: 300;
	}
	
	a {
	    color: #007bff;
	    text-decoration: none;
	    background-color: transparent;
	    -webkit-text-decoration-skip: objects;
	    color: inherit;
	}
	
	.blog-pagination{
		margin-top: auto;
	}
	
	.search-form {
		margin-top: 50px;
	}
	
	
	/* 버튼 왼쪽의 여백 */
	.input-group-btn{
		margin-left: 5px;
	}
	
</style>
</head>

<body>
    <header>
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid">
                    <div class="header_bottom_border">
                        <div class="row align-items-center">
                            <div class="col-xl-2 col-lg-2">
                                <div class="logo">
                                    <a href="/kanbu/main.com">
                                        <img src="../resources/img/logo.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6">
                                <div class="main-menu  d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a class="active" href="/kanbu/main.com">home</a></li>
                                            <li><a href="about.html">일정만들기</a></li>
                                            <li><a class="" href="travel_destination.html">여행지정보</a></li>
                                            <li><a href="/kanbu/board/reviewList.com">게시판 <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                        <li><a href="/kanbu/board/reviewList.com">여행공유</a></li>
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
                                    <div class="number">
                                        <p> <i class="fa fa-phone"></i> 10(256)-928 256</p>
                                    </div>
                                    <div class="social_links d-none d-xl-block">
                                        <ul>
                                            <li><a href="#"> <i class="fa fa-instagram"></i> </a></li>
                                            <li><a href="#"> <i class="fa fa-linkedin"></i> </a></li>
                                            <li><a href="#"> <i class="fa fa-facebook"></i> </a></li>
                                            <li><a href="#"> <i class="fa fa-google-plus"></i> </a></li>
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
                        <h3>Any Where, Wherever</h3>
                        <p></p>
                        <p>Wherever You Want To Go, With Kanbu</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

	<!--======== 자주하는 질문 헤더 ========  -->
	<div class="container box_1170">
		<h3 class="md-30">자주하는 질문</h3>
	</div>
	
	<!--======== 자주하는 질문 목록 테이블 ========  -->
	<div class="container box_1170">
		<table class="table table-hover">
			<thead>
				<tr>
					<th width="50">No.</th>
					<th width="650">제목</th>
					<th width="50">작성자</th>
					<th width="50">작성일</th>
					<th width="50">조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr class="table-active">
					<th scope="row">공지</th>
					<td>제 목</td>
					<td>깐부</td>
					<td>2021.11.19</td>
					<td>121</td>
				</tr>
				<tr class="table-active">
					<th scope="row">공지</th>
					<td>제 목</td>
					<td>깐부</td>
					<td>2021.11.19</td>
					<td>59</td>
				</tr>
				<tr class="table-active">
					<th scope="row">공지</th>
					<td>제 목</td>
					<td>깐부</td>
					<td>2021.11.19</td>
					<td>84</td>
				</tr>
				<tr>
					<th scope="row">[4]</th>
					<td>질문 제목4</td>
					<td>홍길동4</td>
					<td>2021.11.14</td>
					<td>4</td>
				</tr>
				<tr>
					<th scope="row">[3]</th>
					<td>질문 제목3</td>
					<td>홍길동3</td>
					<td>2021.11.13</td>
					<td>3</td>
				</tr>
				<tr>
					<th scope="row">[2]</th>
					<td>질문 제목2</td>
					<td>홍길동2</td>
					<td>2021.11.12</td>
					<td>2</td>
				</tr>
				<tr>
					<th scope="row">[1]</th>
					<td>질문 제목1</td>
					<td>홍길동1</td>
					<td>2021.11.11</td>
					<td>1</td>
				</tr>
			</tbody>
		</table>
		
		<!-- ============글 등록 버튼 (( 관리자에게만 보이게 해야함...))============ -->
		<div class="d-flex flex-row-reverse">
			<span class="input-group-btn">
				<a class="btn btn-secondary" href="/kanbu/board/qaWrite.com" role="button">등록</a>
			</span>
		</div>
	
		<!-- ========게시판 페이징 표시======== -->
		<nav class="blog-pagination d-flex justify-content-center">
			<ul class="pagination">
				<li class="page-item"><a href="#" class="page-link"
					aria-label="Previous"> <i class="ti-angle-left"></i>
				</a></li>
				<li class="page-item"><a href="#" class="page-link">1</a></li>
				<li class="page-item active"><a href="#" class="page-link">2</a>
				</li>
				<li class="page-item"><a href="#" class="page-link"
					aria-label="Next"> <i class="ti-angle-right"></i>
				</a></li>
			</ul>
		</nav>
		
		<!-- ========게시판 검색창======== -->
		
		<div class="search-form">
			<div class="d-flex justify-content-center">
				<div class="input-group-prepend">
					<button class="btn btn-outline-secondary dropdown-toggle"
						type="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">제목</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">작성자</a>
					</div>
				</div>
				<input type="text" class="form-control" placeholder="검색어 입력">
				<span class="input-group-btn">
					<button class="btn btn-secondary" type="button">검색</button>
				</span>
			</div>
		</div>
	</div>

	<!-- End Align Area -->


    <!-- footer start -->
    <footer class="footer">
        <div class="footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-xl-4 col-md-6 col-lg-4 ">
                        <div class="footer_widget">
                            <div class="footer_logo">
                                <a href="#">
                                    <img src="../resources/img/footer_logo.png" alt="">
                                </a>
                            </div>
                            <p>5th flora, 700/D kings road, green <br> lane New York-1782 <br>
                                <a href="#">+10 367 826 2567</a> <br>
                                <a href="#">contact@carpenter.com</a>
                            </p>
                            <div class="socail_links">
                                <ul>
                                    <li>
                                        <a href="#">
                                            <i class="ti-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="ti-twitter-alt"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-pinterest"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-youtube-play"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>
                    <div class="col-xl-2 col-md-6 col-lg-2">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Company
                            </h3>
                            <ul class="links">
                                <li><a href="#">Pricing</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="#"> Gallery</a></li>
                                <li><a href="#"> Contact</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-3">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Popular destination
                            </h3>
                            <ul class="links double_links">
                                <li><a href="#">Indonesia</a></li>
                                <li><a href="#">America</a></li>
                                <li><a href="#">India</a></li>
                                <li><a href="#">Switzerland</a></li>
                                <li><a href="#">Italy</a></li>
                                <li><a href="#">Canada</a></li>
                                <li><a href="#">Franch</a></li>
                                <li><a href="#">England</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-3">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Instagram
                            </h3>
                            <div class="instagram_feed">
                                <div class="single_insta">
                                    <a href="#">
                                        <img src="../resources/img/instagram/1.png" alt="">
                                    </a>
                                </div>
                                <div class="single_insta">
                                    <a href="#">
                                        <img src="../resources/img/instagram/2.png" alt="">
                                    </a>
                                </div>
                                <div class="single_insta">
                                    <a href="#">
                                        <img src="../resources/img/instagram/3.png" alt="">
                                    </a>
                                </div>
                                <div class="single_insta">
                                    <a href="#">
                                        <img src="../resources/img/instagram/4.png" alt="">
                                    </a>
                                </div>
                                <div class="single_insta">
                                    <a href="#">
                                        <img src="../resources/img/instagram/5.png" alt="">
                                    </a>
                                </div>
                                <div class="single_insta">
                                    <a href="#">
                                        <img src="../resources/img/instagram/6.png" alt="">
                                    </a>
                                </div>
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
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--/ footer end  -->

  <!-- Modal -->
  <div class="modal fade custom_search_pop" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="serch_form">
            <input type="text" placeholder="Search" >
            <button type="submit">search</button>
        </div>
      </div>
    </div>
  </div>

	<!-- JS here -->
	<script src="../resources/js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="../resources/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="../resources/js/popper.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/owl.carousel.min.js"></script>
	<script src="../resources/js/isotope.pkgd.min.js"></script>
	<script src="../resources/js/ajax-form.js"></script>
	<script src="../resources/js/waypoints.min.js"></script>
	<script src="../resources/js/jquery.counterup.min.js"></script>
	<script src="../resources/js/imagesloaded.pkgd.min.js"></script>
	<script src="../resources/js/scrollIt.js"></script>
	<script src="../resources/js/jquery.scrollUp.min.js"></script>
	<script src="../resources/js/wow.min.js"></script>
	<script src="../resources/js/nice-select.min.js"></script>
	<script src="../resources/js/jquery.slicknav.min.js"></script>
	<script src="../resources/js/jquery.magnific-popup.min.js"></script>
	<script src="../resources/js/plugins.js"></script>
	<script src="../resources/js/gijgo.min.js"></script>

	<!--contact js-->
	<script src="../resources/js/contact.js"></script>
	<script src="../resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="../resources/js/jquery.form.js"></script>
	<script src="../resources/js/jquery.validate.min.js"></script>
	<script src="../resources/js/mail-script.js"></script>

	<script src="../resources/js/main.js"></script>
    <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }
        });
        $('#datepicker2').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }

        });
    </script>
    </body>
    
    </html>