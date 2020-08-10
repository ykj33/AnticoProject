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
</head>
<body>
	<%@ include file="../com/top.jsp" %>
	<%@ include file="../com/title.jsp"%>
	<div>
		<%@ include file="../com/navbar.jsp"%>
	</div>
	
	<div class="container mb-5">

		<div class="row">

			<div class="col-md-5 mt-4 ml-4 mr-4 text-dark">
				<h3>비밀번호 수정</h3>
				<form class="mt-4 text-muted" action="/member/update" method="post" name="memberLoginForm">
					<div class="form-group">
						<input type="email" class="form-control rounded-0" value="${login.email }"
							id="inputEmail" name="email" readonly>
					</div>
					<div class="form-group">
						<input type="password" class="form-control rounded-0" 
							id="inputPassword" name="mpw" placeholder="패스워드를 입력해주세요.">
					</div>
		
					<div class="text-left mt-2">
						<button type="submit" value="Submit"
							class="btn btn-outline-dark rounded-0">완료</button>
					</div>
				</form>
			</div>
		</div>
	</div>


<%@ include file="../com/footer.jsp" %>
</body>
</html>