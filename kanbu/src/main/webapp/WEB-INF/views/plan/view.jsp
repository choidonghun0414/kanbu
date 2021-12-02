<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${path}/ckeditor/ckeditor.js"></script>
<script>
$(function(){
	//목록 버튼 클릭
	$("#btnList").click(function(){
		location.href="${path}/plan/list.com";
	});
	
	listAttach();	//스케쥴 목록 로딩
	
	$("#btnUpdate").click(function(){
		var str="";
	})$("#uploadedList .file").each(function(i){
		str += "<input type='hidden' name='files["+i+"]' value='"+$(this).val()+"'>";
	});
})
</script>
	
</head>
<body>






</body>
</html>