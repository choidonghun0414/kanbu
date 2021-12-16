<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>        
    
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>ReviewDetail</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="/kanbu/resources/img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="/kanbu/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/kanbu/resources/css/bootstrap1.min.css">
    <link rel="stylesheet" href="/kanbu/resources/css/bootstrap2.min.css">
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
	
    a {
	    color: #007bff;
	    text-decoration: none;
	    background-color: transparent;
	    -webkit-text-decoration-skip: objects;
	    color: inherit;
	}
	
	h3.md-30 {
	    text-align: center;
	    margin-top: 60px;
	    margin-bottom: 60px;
	    font-size: 35px;
	}
	
	.mb_70 {
    	margin-bottom: 30px;
	}
	
	/* 검색 input창 서타일 */
	input.form-control {
		margin-bottom: 50px;
		width: 300px;
	}
	
	/* 버튼 왼쪽의 여백 */
	.input-group-btn{
		margin-left: 5px;
	}
	
	/* 푸터 사이즈 조절, 컨텐츠와 간격 조절 */
    .footer .footer_top {
   		margin-top: 110px;
   		padding-top: 50px;
   		padding-bottom: 30px;
	}
	
	.notice-contents{
		height: 100%;
	}
	
	.notice-contents > td{
		text-align: center;
		padding: 30px;
	}
	
	.submenu > li > a:hover{
	  background-color: #D3D3D3;
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
	<div class="container box_1170">
		<h3 class="md-30"> ${selectReview.nick}님의 여행 리뷰</h3>
	</div>
	
<!-- =================== 게시글 보기 =================== -->
<div class="container">
	<form action="/kanbu/board/reviewDetailPro.com" name="reviewForm" method="post">
		<div class="row">
			<div class="col-sm-12">
        		<table class="table table-bordered table-condensed">
		        	<colgroup>
						<col width= "9%" />
						<col width= "80%" />
					</colgroup>
		        		<thead>
				        	<tr>
				        		<td scope="col">제목</td>
				        		<td scope="col" style="text-align: left;">&nbsp;&nbsp;&nbsp;${selectReview.title}</td>
				        	</tr>
				        	<tr>
				        		<td scope="col">작성자</td>
				        		<td scope="col" style="text-align: left;">&nbsp;&nbsp;&nbsp;${selectReview.nick}</td>
				        	</tr>
		        		</thead>
		        			<tr>
		        				<td colspan="2" scope="colgroup" style="text-align: left; font-size: 12px;">
		        				&nbsp;&nbsp;조회수&nbsp;&nbsp;${selectReview.views} </td>
		        			</tr>
		        			<tr class="notice-contents">
	        					<td colspan="2" scope="colgroup">
	        						<c:if test="${!empty(selectReview.picture1)}">
    									<img src="${uploadPath+=selectReview.picture1}"/>
    								</c:if>
    								<c:if test="${!empty(selectReview.picture2)}">
    									<img src="${uploadPath+=selectReview.picture2}"/>
    								</c:if>
    								<c:if test="${!empty(selectReview.picture3)}">
    									<img src="${uploadPath+=selectReview.picture3}"/>
    								</c:if>
    								<c:if test="${!empty(selectReview.picture4)}">
    									<img src="${uploadPath+=selectReview.picture4}"/>
    								</c:if>
    								<c:if test="${!empty(selectReview.picture5)}">
    									<img src="${uploadPath+=selectReview.picture5}"/>
    								</c:if>
	        						${selectReview.content}
	        					</td>
	        				</tr>
	        				<tr>
	        					<td colspan="2" style="text-align: left;">
	        						<c:forEach var="tag" items="${tagList}">
	        							<c:if test="${selectReview.index_num == tag.index_num}">
	        								#${tag.name}&nbsp;
	        							</c:if>
	        						</c:forEach>
	        					</td>
	        				</tr>
	    		</table>
        	</div>
        	<!-- ================== 목록, 수정 버튼 ================== -->
        	<div class="d-flex flex-row-reverse">
				<span class="input-group-btn">
					<a class="btn btn-secondary" href="/kanbu/board/reviewList.com" role="button">목록</a>
					<c:if test="${selectReview.writer == sessionScope.index_num}">
						<a class="btn btn-secondary" href="/kanbu/board/reviewUpdateForm.com?reviewNum=${selectReview.index_num}" role="button">수정</a>
						<a class="btn btn btn-danger" href="/kanbu/board/reviewDeletePro.com?reviewNum=${selectReview.index_num}" role="button"
						   onclick="return deleteReview();">삭제</a>
					</c:if>
				</span>
			</div>
    	</div>
    </form>  
</div>
<!-- =================== 게시글 보기 끝 =================== -->
<!-- 댓글 조회 영역 -->
				<div class="row justify-content-center">
				<div class="col-lg-8 col-md-9">
               		<div class="comments-area">
               		
               		
                  		<h4>리뷰톡 ${reply_count}</h4>
                  		<c:if test="${reply_count == 0}">
                  			<div class="comment-list">
                     			<div class="single-comment justify-content-between d-flex">
                     				<div class="user justify-content-between d-flex">
                        				<div class="desc">
                              				<p class="comment" style="font-weight: bolder;">
                                 				작성된 댓글이 존재하지 않습니다.
                              				</p>
                           				</div>
                           			</div>
                           		</div>
                           	</div>
                       	</c:if>
                        		
                        <c:if test="${reply_count > 0}">
                        	<c:forEach var="review_reply" items="${ReviewReplyList}">
                        		<div class="comment-list">
                     				<div class="single-comment justify-content-between d-flex">
                        				<div class="user justify-content-between d-flex">
                           					<div class="thumb">
                              					<img src="/kanbu/resources/img/comment/profile.png" alt="">
                           					</div>
                           					<div class="desc">
                              					<p class="comment" style="font-weight: bolder;">
                                 					${review_reply.content}
                              					</p>
                            					<div class="d-flex justify-content-between">
                                					<div class="d-flex align-items-center">
                                       					<p>${review_reply.nick}	|	
                                       						<fmt:formatDate value="${review_reply.reg_date}" pattern="yyyy-MM-dd"/> 
                                       					</p>
                                 					</div>
                                 					<c:if test="${(sessionScope.nick eq review_reply.nick)}">
                                 						<c:if test="${!(review_reply.content eq '관리자에 의해 삭제된 댓글입니다.')}">
	                                 						<div class="reply-btn" align="right">
	                                    						<a href="/kanbu/board/reviewReplyDelete.com?reviewNum=${review_reply.review}&replyNum=${review_reply.index_num}" 
	                                    					   	   class="btn-reply" style="font-weight: bold;"
	                                    					   	   onclick="return replyDelete();">
	                                    					   	   <i class="ti-trash"></i>
	                                    					   	</a>
	                                 						</div>
	                                 					</c:if>
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
	                               			<a href="/kanbu/board/reviewDetail.com?reviewNum=${selectReview.index_num}&pageNum=${startPage-5}" class="page-link" aria-label="Previous">
	                                       		<i class="ti-angle-left"></i>
	                                   		</a>	
	                               		</li>
	                               	</c:if>
	                               	
	                               	<c:forEach var="i" begin="${startPage}" end="${endPage}">
	                               		<li class="page-item">
	                               			<a href="/kanbu/board/reviewDetail.com?reviewNum=${selectReview.index_num}&pageNum=${i}" class="page-link">${i}</a>
	                               		</li>
	                             	</c:forEach>
	                             	
	                             	<c:if test="${endPage < pageCount}">
	                               		<li class="page-item">
	                               			<a href="/kanbu/board/reviewDetail.com?reviewNum=${selectReview.index_num}&pageNum=${startPage+5}" class="page-link" aria-label="Next">
	                                       		<i class="ti-angle-right"></i>
	                                   		</a>
	                               		</li>
	                               	</c:if>
	                            </ul>
	                        </nav>
                        </c:if>
                        
                        
                        <c:if test="${sessionScope.status == 1 || sessionScope.status == 100}">
               			<div class="comment-form">
                  			<h4>댓글 남기기</h4>
                  			<form name="reply" method="post" action="/kanbu/board/reviewReply.com">
                     			<div class="row">
                        			<div class="col-12">
                           				<div class="form-group">
                           					<input type="hidden" name="reviewNum" id="reviewNum" value="${selectReview.index_num}" />
                           					<input type="hidden" name="writer" id="writer" value="${sessionScope.index_num}" />
                              				<textarea class="form-control w-100" name="content" id="content" cols="30" rows="9"
                                 				  	  placeholder="댓글을 남겨주세요..."></textarea>
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
                  			<h4>댓글 남기기</h4>
                  			<form name="reply" method="post" action="/kanbu/login.com">
                     			<div class="row">
                        			<div class="col-12">
                           				<div class="form-group">
                           					<input type="hidden" name="placeNum" value="${selectReview.index_num}" />
                           					<input type="hidden" name="writer" id="writer" value="${sessionScope.index_num}" />
                              				<textarea class="form-control w-100" name="content" id="content" cols="30" rows="9"
                                 				  	  placeholder="댓글을 남겨주세요..."></textarea>
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
    
    <!-- 댓글 등록 유효성 검사(회원) -->
   <script type="text/javascript">
   		function replyCheck() {
			var content = document.reply.content.value;
			if(content != null && content != ""){
				var result = confirm("댓글을 등록하시겠습니까?");
				if(!result){
					return false;
				}
			}else{
				alert("댓글을 입력해주세요.");
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
   				window.location = "/kanbu/board/reviewReplyDelete.com";
   			}else{
   				return false;
   			}
   		}
   </script>
   
   <!-- 리뷰 삭제 유효성 검사 -->
   <script type="text/javascript">
   		function deleteReview(){
   			var result = confirm("리뷰를 삭제하시겠습니까?");
   			
   			if(!result){
   				return false;
   			}
   		}
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