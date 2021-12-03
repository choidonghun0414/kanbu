<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<div>
		<h3>${plan.title}</h3>
	</div>
	<h6>작성일자</h6>
	<fmt:formatDate value="${plan.reg_date}" pattern="yyyy-MM-dd"/> 
	<div>
		${plan.startDay}
		~
		${plan.arrivalDay}
	</div>
	
	<hr>

	<div>
		<h3>일차</h3>
		<input type="text" name="schedule1" size="30"> <br>
		<input type="text" name="schedule2" size="30"> <br>
		<input type="text" name="schedule3" size="30"> <br>
		<br>
	
		<h3>일차</h3>
		<input type="text" name="schedule1" size="30"> <br>
		<input type="text" name="schedule2" size="30"> <br>
		<input type="text" name="schedule3" size="30"> <br>
	</div>

	<hr>

	<div> 
		<h3>🚗 이동수단</h3>
		${plan.traffic}
	</div>
	
	<hr>
	
	<div>
		<h3>💵 여행경비</h3>
		${plan.expense} 만원입니다.
	</div>

	
	<div>
		<input type="button" value="수정하기" onclick="location.href='/kanbu/update.com?index_num=${index_num}'"></input>
		<input type="button" name="btnList" value="목록보기"
			onclick="location.href='list.com'" />
	</div>

	

</body>
</html>