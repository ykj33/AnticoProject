<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<%@ include file="../com/header.jsp" %>
	
	<script>

	function deleteMember(){
		var isOk = confirm("정말 삭제하시겠습니까?");
		if(isOk){
			location.href="/member/delete";
		}
	}

	
		
	</script>
	
</head>
<body>
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/title.jsp"%>
	<div>
		<%@ include file="../com/navbar.jsp"%>
	</div>



	<div class="container mb-5">

		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 mt-4 ml-4 mr-4 text-dark">
				<h3>비밀번호 보기</h3>
				<form class="mt-4 text-muted" method="post" name="memberLoginForm">
					<div class="form-group">
						<input type="email" class="form-control rounded-0" value="${dto.email }"
							name="email" readonly>
					</div>
					<div class="form-group">
						<input class="form-control rounded-0"  value="${dto.mpw }"
							name="mpw" readonly>
					</div>
				</form>
					<div class="text-left mt-2">
						<button value="Submit"
							class="btn btn-outline-dark rounded-0" onclick="location.href='/member/update/${dto.email}'">수정</button>
						<button value="Submit"
							class="btn btn-outline-dark rounded-0" onclick="deleteMember()">삭제</button>
					</div>

					
				
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
	
</body>
</html>