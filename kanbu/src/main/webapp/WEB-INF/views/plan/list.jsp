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

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


</head>
<body>
	<div>
		<button type="button" id="btnWrite" onclick="location.href='/kanbu/write.com'">일정생성</button>
	</div>

<hr>

<div class="container">
	<c:if test="${count > 0}">
	${count}개의 게시물이 있습니다.
		<table>
			<tr>
				<th>No</th>
				<th>작성일</th>
				<th>제목</th>
				<th>&nbsp</th>
			</tr>
			
			<c:forEach var="myPlan" items="${myPlanList}">
				<tr>
					<td align="center">
						${myPlan.index_num}
						<input type="hidden" name=myPlanNum id=myPlanNum value="${myPlan.index_num}" />
					</td>
					<td align="center">
						<fmt:formatDate value="${myPlan.reg_date}" pattern="yyyy-MM-dd"/> 
					</td>
					<td align="center">
						<a href="/kanbu/detail.com?index_num=${myPlan.index_num}">${myPlan.title}</a></td>
					<td align="center"><button type="button" id="btnDelete" onclick="delMyPlan();">삭제</button></td>
					<td align="center"><button type="button" id="btnUpdate" value="${myPlan.index_num}"
						onclick="location.href='/kanbu/update.com?index_num=${myPlan.index_num}'">수정</button></td>
				</tr>
			</c:forEach>	
		</table>
	</c:if>
		
	<c:if test="${count == 0}">
		해당 목록이 없습니다.
	</c:if>	
	
</div>


<script type="text/javascript">
	function delMyPlan(){
		var index_num = document.getElementById("myPlanNum").value;
		if(confirm("정말 삭제하시겠습니까?")){
			location.replace("/kanbu/delete.com?index_num="+index_num);
 		}else{
 			return false;
		}
	}
</script>


<script>	
	function list(page){
		location.href="${path}/plan/list.com?curPage=" + page
				+ "&search_option=${map.search_option}"
				+ "&keyword=${map.keyoword}";
	}
</script>

</body>
</html>