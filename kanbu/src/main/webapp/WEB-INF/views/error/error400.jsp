<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>

 <%-- 400 : 요청이 잘못되었을 때 에러 처리 --%>
    
    <%-- 서버로부터 정상 요청을 받는다. 200번 --%>
    <%	response.setStatus(HttpServletResponse.SC_OK);	%>
    
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Error</title>
  <!-- base:css -->
  <link rel="stylesheet" href="/kanbu/resources/admin/vendors/typicons.font/font/typicons.css">
  <link rel="stylesheet" href="/kanbu/resources/admin/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/kanbu/resources/admin/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/kanbu/resources/admin/images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center text-center error-page bg-primary">
        <div class="row flex-grow">
          <div class="col-lg-7 mx-auto text-white">
            <div class="row align-items-center d-flex flex-row">
              <div class="col-lg-6 text-lg-right pr-lg-4">
                <h1 class="display-1 mb-0">Error</h1>
              </div>
              <div class="col-lg-6 error-page-divider text-lg-left pl-lg-4">
                <h2>서비스 불편을 드려서 죄송합니다.</h2>
                <h3 class="font-weight-light">빠른 시일 내에 점검하겠습니다.</h3>
              </div>
            </div>
            <div class="row mt-5">
              <div class="col-12 text-center mt-xl-2">
                <a class="text-white font-weight-medium" href="/kanbu/main.com">Back to home</a>
              </div>
            </div>
            <div class="row mt-5">
              <div class="col-12 mt-xl-2">
                <p class="text-white font-weight-medium text-center">Copyright &copy; 
                	<script>document.write(new Date().getFullYear());</script>
                	All rights reserved | Kanbu Travel
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- base:js -->
  <script src="/kanbu/resources/admin/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="/kanbu/resources/admin/js/off-canvas.js"></script>
  <script src="/kanbu/resources/admin/js/hoverable-collapse.js"></script>
  <script src="/kanbu/resources/admin/js/template.js"></script>
  <script src="/kanbu/resources/admin/js/settings.js"></script>
  <script src="/kanbu/resources/admin/js/todolist.js"></script>
  <!-- endinject -->
</body>

</html>
