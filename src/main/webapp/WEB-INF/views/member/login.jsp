<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@ include file="../com/header.jsp"%>
<script defer="defer" src="/resources/js/member.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
 .navbar {
	margin-bottom: 0;
	border-radius: 0;
	background-color: #ffffff;
}

.jumbotron {
	padding: 30px;
	font-size: 15px;
	text-align: center;
	background-color: #ffffff;
	opacity: 1;
}

.breadcrumb {
	font-size: 15px;
	text-align: center;
	background-color: #ffffff;
}

.footer {
	background-color: #f2f2f2;
	padding: 25px;
}


</style>



</head>
<body>

	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/title.jsp"%>
	<div class="container">
		<%@ include file="../com/navbar.jsp" %>
		<div class="row">

			<div class="col-sm-6 mt-4">
				<h3>&nbsp;&nbsp;LOGIN</h3><br>

				<form action="/#">
					<div class="form-group col-sm-10">
						<input type="text" class="form-control" id="email2" placeholder="Enter email" name="email"><br> <input type="password"
							class="form-control" id="password" placeholder="Enter password" name="password"><br> <label><input type="checkbox"
							name="remember">아이디 기억하기</label><br>

						<button type="submit" class="btn btn-default">로그인</button>
					</div>
				</form>
			</div>

			<div class="col-sm-6 mt-4">
				<h3>&nbsp;&nbsp;CREATE ACCOUNT</h3><br>

				<form action="/member/insert" method="post">
					<div class="form-group col-sm-10">
						<input type="hidden" id="mid" name="mid">
						<div class="form-group">
							<input type="email" class="form-control" id="email" placeholder="이메일을 입력하세요" name="email"><br> 
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="mpw" placeholder="비밀번호를 입력하세요" name="mpw"><br> 
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="mpw_re" placeholder="비밀번호를 한번 더 입력하세요" name="mpw_re"><br> 
						</div>
						
						<label><input type="checkbox" name="remember">회원 가입 및 약관 동의를 읽어봅시다</label><br>

						<button type="submit" class="btn btn-default">가입 완료</button>
					</div>
				</form>
			</div>


		</div>
	</div>
	
	<br><br><br>
	<%@ include file="../com/footer.jsp"%>
</body>
</html>