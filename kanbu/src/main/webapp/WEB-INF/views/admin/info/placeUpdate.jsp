<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      

<!doctype html>
<html class="no-js" lang="zxx">

<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <title>여행지정보수정 | ${placeInfo.name}</title>
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
   <link rel="stylesheet" href="/kanbu/resources/css/slicknav.css">
   <link rel="stylesheet" href="/kanbu/resources/css/style.css">
   
   <!-- 사진 슬라이드쇼 css  -->
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   <!-- <link rel="stylesheet" href="css/responsive.css"> -->
   
   <!-- jquery 실행 -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   
   <!-- 관리자 상태 유효성 검사 -->
  	<c:if test="${empty(sessionScope.status)}">
  		<script type="text/javascript">
  			alert("접근 권한이 없는 페이지입니다.");
  			window.location = "/kanbu/main.com";
  		</script>
  	</c:if>
  
  	<c:if test="${!empty(sessionScope.status)}">
  		<script type="text/javascript">
  			var status = ${sessionScope.status};
  	
  			if(status != 100){
  				alert("접근 권한이 없는 페이지입니다.");
  				window.location = "/kanbu/main.com";
  			}
  		</script>
  	</c:if>
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
                                            <li><a href="/kanbu/list.com">일정만들기</a></li>
                                            <li><a class="active" href="/kanbu/place.com">여행지정보</a></li>
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

   <!--================Blog Area =================-->
   <div class="destination_details_info">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-9">
                	<form name="placeInfoUpdate" id="placeInfoUpdate" action="/kanbu/admin/placeInfo/editPro.com" method="post">
	                    <div class="destination_info">
	                        <h1 style="font-weight: bold;" align="center">
	                        	장소명 : <input type="text" name="name" id="name" value="${placeInfo.name}"
	                        				   placeholder="장소를 입력해주세요.."/>
	                        </h1>
	                        <p align="center">
	                        	주소 : <input type="text" name="addr" id="addr" value="${placeInfo.addr}"
	                        			     style="width: 490px;" placeholder="주소를 입력해주세요.."/>
	                        </p>
	   							<ul class="blog-info-link">
	        						<li>
	        							<a class="good">
	        								<i class="fa fa-heart" style="cursor:pointer;" id="good"></i>${placeInfo.good}
	        							</a>		
	        						</li>
	            					<li>
	            						<a class="views">
	            							<i class="fa fa-eye" style="cursor:pointer;" id="views"></i>${placeInfo.views}
	            						</a>
	            					</li>
	            					<li style="cursor:pointer;">
	            						<a class="picture">
	            							<i class="fa fa-camera" id="picture"></i>사진 수정하기
	            						</a>
	            					</li>
	        					</ul>
	   						<hr/>
	   						
	   						<!-- 사진 슬라이드 쇼 -->
	   						<!-- slider_area_start -->
	    					<div class="w3-content w3-display-container">
	    						<c:if test="${!empty(placeInfo.picture1)}">
	    							<img class="mySlides" src="${placeInfo.picture1}" width="100%"/>
	    						</c:if>
	    						<c:if test="${!empty(placeInfo.picture2)}">
	    							<img class="mySlides" src="${placeInfo.picture2}" width="100%"/>
	    						</c:if>
	    						<c:if test="${!empty(placeInfo.picture3)}">
	    							<img class="mySlides" src="${placeInfo.picture3}" width="100%"/>
	    						</c:if>
	    						<c:if test="${!empty(placeInfo.picture4)}">
	    							<img class="mySlides" src="${placeInfo.picture4}" width="100%"/>
								</c:if>
	    						<c:if test="${!empty(placeInfo.picture5)}">
	    							<img class="mySlides" src="${placeInfo.picture5}" width="100%"/>
	    						</c:if>
	    						
	    						<button type="button" class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
	    						<button type="button" class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
	    					</div>
	    					<!-- slider_area_end -->
	    					
	    					<!-- 상세정보 -->
	    					<p>&nbsp</p>
	    					<h4 style="font-weight: bold;">상세정보</h4>
	    					<p>
	    						<textarea name="info" id="info" style="width: 730px;height: 200px;"
	    								  placeholder="상제정보를 입력해주세요..">
	    							${placeInfo.info}
	    						</textarea>
	    					
	    					</p>
	   						
	   						<!-- 지도 -->
	   						<div id="map" style="width:100%;height:350px;"></div>
								
	                		<div class="section-top-border">
	                			<div>
								<p style="font: bold;">
									위도	: <input type="text" name="latitude" id="latitude" value="${placeInfo.latitude}" 
												 placeholder="위도를 입력해주세요.."/>&nbsp&nbsp&nbsp&nbsp&nbsp
									경도	: <input type="text" name="longitude" id="longitude" value="${placeInfo.longitude}" 
												 placeholder="경도를 입력해주세요.."/>
								</p>
								</div>
								<div>
								<p style="font: bold;">
									문의 및 안내	: <input type="text" name="tel" id="tel" value="${placeInfo.tel}" 
													     placeholder="ex) 064-111-1234"/>
								</p>
								</div>
								<div>
								<p style="font: bold;">	
									휴일	: <input type="text" name="holiday" id="holiday" value="${placeInfo.holiday}"
												 placeholder="휴일 날짜를 넣어주세요.." />
								</p>
								</div>
								<div>
								<p style="font: bold;">	
									어른 입장료 : <input type="text" name="fee1" id="fee1" value="${placeInfo.fee1}" 
												       placeholder="어른입장료를 입력해주세요.."/>&nbsp&nbsp&nbsp&nbsp&nbsp
									아이 입장료 : <input type="text" name="fee2" id="fee2" value="${placeInfo.fee2}" 
													   placeholder="아이입장료를 입력해주세요.."/>
								</p>
								</div>
								<div class="default-select" id="default-select">
									주차	: <span style="float: right;width: 90%;">
										  	<select name="parking" id="parking">
												<option value=" 1" <c:if test="${placeInfo.parking eq '1'}">selected</c:if>>가능</option>
												<option value="1" <c:if test="${placeInfo.parking eq '0'}">selected</c:if>>불가능</option>
											</select>
										  </span>			
								</div>
								<div>
								<p style="font: bold;">	
									오픈시간	: <input type="text" name="opening" id="opening" value="${placeInfo.opening}" 
													 placeholder="ex) 9"/>
								</p>
								</div>
								<div>					 
								<p style="font: bold;">	
									마감시간	: <input type="text" name="closing" id="closing" value="${placeInfo.closing}" 
													 placeholder="ex) 22"/>	
								</p>
								</div>
								<input type="hidden" name="placeNum" id="placeNum" value="${placeInfo.index_num}" />
								<p>&nbsp</p>
								
                            	<button class="boxed-btn4" type="button" id="optionModifyBtn" 
                                        onclick="return cencel();" style="float: left;">취소</button>
                                <button class="boxed-btn3" type="submit" id="optionModifyBtn" 
                                        onclick="return placeUpdateChk();" 
                                        style="float: right; width: 110px; height: 50px; padding: 13px 39px;">수정</button> 
							</div>
	                    </div>
                    </form>
            	</div>
            </div>
         </div>
   	</div>

   <!--================ Blog Area end =================-->


    <!-- footer start -->
    <footer class="footer">
      <div class="footer_top">
          <div class="container">
              <div class="row">
                  <div class="col-xl-4 col-md-6 col-lg-4 ">
                      <div class="footer_widget">
                          <div class="footer_logo">
                              <a href="#">
                                  <img src="/kanbu/resources/img/footer_logo.png" alt="">
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
                                      <img src="resources/img/instagram/1.png" alt="">
                                  </a>
                              </div>
                              <div class="single_insta">
                                  <a href="#">
                                      <img src="resources/img/instagram/2.png" alt="">
                                  </a>
                              </div>
                              <div class="single_insta">
                                  <a href="#">
                                      <img src="resources/img/instagram/3.png" alt="">
                                  </a>
                              </div>
                              <div class="single_insta">
                                  <a href="#">
                                      <img src="resources/img/instagram/4.png" alt="">
                                  </a>
                              </div>
                              <div class="single_insta">
                                  <a href="#">
                                      <img src="resources/img/instagram/5.png" alt="">
                                  </a>
                              </div>
                              <div class="single_insta">
                                  <a href="#">
                                      <img src="resources/img/instagram/6.png" alt="">
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
   
   <!-- 사진 슬라이드쇼 script -->
   <script type="text/javascript">
   		var slideIndex = 1;
   		showDivs(slideIndex);

   		function plusDivs(n) {
     		showDivs(slideIndex += n);
   		}

   		function showDivs(n) {
     		var i;
     		var x = document.getElementsByClassName("mySlides");
     		
     		if (n > x.length) {
     			slideIndex = 1
     		}
     		
     		if (n < 1) {
     			slideIndex = x.length
     		}
     		
     		for (i = 0; i < x.length; i++) {
       			x[i].style.display = "none";  
     		}
     		
     		x[slideIndex-1].style.display = "block";  
   		}
   </script>
   
   <!-- 지도 생성 및 장소 마크 -->
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe4da653d661d051c0f1aed85923ec4c"></script>
   <script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    	mapOption = { 
        	center: new kakao.maps.LatLng(${placeInfo.latitude}, ${placeInfo.longitude}), // 지도의 중심좌표(해당 장소 위도, 경도)
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
		}
	</script>
	
	<!-- 여행지 정보 수정 취소 -->
	<script type="text/javascript">
		function cencel(){
			var result = confirm("여행지 정보 수정을 취소하시겠습니까?");
			if(result){
				window.location.href="/kanbu/admin/placeInfo.com";
			}else{
				return false;
			}
		}
	</script>
	
	<!-- 여행지 정보 수정 유효성 검사 -->
	<script type="text/javascript">
		function placeUpdateChk(){
			var name = $('#name').val();
			var addr = $('#addr').val();
			var info = $('#info').val();
			var latitude = $('#latitude').val();
			var longitude = $('#longitude').val();	
			
			if(name == null || name == ""){
				alert("장소를 입력해주세요.");
				return false;
			}
			if(addr == null || addr == ""){
				alert("주소를 입력해주세요.");
				return false;
			}
			if(info == null || info == ""){
				alert("상세정보를 입력해주세요.");
				return false;
			}
			if(latitude == null || latitude == ""){
				alert("위도를 입력해주세요.");
				return false;
			}
			if(longitude == null || longitude == ""){
				alert("경도를 입력해주세요.");
				return false;
			}
			
		}
	</script>
	
	<script type="text/javascript">
		function placeDelete(){
			var result = confirm("여행지를 삭제하시겠습니까?");
	  		
	  		if(result){
	  			location.href="/kanbu/admin/placeInfo/delete.com?placeNum="+$("#placeNum").val();
	  		}else{
	  			return false;
	  		} 	
		}
	</script>



</body>

</html>