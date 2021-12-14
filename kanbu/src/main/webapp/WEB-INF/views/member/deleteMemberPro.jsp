<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<!-- CSS here -->
	<link rel="stylesheet" href="/kanbu/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="/kanbu/resources/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/kanbu/resources/css/magnific-popup.css">
	<link rel="stylesheet" href="/kanbu/resources/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="/kanbu/resources/css/style.css">
	
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> 
	<title>회원탈퇴</title>
	
	<style>
	@import
		url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
		;
	
		p {
			font-family: 'Noto Sans KR', sans-serif;
			font-size: 16px;
		}
		div{ margin-top:20%; text-align: center;}
		
		.material-icons{ color: gray; font-size: 30px; align-items: center;}
		#button{ margin-top: 30px;}
	</style>
	
</head>
<body>
	<div>
		<span class="material-icons">person_remove</span>
		<p align="center">회원이 탈퇴되었습니다.</p>
		<div id="button" align="center">
			<button class="boxed-btn4" type="button" id="optionModifyBtn"
				    onclick="location.href='/kanbu/main.com'">홈으로</button>
		</div>
	</div>
</body>
</html>