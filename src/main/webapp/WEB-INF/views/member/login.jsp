<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<%@ include file="../com/header.jsp"%>
<script defer="defer" src="/resources/js/member.js"></script>
<body>

	<%@ include file="../com/top.jsp"%>
	<div class="container">
		<%@ include file="../com/title.jsp" %>
		<%@ include file="../com/navbar.jsp"%>
		<div class="row">
			<div class="col-sm-6 mt-4">
				<h3>기존고객</h3>
				<br>
				<form>
					<div class="form-group">
						<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="이메일을 입력해주세요."> 
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="email" placeholder="패스워드를 입력해주세요.">
					</div>
					<div class="form-check text-left">
						<input type="checkbox" class="form-check-input" id="exampleCheck1"> 
						<label class="form-check-label" for="exampleCheck1">로그인 유지</label>
					</div>
					<div class="text-left">
						<button type="submit" class="btn btn-primary">로그인</button>
					</div>
				</form>
			</div>


			<div class="col-sm-6 mt-4">
				<h3>신규고객</h3><br>
					<div class="form-group col-sm-10">
					<p>매장에서 계정을 만들면 결제 과정을 더 빠르게 진행하고 여러 배송 주소를 저장하며 계정에서 주문을보고 추적 할 수 있습니다.</p>
					<a type="submit" class="btn">회원가입페이지</a>
					</div>
			</div>


		</div>
	</div>

	<br>
	<br>
	<br>
	<%@ include file="../com/footer.jsp"%>
</body>
</html>