<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="${path}/include/js/common.js"></script>
	<script src="${path}/ckeditor/ckeditor.js"></script>


	<script type="text/javascript">
		$("#btnSave").click(function() {
			var title=document.form1.title.value;
 			if(title=="") {
 				alert("여행 제목을 입력하세요.");
 				document.form1.title.focus();
 				return;
 			}
 			document.form1.submit();
 		});
	</script>

	<style>
		div{
			padding-top: 5px;
			padding-bottom: 5px;
		}
	</style>
	
	<!-- 날짜 계산 -->
	<script type="text/javascript">
		$(document).ready (function(){
			$('#startDay').mouseleave(function(){
				var startDay = $('#startDay').val();
			});
			
			$('#arrivalDay').mouseleave(function(){
				var startDay = $('#startDay').val();
				var arrivalDay = $('#arrivalDay').val();
				
				var startArr = startDay.split('-');
				var arrivalArr = arrivalDay.split('-');
				
				var startDate = new Date(startArr[0],startArr[1]-1,startArr[2]);	// Date(년, 월, 일)
				var arrivalDate = new Date(arrivalArr[0],arrivalArr[1]-1,arrivalArr[2]);
				
				// 날짜 차이 구하기
				var diff = arrivalDate - startDate;
				var currDay = 24 * 60 * 60 * 1000;	// 단위환산(시*분*초*밀리세컨)
				var days = parseInt((diff/currDay)+1);
				
				// 날짜 표현하기
				$('.days').text("회원님의 여행기간은 "+days+" 일 입니다.");
				
				// 여행 플랜 테이블 생성하기
				for(var i=1; i<=days; i++){
					$('.scheduleTable').append(
						'<h3>'+i+'일차</h3>'+
						'<div class="schedule">'+
						'<input type="text" name="schedule'+i+'" size="30"> <input type="button" class="btnAdd" value="+"> <br>'+
						'</div>'+
						'<br>'		
					);
				};
			});
		});
	</script>
	
	<!-- 스케줄 추가 및 제거 -->
	<script type="text/javascript">
		$(document).ready (function(){
			$('.btnAdd').click (function(){
				$('.schedule').append(		// 스케줄 추가
					'<input type="text" name="schedule" size="30"> <input type="button" class="btnRemove" value="-"> <br>'
				);
				$('.btnRemove').on('click', function(){
					$(this).prev().remove (); // schedule input 태그 삭제
	                $(this).next ().remove (); // <br> 삭제
	                $(this).remove (); // 버튼 삭제
				});
			});
		});
	</script>
	
</head>
<body>

<form id="form1" name="form1" method="post" action="/kanbu/insert.com">
	<div>
		<input name="title" id="title" size="80" placeholder="여행 제목을 입력하세요">
	</div>
	<div>
		<input type="date" name="startDay" id="startDay" required="required"/>
		~
		<input type="date" name="arrivalDay" id="arrivalDay" required="required"/>
		<p id="days" class="days"></p>
	</div>
	
	<hr>

	<div class="scheduleTable">
		<div class="schedule">
			<input type="button" class="btnAdd" value="+"> <br>
		</div>
		<br>
	</div>

	<hr>

	<div> 
		<h3>🚗 이동수단</h3>
		이동수단을 선택해주세요. <br>
		<select size="1" name="traffic">
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
		<input type="text" name="expense" size="10"> 만원
	</div>

	
	<div>
		<input type="submit" name="btnSave" value="저장하기">
		<input type="button" name="btnList" value="목록보기"
			onclick="location.href='list.com'">
	</div>
	</form>
</body>
</html>