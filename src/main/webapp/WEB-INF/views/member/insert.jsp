<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@ include file="../com/header.jsp"%>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script defer="defer" src="/resources/js/member.js"></script>
</head>
<body>
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/title.jsp"%>
	<div class="container text-center text-dark">
		<h3>회원가입</h3>
		<form class="mt-4 text-muted" action="/member/insert" name="memberInserForm" onsubmit="return validateMemberInserForm()">
			<input type="hidden" class="form-control rounded-0" id="inputMid" name="mid">
			<div class="form-group">
				<input type="email" class="form-control rounded-0" id="inputEmail" name="email" placeholder="이메일을 입력해주세요.">
			</div>
			<div class="form-group">
				<input type="password" class="form-control rounded-0" id="inputPassword" name="mpw" placeholder="패스워드를 입력해주세요.">
			</div>
			<div class="form-group">
				<input type="password" class="form-control rounded-0" id="inputRePassword" name="reMpw" placeholder="패스워드를 다시 한번 더 입력해주세요.">
			</div>
			<div class="form-check text-left">
				<input type="checkbox" class="form-check-input" id="termsCheck" > <label class="form-check-label" for="termsCheck">이용약관에 동의합니다.</label>
			</div>
			<div class="text-left mt-2">
				<button type="submit" value="Submit" class="btn btn-outline-dark rounded-0">회원가입</button>
			</div>
		</form>
	</div>
</body>
</html>