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
	
	<title>Find ID</title>
	
	<style>
		@import
			url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
			;
	
		p {
			font-family: 'Noto Sans KR', sans-serif;
			font-size: 16px;
		}
		
		#fulldiv{ margin-top:20%; text-align: center;}
		#button{ margin-top: 30px;}
		
		.material-icons{ color: #38E25D; font-size: 30px; align-items: center;}
	
	</style>
</head>
<body>
	<div  id="fulldiv">
		<div>
			<span class="material-icons">info</span>
			<p align="center">
				당신의 ID는 ${id}입니다. 
			</p>
			<div id="button" align="center">
				<button class="boxed-btn4" type="button" id="optionModifyBtn"
					    onclick="location.href='/kanbu/login.com'">로그인</button>
				</div>
		</div>
	</div>
</body>
</html>