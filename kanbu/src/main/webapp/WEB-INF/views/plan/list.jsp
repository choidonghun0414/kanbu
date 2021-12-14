<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
	<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Insert title here</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
    <link rel="stylesheet" href="/kanburesources/css/slick.css">
    <link rel="stylesheet" href="/kanbu/resources/css/slicknav.css">
    <link rel="stylesheet" href="/kanbu/resources/css/style.css">
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
    
    <!--======== 나의 일정 관리 헤더 ========  -->
	<div class="container box_1170">
		<h3 class="md-30">나의 일정 관리</h3>
	</div>

	<div class="d-flex flex-row-reverse">
		<span class="input-group-btn">
			<button style="margin-right:50px;" type="button" class="boxed-btn4" id="btnWrite" onclick="location.href='/kanbu/mapView.com'">일정생성</button>
		</span>
	</div>
	<hr>

	<!--======== 나의 일정 관리 테이블 ========  -->
	<div class="container box_1170">
		<c:if test="${count > 0}">
		${count}개의 게시물이 있습니다.
			<table class="table table-hover">
				<thead>
					<tr>
						<th width="60">No.</th>
						<th width="100">작성일</th>
						<th width="650">제목</th>
						<th width="70">&nbsp</th>
					</tr>
				</thead>
				
				<c:forEach var="myPlan" items="${myPlanList}">
				
				<tbody>
					<tr class="table-active">
						<td align="center">
							${myPlan.index_num}
							<input type="hidden" name=myPlanNum id=myPlanNum value="${myPlan.index_num}" />
						</td>
						<td align="center">
							<fmt:formatDate value="${myPlan.reg_date}" pattern="yyyy.MM.dd"/> 
						</td>
						<td align="center">
							<a href="/kanbu/detail.com?index_num=${myPlan.index_num}">${myPlan.title}</a></td>
						<td align="center">
							<div class="d-flex flex-row-reverse">
								<span class="input-group-btn">
									<button type="button" id="btnDelete" onclick="delMyPlan();">삭제</button>
								</span>
							</div>
						</td>
					</tr>
				</tbody>
				</c:forEach>	
			</table>
		</c:if>
			
		<c:if test="${count == 0}">
			해당 목록이 없습니다.
		</c:if>	
	</div>
	
		<!-- 페이지 번호 나타내기 -->
		<c:if test="${count > 0}">
			<fmt:parseNumber var="pageCount" 
							 value="${count / pageSize + (count %  pageSize == 0 ? 0 : 1)}"
							 integerOnly="true" />
			<c:set var="pageBlock" value="${5}" />
			<fmt:parseNumber var="result" value="${currentPage/5}" integerOnly="true"/>
			<c:set var="startPage" value="${result*5+1}" />
			<c:set var="endPage" value="${startPage + pageBlock - 1}" />
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}" />
			</c:if>			 
		</c:if>
	
			<!-- ========게시판 페이징 표시======== -->
			<nav class="blog-pagination d-flex justify-content-center">
				<ul class="pagination">
					<!-- 이전페이지 표시 -->
					<c:if test="${startPage > 5}">
						<li class="page-item">
							<a href="/kanbu/list.com?pageNum=${startPage-5}" class="page-link" aria-label="Previous"> 
								<i class="ti-angle-left"></i>
							</a>
						</li>
					</c:if>
					
					<!-- 페이지 표시 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li class="page-item">
							<a href="/kanbu/list.com?pageNum=${i}" class="page-link">${i}</a>
						</li>
					</c:forEach>
					
					<!-- 다음페이지 표시 -->
					<c:if test="${endPage < pageCount}">
						<li class="page-item">
							<a href="/kanbu/list.com?pageNum=${startPage+5}" class="page-link"
							aria-label="Next"> 
								<i class="ti-angle-right"></i>
							</a>
						</li>
					</c:if>
				</ul>
			</nav>

	<script type="text/javascript">
		function delMyPlan(){
			var index_num = document.getElementById("myPlanNum").value;
			if(confirm("정말 삭제하시겠습니까?")){
				location.replace("/kanbu/delete.com?index_num="+index_num);
	 		}else{
	 			return false;
			}
		}
	</script>


	<script>	
		function list(page){
			location.href="${path}/plan/list.com?curPage=" + page
					+ "&search_option=${map.search_option}"
					+ "&keyword=${map.keyoword}";
		}
	</script>

</body>
</html>