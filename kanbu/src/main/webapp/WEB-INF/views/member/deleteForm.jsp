<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>회원탈퇴</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    
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
				
				if($("#pw2").val()!=${sessionScope.pw2}){
					alert("비밀번호가 맞지않아요");
					$("#pw2").focus();
					return false;
				}
				
				alert("회원탈퇴되었습니다.");
			});
			
		})
</script>

<c:if test="${empty sessionScope.status}">
<script type="text/javascript">
         alert("접근할 수 없는 페이지입니다.");
         window.location = "/kanbu/main.com";
</script>
</c:if>



<form id="deleteform" method="post" action="/kanbu/deleteMemberPro.com">
<div>
<input type="hidden" name="id" value="${sessionScope.id}">
탈퇴할꺼니?
응<input type="checkbox" id="deletechk" name="deletechk" value="n">
비번입력 : <input type="password" id="pw2" name="pw2">
<button type="submit"  id="submit" >회원탈퇴</button>
<button class="cencle btn btn-danger" type="button" onclick="location.href='/kanbu/main.com'">취소</button>
</div>
</form>

<%-- <div>
	<c:if test="${msg == false}">
	비밀번호가 맞지 않습니다.
	</c:if>
</div> --%>

</body>
</html>