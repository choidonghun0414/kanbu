<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="${path}/include/js/common.js"></script>
	<script src="${path}/ckeditor/ckeditor.js"></script>

	<script type="text/javascript">
		$("#btnSave").click(function() {
			var title = document.form1.title.value;
			if (title == "") {
				alert("여행 제목을 입력하세요.");
				document.form1.title.focus();
				return;
			}
			document.form1.submit();
		});

		$('#date').change(function() {
			var date = $('#date').val();
			alert(date);
		});
	</script>

	<style>
	div {
		padding-top: 5px;
		padding-bottom: 5px;
	}
	</style>
</head>

<body>
	<form name="updatePlan" id="updatePlan" action="/kanbu/updatePro.com?index_num=${plan.index_num}" method="post">
		<div>
			<input name="title" id="title" size="80" value="${plan.title}">
		</div>
		<div>
			여행 출발날짜 : 
			<input type="date" name="startDay" value="${plan.startDay}"	id="startDay" /> 
			~ 여행 도착날짜 : 
			<input type="date" name="arrivalDay" value="${plan.arrivalDay}" id="arrivalDay" />
		</div>

		<hr>

		<div>
			<h3>일차</h3>
			<input type="text" name="schedule1" size="30"> <br> 
			<input type="text" name="schedule2" size="30"> <br> 
			<input type="text" name="schedule3" size="30"> <br> <br>

			<h3>일차</h3>
			<input type="text" name="schedule1" size="30"> <br> 
			<input type="text" name="schedule2" size="30"> <br> 
			<input type="text" name="schedule3" size="30"> <br>
		</div>

		<hr>

		<div>
			<h3>🚗 이동수단</h3>
			이동수단을 선택해주세요. <br> 
			<select size="1" name="traffic"	value="${plan.traffic}">
				<option value="car">자동차</option>
				<option value="taxi">택시</option>
				<option value="bus">버스</option>
				<option value="train">기차</option>
				<option value="subway">지하철</option>
				<option value="walk">도보</option>
			</select>
		</div>
		<hr>

		<div>
			<h3>💵 여행경비</h3>
			여행 경비를 입력해주세요. <br> 
			<input type="text" name="expense" size="10"	value="${plan.expense}"> 만원
		</div>

		<div>
			<input type="submit" name="btnUpdate" value="수정완료"> 
			<input type="button" name="btnList" value="목록보기" onclick="location.href='list.com'">
		</div>

	</form>


</body>
</html>