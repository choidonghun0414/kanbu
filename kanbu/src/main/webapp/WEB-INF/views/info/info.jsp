<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <title>여행지정보 | ${placeInfo.name}</title>
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


   <!--================Blog Area =================-->
   <div class="destination_details_info">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-9">
                    <div class="destination_info">
                        <h1 style="font-weight: bold;" align="center">${placeInfo.name}</h1>
                        <p align="center">${placeInfo.addr}</p>
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
    						
    						<button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
    						<button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
    					</div>
    					<!-- slider_area_end -->
    					
    					<!-- 상세정보 -->
    					<p>&nbsp</p>
    					<h4 style="font-weight: bold;">상세정보</h4>
    					<p>${placeInfo.info}</p>
   						
   						<!-- 지도 -->
   						<div id="map" style="width:100%;height:350px;"></div>
							
                		<div class="section-top-border">
							<ul class="unordered-list">
								<li>문의 및 안내	:	${placeInfo.tel}</li>
								<li>휴일			:	
									<c:if test="${!empty(placeInfo.holiday)}">
										${placeInfo.holiday}
									</c:if>
								</li>
								<li>입장료
									<ul>
										<li>어른 요금	:	
											<c:if test="${placeInfo.fee1 > 0}">
												<fmt:formatNumber value="${placeInfo.fee1}" type="currency"/>
											</c:if>
										</li>
										<li>아이 요금	:
											<c:if test="${placeInfo.fee2 > 0}">
												<fmt:formatNumber value="${placeInfo.fee2}" type="currency"/>
											</c:if>
										</li>
									</ul>
								</li>
								<li>주소	:	
									<c:if test="${!empty(placeInfo.addr)}">
										${placeInfo.addr}
									</c:if>
								</li>
								<li>주차	:		
									<c:if test="${placeInfo.parking == 1}">
										주차가능
									</c:if>
									<c:if test="${placeInfo.parking == 0}">
										주차불가능
									</c:if>
								</li>
								<li>오픈시간	:
									<c:if test="${placeInfo.opening > 0 && placeInfo.opening < 10}">
										0${placeInfo.opening}:00
									</c:if>
									<c:if test="${placeInfo.opening > 10}">
										${placeInfo.opening}:00
									</c:if>
								</li>
								<li>마감시간	:	
									<c:if test="${placeInfo.closing > 0 && placeInfo.closing < 10}">
										0${placeInfo.closing}:00
									</c:if>
									<c:if test="${placeInfo.closing > 10}">
										${placeInfo.closing}:00
									</c:if>
								</li>
							</ul>
						</div>
                    </div>
                    
                    <!-- 댓글 조회 영역 -->
               		<div class="comments-area">
                  		<h4>여행톡 ${reply_count}</h4>
                  		<c:if test="${reply_count == 0}">
                  			<div class="comment-list">
                     			<div class="single-comment justify-content-between d-flex">
                     				<div class="user justify-content-between d-flex">
                        				<div class="desc">
                              				<p class="comment" style="font-weight: bolder;">
                                 				작성된 후기가 존재하지 않습니다.
                              				</p>
                           				</div>
                           			</div>
                           		</div>
                           	</div>
                       	</c:if>
                        		
                        <c:if test="${reply_count > 0}">
                        	<c:forEach var="place_reply" items="${place_replyList}">
                        		<div class="comment-list">
                     				<div class="single-comment justify-content-between d-flex">
                        				<div class="user justify-content-between d-flex">
                           					<div class="thumb">
                              					<img src="resources/img/comment/profile.png" alt="">
                           					</div>
                           					<div class="desc">
                              					<p class="comment" style="font-weight: bolder;">
                                 					${place_reply.content}
                              					</p>
                            					<div class="d-flex justify-content-between">
                                					<div class="d-flex align-items-center">
                                       					<p>${place_reply.nick}	|	
                                       						<fmt:formatDate value="${place_reply.reg_date}" pattern="yyyy-MM-dd"/> 
                                       					</p>
                                 					</div>
                                 					<c:if test="${sessionScope.nick eq place_reply.nick || sessionScope.status == 100}">
                                 						<div class="reply-btn" align="right">
                                    						<a href="/kanbu/info/replyDelete.com?placeNum=${place_reply.place}&replyNum=${place_reply.index_num}" 
                                    					   	   class="btn-reply" style="font-weight: bold;"
                                    					   	   onclick="return replyDelete();">
                                    					   	   <i class="ti-trash"></i>
                                    					   	</a>
                                 						</div>
                                 					</c:if>
                              					</div>
                           					</div>
                        				</div>
                        			</div>	
                        		</div>
                        	</c:forEach>
                        </c:if>
                        
                        <!-- 페이지 번호 나타내기 -->
						<c:if test="${reply_count > 0}">
							<fmt:parseNumber var="pageCount" 
											 value="${reply_count / pageSize + (reply_count %  pageSize == 0 ? 0 : 1)}"
											 integerOnly="true" />
							<c:set var="pageBlock" value="${5}" />
							<fmt:parseNumber var="result" value="${currentPage/5}" integerOnly="true"/>
							<c:set var="startPage" value="${result*5+1}" />
							<c:set var="endPage" value="${startPage + pageBlock - 1}" />
							<c:if test="${endPage > pageCount}">
								<c:set var="endPage" value="${pageCount}" />
							</c:if>			 
						
	                        <nav class="blog-pagination justify-content-center d-flex">
	                        	<ul class="pagination">
	                        		<c:if test="${startPage > 5}">
	                               		<li class="page-item">
	                               			<a href="/kanbu/info.com?placeNum=${placeInfo.index_num}&pageNum=${startPage-5}" class="page-link" aria-label="Previous">
	                                       		<i class="ti-angle-left"></i>
	                                   		</a>	
	                               		</li>
	                               	</c:if>
	                               	
	                               	<c:forEach var="i" begin="${startPage}" end="${endPage}">
	                               		<li class="page-item">
	                               			<a href="/kanbu/info.com?placeNum=${placeInfo.index_num}&pageNum=${i}" class="page-link">${i}</a>
	                               		</li>
	                             	</c:forEach>
	                             	
	                             	<c:if test="${endPage < pageCount}">
	                               		<li class="page-item">
	                               			<a href="/kanbu/info.com?placeNum=${placeInfo.index_num}&pageNum=${startPage+5}" class="page-link" aria-label="Next">
	                                       		<i class="ti-angle-right"></i>
	                                   		</a>
	                               		</li>
	                               	</c:if>
	                            </ul>
	                        </nav>
                        </c:if>
                    </div>
                  	
                  	<!-- 댓글 작성 영역 -->
                  	<c:if test="${sessionScope.status == 1 || sessionScope.status == 100}">
               			<div class="comment-form">
                  			<h4>후기 남기기</h4>
                  			<form name="reply" method="post" action="/kanbu/info/reply.com">
                     			<div class="row">
                        			<div class="col-12">
                           				<div class="form-group">
                           					<input type="hidden" name="placeNum" value="${placeInfo.index_num}" />
                           					<input type="hidden" name="writer" id="writer" value="${sessionScope.index_num}" />
                              				<textarea class="form-control w-100" name="content" id="content" cols="30" rows="9"
                                 				  	  placeholder="후기를 남겨주세요..."></textarea>
                           				</div>
                        			</div>
                     			</div>
                     			<div class="form-group" align="right">
                        			<button type="submit" class="genric-btn success" onclick="return replyCheck();">등록</button>
                     			</div>
                  			</form>
               			</div> 
               		</c:if>
               		<c:if test="${empty (sessionScope.status)}">
               			<div class="comment-form">
                  			<h4>후기 남기기</h4>
                  			<form name="reply" method="post" action="/kanbu/login.com">
                     			<div class="row">
                        			<div class="col-12">
                           				<div class="form-group">
                           					<input type="hidden" name="placeNum" value="${placeInfo.index_num}" />
                           					<input type="hidden" name="writer" id="writer" value="${sessionScope.index_num}" />
                              				<textarea class="form-control w-100" name="content" id="content" cols="30" rows="9"
                                 				  	  placeholder="후기를 남겨주세요..."></textarea>
                           				</div>
                        			</div>
                     			</div>
                     			<div class="form-group" align="right">
                        			<button type="submit" class="genric-btn success" onclick="return replyLogin();">등록</button>
                     			</div>
                  			</form>
               			</div> 
               		</c:if>         		
            	</div>
         	</div>
   		</div>
   </div>

   <!--================ Blog Area end =================-->


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
   
   <!-- 댓글 등록 유효성 검사(회원) -->
   <script type="text/javascript">
   		function replyCheck() {
			var content = document.reply.content.value;
			if(content != null && content != ""){
				var result = confirm("후기를 등록하시겠습니까?");
				if(!result){
					return false;
				}
			}else{
				alert("후기 내용을 입력해주세요.");
				return false;
			}
		}
   </script>
   
   <!-- 댓글 등록 유효성 검사(비회원) -->
   <script type="text/javascript">
   		function replyLogin(){
   			alert("로그인 후 등록할 수 있습니다.");
   		}
   </script>
   
   <!-- 댓글 삭제 유효성 검사 -->
   <script type="text/javascript">
   		function replyDelete(){
   			var result = confirm("댓글을 삭제하시겠습니까?");
   			if(result){
   				window.location = "/kanbu/info/replyDelete.com";
   			}else{
   				return false;
   			}
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
		
	<!-- 좋아요 기능 -->
	<script type="text/javascript">
   		$(function(){
   			var good = 1;		// 좋아요 상태(선택 : 1, 미선택 : 0)
   			var checkCount = false;
   								
   			$('.genric-btn primary-border small').click(function(){
   				// 회원 상태 확인
   									
   				// 회원일 때
   				var placeNum = "<c:out value='${placeInfo.index_num}' />";		// 장소 번호
   									
   				if(false){
   					good = 0;
   				}
   									
   				if(good == 1){
   					// 좋아요 선택완료(색 변경)
   					$('.genric-btn primary-border small').css({'background-color' : '#FF0000'});
   					good = 0;
   					location.replace('/kanbu/info.com?placeNum='+placeNum+'&checkCount=1');
   				}else{
   					// 좋아요 선택취소
   					$('.genric-btn primary-border small').css({'background-color' : '#000000'});
   					good = 1;
   					location.replace('/kanbu/info.com?placeNum='+placeNum+'&checkCount=0');
   				}					
   			})
   		});
   	</script>

</body>

</html>