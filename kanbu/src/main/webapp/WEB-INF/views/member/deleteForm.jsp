<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>회원탈퇴</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    

<!-- CSS here -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/style.css">

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;
p {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 16px;
}
div{ margin-top:15%; text-align: center;}

#button{ margin-top: 30px;}
</style>
</head>
<body>

<script type="text/javascript">
		$(document).ready(function(){
			$("#submit").on("click", function(){
				if($("#pw2").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#pw2").focus();
					return false;
				}
				if(!$("input:checked[id='deletechk']").is(":checked")){
					alert("이용약관에 동의해주세요.");
					$("#deletechk").focus();
					return false;
				}

			});
		})
</script>



<form id="deleteform" method="post" action="/kanbu/deleteMemberPro.com">
<div>
<h1 align="center">회원 탈퇴</h1>
<hr>
<input type="hidden" name="id" value="${sessionScope.id}">
<p>회원탈퇴를 하면 더 이상 현재 계정을 이용할 수 없습니다.</p>
<br>
<p><input type="checkbox" id="deletechk" name="deletechk" value="n">안내사항을 확인했습니다.</p>
<hr>
<p>비번입력 : <input type="password" id="pw2" name="pw2"><p>
<br>
<button class="boxed-btn4" type="submit"  id="submit" >회원탈퇴</button>
<button class="boxed-btn4" type="button" onclick="location.href='/kanbu/main.com'">취소</button>
</div>
</form>
<c:if test="${empty sessionScope.status}">
<script type="text/javascript">
         alert("접근할 수 없는 페이지입니다.");
         window.location = "/kanbu/main.com";
</script>
</c:if>
</body>
</html>