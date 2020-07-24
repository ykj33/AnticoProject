<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<%@ include file="../com/header.jsp"%>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script defer="defer" src="/resources/js/member.js"></script>
</head>
<body>
	<%@ include file="../com/top.jsp"%>
	<div class="container mb-5">
		<%@ include file="../com/title.jsp"%>
		<%@ include file="../com/navbar.jsp"%>
		<div class="row">

			<div class="col-md-5 mt-4 ml-4 mr-4 text-dark">
				<h3>기존고객</h3>
				<form class="mt-4 text-muted" action="/member/login" method="post" name="memberLoginForm" onsubmit="return validateMemberLoginForm()">
						<input type="hidden" class="form-control rounded-0" id="inputMid" name="mid">
					<div class="form-group">
						<input type="email" class="form-control rounded-0" id="inputEmail" name="email" placeholder="이메일을 입력해주세요.">
					</div>
					<div class="form-group">
						<input type="password" class="form-control rounded-0" id="inputPassword" name="mpw" placeholder="패스워드를 입력해주세요.">
					</div>
					<div class="form-check text-left">
						<input type="checkbox" class="form-check-input" id="RemembeMeCheck"> <label class="form-check-label" for="RemembeMeCheck">로그인 유지</label>
					</div>
					<div class="text-left mt-2">
						<button type="submit" value="Submit" class="btn btn-outline-dark rounded-0">로그인</button>
					</div>
				</form>
			</div>

			<div class="col-md-5 mt-4 ml-4 mr-4 text-dark">
				<h3>신규고객</h3>
				<p class="mt-4 text-muted">매장에서 계정을 만들면 결제 과정을 더 빠르게 진행하고 여러 배송 주소를 저장하며 계정에서 주문을보고 추적 할 수 있습니다.</p>
				<button class="btn btn-outline-dark rounded-0" onclick="location.href='/member/insert'">회원가입페이지</button>
			</div>

		</div>
	</div>
	<%@ include file="../com/footer.jsp"%>
</body>
</html>