<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>        

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>NOTICE</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="/kanbu/resources/img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="/kanbu/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/kanbu/resources/css/bootstrap1.min.css">
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
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
    
	<style>
		.logo {
			width: 140px;
			height: 56px;
		}

	h3.md-30 {
    text-align: center;
    margin-top: 60px;
    margin-bottom: 60px;
    font-size: 60px;
	}
	
	a {
	    color: #007bff;
	    text-decoration: none;
	    background-color: transparent;
	    -webkit-text-decoration-skip: objects;
	    color: inherit;
	}
	
	.search-form {
		margin-top: 40px;
	}
	
	/* 버튼 왼쪽의 여백 */
	.input-group-btn{
		margin-left: 5px;
	}
	
	.blog-pagination{
		margin-top: auto;
	}
	
	.submenu > li > a:hover{
	  background-color: #D3D3D3;
	}
	
	/* 푸터 사이즈 조절, 컨텐츠와 간격 조절 */
    .footer .footer_top {
   		margin-top: 110px;
   		padding-top: 50px;
   		padding-bottom: 30px;
	}
	
</style>

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
                        <h3>Any Where, Wherever</h3>
                        <p></p>
                        <p>Wherever You Want To Go, With Kanbu</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!--======== 공지사항 헤더 ========  -->
	<div class="container box_1170">
		<h3 class="md-30">공지사항</h3>
	</div>

	<!--======== 공지사항 목록 테이블 ========  -->
	<div class="container box_1170">
		<c:if test="${noticeCount == 0}">
			등록된 공지가 없습니다.
		</c:if>
		<c:if test="${noticeCount > 0}">
			<table class="table table-hover">
				<thead>
					<tr>
						<th width="30">No.</th>
						<th width="620">제목</th>
						<th width="60">작성자</th>
						<th width="80">작성일</th>
						<th width="50">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="count" value="${noticeCount}" />
					<c:forEach var="notice" items="${noticeList}">
						<tr class="table-active">
							<th scope="row">${count}</th>
							<td><a href="/kanbu/board/noticeDetail.com?noticeNum=${notice.index_num}">${notice.title}</a></td>
							<td>${notice.nick}</td>
							<td><fmt:formatDate value="${notice.reg_date}" type="date"/> </td>
							<td>${notice.views}</td>
						</tr>
						<c:set var="count" value="${count-1}" />
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	
		<!-- ============글 등록 버튼 (( 관리자에게만 보이게 해야함...))============ -->
		<c:if test="${sessionScope.status == 100}">
			<div class="d-flex flex-row-reverse">
				<span class="input-group-btn">
					<a class="btn btn-secondary" href="/kanbu/board/noticeWrite.com" role="button">등록</a>
				</span>
			</div>
		</c:if>
		
		<!-- 페이지 번호 나타내기 -->
		<c:if test="${noticeCount > 0}">
			<fmt:parseNumber var="pageCount" 
							 value="${noticeCount / pageSize + (noticeCount %  pageSize == 0 ? 0 : 1)}"
							 integerOnly="true" />
			<c:set var="pageBlock" value="${5}" />
			<fmt:parseNumber var="result" value="${currentPage/5}" integerOnly="true"/>
			<c:set var="startPage" value="${result*5+1}" />
			<c:set var="endPage" value="${startPage + pageBlock - 1}" />
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}" />
			</c:if>			 
		
			<!-- ========게시판 페이징 표시======== -->
			<nav class="blog-pagination d-flex justify-content-center">
				<ul class="pagination">
					<c:if test="${startPage > 5}">
	                	<li class="page-item">
	                		<c:if test="${searchCount != 1}">
	                    		<a href="/kanbu/board/noticeList.com?pageNum=${startPage-5}" 
	                    	   	   class="page-link" aria-label="Previous">
	                        		<i class="ti-angle-left"></i>
	                        	</a>
	                        </c:if>
	                        <c:if test="${searchCount == 1}">
	                        	<a href="/kanbu/board/noticeSearch.com?thema=${thema}&keyword=${keyword}&pageNum=${startPage-5}" 
	                    	   	   class="page-link" aria-label="Previous">
	                        		<i class="ti-angle-left"></i>
	                        	</a>
	                        </c:if>	
	                    </li>
	                </c:if>
	                               	
	                <c:forEach var="i" begin="${startPage}" end="${endPage}">
	                	<li class="page-item">
	                		<c:if test="${searchCount != 1}">
	                    		<a href="/kanbu/board/noticeList.com?pageNum=${i}" class="page-link">${i}</a>
	                    	</c:if>
	                    	<c:if test="${searchCount == 1}">
	                    		<a href="/kanbu/board/noticeSearch.com?thema=${thema}&keyword=${keyword}&pageNum=${i}" 
	                    		   class="page-link">${i}</a>
	                    	</c:if>
	                    </li>
	                </c:forEach>
	                             	
	                <c:if test="${endPage < pageCount}">
	                    <li class="page-item">
	                    	<c:if test="${searchCount != 1}">
	                        	<a href="/kanbu/board/noticeList.com?pageNum=${startPage+5}" 
	                           	   class="page-link" aria-label="Next">
	                        		<i class="ti-angle-right"></i>
	                       	 	</a>
	                       	</c:if>
	                       	<c:if test="${searchCount == 1}">
	                       		<a href="/kanbu/board/noticeSearch.com?thema=${thema}&keyword=${keyword}&pageNum=${startPage+5}" 
	                           	   class="page-link" aria-label="Next">
	                        		<i class="ti-angle-right"></i>
	                       	 	</a>
	                       	 </c:if>
	                    </li>
	                </c:if>
				</ul>
			</nav>
		</c:if>
		
		<!-- ========게시판 검색창======== -->
		<div class="search-form">
				<div class="d-flex justify-content-center">
                    	<select name="thema" id="thema" class="form-control">
							<!-- <option value="select" selected>선택</option> -->
                  	   		<option value="n.title">제목</option>
                  	   		<option value="rm.nick">작성자</option>
                  	   	</select>
				
				<input type="text" class="form-control" name="keyword" id="keyword" placeholder="검색어 입력">
				<span class="input-group-btn">
					<button class="btn btn-secondary" type="button" id="noticeSearch" onclick="searchNotice();">검색</button>
				</span>
			</div>
		</div>
	</div>
	<!-- End Align Area -->


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
            <button type="submit" onclick="return search();">search</button>
        </div>
      </div>
    </div>
  </div>

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
        $('#datepicker2').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }

        });
    </script>
    
    <!-- 공지 검색 유효성 검사 -->
    <script type="text/javascript">
    	function searchNotice(){
    		var target = document.getElementById("thema");
  			var thema = target.options[target.selectedIndex].value;
  			var keyword = document.getElementById('keyword').value
  			
  			if(thema != null && thema != "" && thema !="select"){
  				if(keyword != null && keyword != ""){
  					window.location = '/kanbu/board/noticeSearch.com?thema='+thema+'&keyword='+keyword;
  				}else{
  					alert("검색어를 입력해주세요.");
  					return false;
  				}
  			}else{
  				alert("검색 테마를 선택해주세요.");
  				return false;
  			}			
    	}
    </script>
    
    
    </body>

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
    
    <!-- 엔터로 검색 -->
    <script>
    $('#keyword').keypress(function(event){
        if ( event.which == 13 ) {
            $('#noticeSearch').click();
            return false;
        }
   });
    </script>
    
</body>
    
</html>