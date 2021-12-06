<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- CSS here -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">

<link rel="stylesheet" href="resources/css/style.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> 

<title>이메일전송</title>
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
	<form action="/kanbu/findPassword.com" method="post">
		<div>
			<span class="material-icons">email</span>
			<p align="center">
				이메일에 전송하였습니다<br>
				이메일을 확인하고 로그인하세요
			</p>
			<div id="button" align="center">
			<button class="boxed-btn4" type="submit" id="optionModifyBtn">로그인</button>
			</div>
		</div>
	</form>
	</div>
</body>
</html>