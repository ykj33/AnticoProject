<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/title.jsp"%>

	<div class="container">
		<%@ include file="../com/navbar.jsp"%>
		
		
		<table class="table table-striped">
		
		<tbody>
		<c:forEach items="${list}" var="dto">		
		<tr>
		<td class="email">${dto.email }</td>
		<td>${dto.key }</td>
		<td>${dto.subscribe_date }</td>
		<td><button class="btn btn-danger delete_btn" id="${dto.email }">삭제</button></td>
		</tr>
		</c:forEach>
		
		
		</tbody>
		
		
		</table>
		
		
	
	</div>

<script type="text/javascript">
$(document).ready(function(){

	$(document).on("click", ".delete_btn", function(){
		that = $(this);
		var email = that.attr("id");
		console.log(email);
		$.ajax({
			type:'post',
			url:'memberdelete',
			data:{
				email:email
			},
			success:function(result){
				location.reload();
				},
			error:function(request, status, error){
				console.log(error);
				}
			
			
			});

		
		});
	
});

</script>
</body>
</html>