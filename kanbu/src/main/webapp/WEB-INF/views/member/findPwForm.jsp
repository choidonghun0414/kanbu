<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
    
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Find Pw</title>
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
    <link rel="stylesheet" href="/kanbu/resources/css/joinpw.css">
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
    
    <div class="destination_banner_wrap overlay">
        <div class="destination_text text-center">
            <h3>Find PW</h3>
        </div>
    </div>

    <div class="destination_details_info">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-9">
                    <div class="contact_join">
                        <form name="loginform" method="post" action="/kanbu/updatePwPro.com" id="loginform">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <div class="single_input">
                                       <h5>id(아이디)</h5>
                                        <input type="text" name="id" placeholder="아이디를 입력해주세요" id="id" maxlength="13"/>
                                    </div>
                                </div>								
                                <div class="col-lg-6 col-md-6">
                                    <div class="single_input">
                                       <h5>연락처</h5>
                                        <input type="text" name="phone" placeholder="연락처를 입력해주세요" id="phoneNum" maxlength="13"/>
                                    </div>
                                </div>

                                <div class="col-lg-6 col-md-6">
                                    <div class="single_input">
                                       <h5>이메일</h5>
                                        <input type="text" name="mail" id="mail" placeholder="이메일을 입력해주세요">
                                    </div>
                                </div>

                                <div class="col-lg-6 col-md-6">
                                    <div class="single_input">
                                    <h5>&nbsp</h5>
                                    <div style=" float: left;">
                              <p style="font-size: 16px;">@</p>
                                    </div>
                                    <div style="width: 88%; float: right;">   
                                       <select name="domain" id="domain">
                                          <option value="1">naver.com</option>
                                          <option value="2">google.com</option>
                                          <option value="3">daum.net</option>
                                       </select>
                                    </div>   
                                    </div>
                                </div>
                                
                                <div class="col-lg-12">
                                 <h5>&nbsp</h5>
                                    <div class="submit_btn">
                                        <button class="boxed-btn4" type="submit" id="optionModifyBtn">확인</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>            
                    <div class="bordered_1px"></div>
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
    		var place = document.getElementById('keyword').value
    		
    		if(place == null || place == ""){
    			alert("검색할 장소를 입력해주세요.");
    			return false;
    		}else{
    			window.location = '/kanbu/search.com?keyword='+place;
    		}
    	}
    </script>
    
    <script> 
	    //전화번호 스크립트
	    var autoHypenPhone = function(str){
	        str = str.replace(/[^0-9]/g, '');
	        var tmp = '';
	        if( str.length < 4){
	            return str;
	        }else if(str.length < 7){
	            tmp += str.substr(0, 3);
	            tmp += '-';
	            tmp += str.substr(3);
	            return tmp;
	        }else if(str.length < 11){
	            tmp += str.substr(0, 3);
	            tmp += '-';
	            tmp += str.substr(3, 3);
	            tmp += '-';
	            tmp += str.substr(6);
	            return tmp;
	        }else{              
	            tmp += str.substr(0, 3);
	            tmp += '-';
	            tmp += str.substr(3, 4);
	            tmp += '-';
	            tmp += str.substr(7);
	            return tmp;
	        }
	    
	        return str;
	  	}
	
	  	var phoneNum = document.getElementById('phoneNum');
	
	  	phoneNum.onkeyup = function(){
	    this.value = autoHypenPhone( this.value );  
	  	}
	</script>
	
	<script>
		$(document).ready(function(){
			$("#optionModifyBtn").on("click", function(){
				if($("#id").val() == "" || $('#id').val() == null){
					alert("아이디를 입력해주세요.");
					$("#id").focus();
					return false;
				}
				if($("#phoneNum").val() == "" || $('#phoneNum').val() == null){
					alert("연락처를 입력해주세요.");
					$("#phone").focus();
					return false;
				}
				if($("#mail").val() == "" || $('#mail').val() == null){
					alert("메일을 입력해주세요.");
					$("#mail").focus();
					return false;
				}
				var target = document.getElementById("domain");
	  			var domain = target.options[target.selectedIndex].value;
	  			if(domain == "" || domain == null){
	  				alert("도메인을 선택해주세요.");
	  				return false;
	  			}
		
			});
		})
	</script>

</body>
</html>