<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  


<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Place Administration</title>
  	
  <!-- base:css -->
  <link rel="stylesheet" href="/kanbu/resources/admin/vendors/typicons.font/font/typicons.css">
  <link rel="stylesheet" href="/kanbu/resources/admin/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/kanbu/resources/admin/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/kanbu/resources/admin/images/favicon.png" />
  
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
  
  <div class="container-scroller">
  	<!-- 헤더부분 : 카테고리 영역 -->
    <!-- partial:../../partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo" href="/kanbu/main.com"><img src="/kanbu/resources/admin/images/kanbuAdminlogo.png" alt="logo"/></a>
          <a class="navbar-brand brand-logo-mini" href="/kanbu/main.com"><img src="/kanbu/resources/admin/images/kanbuAdminlogomini.png" alt="logo"/></a>
          <button class="navbar-toggler navbar-toggler align-self-center d-none d-lg-flex" type="button" data-toggle="minimize">
            <span class="typcn typcn-th-menu"></span>
          </button>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
          <ul class="navbar-nav mr-lg-2">
            <li class="nav-item  d-none d-lg-flex">
              <a class="nav-link" href="/kanbu/main.com">
                Home
              </a>
            </li>
            <li class="nav-item  d-none d-lg-flex">
              <a class="nav-link active" href="/kanbu/mapView.com">
                일정만들기
              </a>
            </li>
            <li class="nav-item  d-none d-lg-flex">
              <a class="nav-link" href="/kanbu/place.com">
                여행지정보
              </a>
            </li>
            <li class="nav-item nav-profile dropdown">
              <a class="nav-link dropdown-toggle  pl-0 pr-0" href="#" data-toggle="dropdown" id="boardDropdown">
                <span class="nav-profile-name">게시판</span>
              </a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="boardDropdown">
                <a class="dropdown-item" href="/kanbu/board/reviewList.com">여행후기</a>
                <a class="dropdown-item" href="/kanbu/board/noticeList.com">공지사항</a>
              </div>
            </li>        
          </ul>
          <ul class="navbar-nav navbar-nav-right">
          	<c:if test="${sessionScope.status > 0}">
          		<li class="nav-item nav-profile dropdown">
          			<span class="nav-profile-name">${sessionScope.nick}님 환영합니다.</span>
				</li>
          		
            	<c:if test="${sessionScope.status == 1}">
            		<li class="nav-item nav-profile dropdown">
            			<a class="nav-link dropdown-toggle  pl-0 pr-0" href="/kanbu/mypage.com">
              				<i class="typcn typcn-user-outline mr-0"></i>
              			</a>
            		</li>
            	</c:if>
            	
            	<c:if test="${sessionScope.status == 100}">
            		<li class="nav-item nav-profile dropdown">
            			<a class="nav-link dropdown-toggle  pl-0 pr-0" href="/kanbu/admin.com">
              				<i class="typcn typcn-device-desktop mr-0"></i>
              			</a>
            		</li>
            	</c:if>
            	
            	<li class="nav-item nav-profile dropdown">
            		<a class="nav-link dropdown-toggle  pl-0 pr-0" href="/kanbu/logout.com">
              			<i class="typcn typcn-lock-open mr-0"></i>
              		</a>
            	</li>
            </c:if>
          </ul>
          
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="typcn typcn-th-menu"></span>
          </button>
        </div>
      </nav>
      
    <!-- 헤더 카테고리, 사이드 바 카테고리 색상 설정 영역 -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_settings-panel.html -->
      <div class="theme-setting-wrapper">
          <div id="settings-trigger"><i class="typcn typcn-cog-outline"></i></div>
          <div id="theme-settings" class="settings-panel">
            <i class="settings-close typcn typcn-delete-outline"></i>
            <p class="settings-heading">SIDEBAR SKINS</p>
            <div class="sidebar-bg-options" id="sidebar-light-theme">
              <div class="img-ss rounded-circle bg-light border mr-3"></div>
              Light
            </div>
            <div class="sidebar-bg-options selected" id="sidebar-dark-theme">
              <div class="img-ss rounded-circle bg-dark border mr-3"></div>
              Dark
            </div>
            <p class="settings-heading mt-2">HEADER SKINS</p>
            <div class="color-tiles mx-0 px-4">
              <div class="tiles success"></div>
              <div class="tiles warning"></div>
              <div class="tiles danger"></div>
              <div class="tiles primary"></div>
              <div class="tiles info"></div>
              <div class="tiles dark"></div>
              <div class="tiles default border"></div>
            </div>
          </div>
        </div>
        
        
      <!-- 사이드 관리자 전용 카테고리 영역 -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <div class="d-flex sidebar-profile">
              <div class="sidebar-profile-name">
                <p class="sidebar-name">
                  Administration Menu
                </p>
              </div>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="typcn typcn-user-add-outline menu-icon"></i>
              <span class="menu-title">회원 관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="/kanbu/admin/memberInfo.com">회원 조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="/kanbu/join.com">관리자 등록</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
              <i class="typcn typcn-globe-outline menu-icon"></i>
              <span class="menu-title">여행지 관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="icons">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="/kanbu/admin/placeInfo.com">조회/수정</a></li>
                <li class="nav-item"> <a class="nav-link" href="/kanbu/admin/placeAdd.com">여행지 등록</a></li>
                <li class="nav-item"> <a class="nav-link" href="/kanbu/admin/placeReply.com">여행지 댓글 관리</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="typcn typcn-compass menu-icon"></i>
              <span class="menu-title">일정 관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="/kanbu/admin/planInfo.com">조회</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
              <i class="typcn typcn-document-text menu-icon"></i>
              <span class="menu-title">게시판 관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="/kanbu/admin/board/reviewInfo.com">여행후기</a></li>
                <li class="nav-item"> <a class="nav-link" href="/kanbu/admin/board/reviewReply.com">여행후기댓글</a></li>
                <li class="nav-item"> <a class="nav-link" href="/kanbu/board/noticeList.com">공지사항</a></li>
              </ul>
            </div>
          </li>    
        </ul>
      </nav>
      <!-- 헤더 및 사이드 카테고리 영역 종료 -->
      
      
      <!-- body 부분 시작 -->
      <!-- 주요 내용 코드 작성 -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">여행지 조회/수정</h4>
                  <c:if test="${placeCount == 0}">
                  		<p>등록된 장소가 없습니다.</p>
                  	</c:if>
                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead align="center">
                        <tr>
                          <th>No.</th>
                          <th>장소</th>
                          <th>주소</th>
                          <th>전화번호</th>
                          <th>어른요금</th>
                          <th>아이요금</th>
                          <th>오픈시간</th>
                          <th>마감시간</th>
                          <th>댓글수</th>
                          <th>조회수</th>
                          <th>수정</th>
                        </tr>
                      </thead>
                      <tbody align="center">
                      	<c:if test="${placeCount > 0}">
                        	<c:forEach var="place" items="${placeList}">
                        		<tr>
                          			<td>${place.index_num}</td>
                          			<td>
                          				<button type="button" class="btn btn-link btn-fw" 
                          					    onclick="location.href='/kanbu/info.com?placeNum=${place.index_num}'">
                          					${place.name}
                          				</button>
                          			</td>
                          			<td>${place.addr}</td>
                          			<td>${place.tel}</td>
                          			<td><fmt:formatNumber type="currency" value="${place.fee1}" /></td>
                          			<td><fmt:formatNumber type="currency" value="${place.fee2}" /></td>
                          			<td>
                          				<c:if test="${place.opening >= 0 && place.opening < 10}">
                          					0${place.opening}:00
                          				</c:if>
                          				<c:if test="${place.opening >= 10}">
                          					${place.opening}:00
                          				</c:if>
                          			</td>
                          			<td>
                          				<c:if test="${place.closing >= 0 && place.closing < 10}">
                          					0${place.closing}:00
                          				</c:if>
                          				<c:if test="${place.closing >= 10}">
                          					${place.closing}:00
                          				</c:if></td>
                          			<td>${place.reviewcount}</td>
                         			<td>${place.views}</td>
                         			<td>
                         				<button type="button" class="btn btn-inverse-info btn-icon"
                         						onclick="location.href='/kanbu/admin/placeInfo/edit.com?placeNum=${place.index_num}'">
                        					<i class="typcn typcn-edit"></i>
                      					</button>
                      				</td>
                        		</tr>
                        	</c:forEach>
                        </c:if>
                      </tbody>
                    </table>
                  </div>
                </div>
                
                
                <!-- 페이지 번호 나타내기 -->
				<c:if test="${placeCount > 0}">
					<fmt:parseNumber var="pageCount" 
									 value="${placeCount / pageSize + (placeCount %  pageSize == 0 ? 0 : 1)}"
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
                        			<c:if test="${searchCount != 1}">
                            			<a href="/kanbu/admin/placeInfo.com?pageNum=${startPage-5}" 
                            			   class="page-link" aria-label="Previous">
                                			<i class="mdi mdi-arrow-left"></i>
                                		</a>
                                	</c:if>
                                	<c:if test="${searchCount == 1}">
                            			<a href="/kanbu/admin/search.com?thema=${thema}&keyword=${keyword}&pageNum=${startPage-5}" 
                            			   class="page-link" aria-label="Previous">
                                			<i class="mdi mdi-arrow-left"></i>
                                		</a>
                                	</c:if>	
                            	</li>
                        	</c:if>
                               	
                        	<c:forEach var="i" begin="${startPage}" end="${endPage}">
                        		<li class="page-item">
                        			<c:if test="${searchCount != 1}">
                            			<a href="/kanbu/admin/placeInfo.com?pageNum=${i}" 
                            		   	   class="page-link">${i}</a>
                            		</c:if>
                            		<c:if test="${searchCount == 1}">
                            			<a href="/kanbu/admin/search.com?thema=${thema}&keyword=${keyword}&pageNum=${i}" 
                            		   	   class="page-link">${i}</a>
                            		</c:if>
                            	</li>
                        	</c:forEach>
                             	
                        	<c:if test="${endPage < pageCount}">
                        		<li class="page-item">
                        			<c:if test="${searchCount != 1}">
                            			<a href="/kanbu/admin/placeInfo.com?pageNum=${startPage+5}" 
                            		   	   class="page-link" aria-label="Next">
                             				<i class="mdi mdi-arrow-right"></i>
                                		</a>
                                	</c:if>
                                	<c:if test="${searchCount == 1}">
                                		<a href="/kanbu/admin/search.com?thema=${thema}&keyword=${keyword}&pageNum=${startPage+5}" 
                            			   class="page-link" aria-label="Next">
                             				<i class="mdi mdi-arrow-right"></i>
                                		</a>
                                	</c:if>
                            	</li>
                        	</c:if>
                    	</ul>
                	</nav> 
                </c:if>
                
                
               	<!-- 검색 form 영역 -->
                <form name="searchPlace" id="searchPlace" action="/kanbu/admin/search.com" method="post" style="text-align: center;">
					<div class="form-group">
						<select name="thema" id="thema" class="form-control-sm">
                  	   		<option value="name" selected>장소</option>
                  	   	</select>
                  	   	<input type="text" name="keyword" id="keyword" class="form-control-sm"/>
                  	   	<button class="btn btn-sm btn-secondary" type="button" onclick="search();">검색</button>
                  	</div>
                </form>  	
              </div>
            </div>
            
        <!-- footer 영역 -->
        <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
            	<span class="text-center text-sm-left d-block d-sm-inline-block">Copyright © <script>document.write(new Date().getFullYear());</script></span>
              	<span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">All rights reserved | Kanbu Travel</span>
            </div>
          </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  </div>
  <!-- container-scroller -->
  <!-- base:js -->
  <script src="/kanbu/resources/admin/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="/kanbu/resources/admin/js/off-canvas.js"></script>
  <script src="/kanbu/resources/admin/js/hoverable-collapse.js"></script>
  <script src="/kanbu/resources/admin/js/template.js"></script>
  <script src="/kanbu/resources/admin/js/settings.js"></script>
  <script src="/kanbu/resources/admin/js/todolist.js"></script>
  <!-- endinject -->
  <!-- plugin js for this page -->
  <!-- End plugin js for this page -->
  <!-- Custom js for this page-->
  <!-- End custom js for this page-->
  
  
</body>

	<!-- 장소 검색 기능 -->
  	<script type="text/javascript">
  		function search(){
  			var target = document.getElementById("thema");
  			var thema = target.options[target.selectedIndex].value;
  			var keyword = document.getElementById('keyword').value
  			
  			if(thema != null && thema != ""){
  				if(keyword != null && keyword != ""){
  					window.location = '/kanbu/admin/search.com?thema='+thema+'&keyword='+keyword;
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

</html>
