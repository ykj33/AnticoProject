<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@ include file="../com/header.jsp" %>
<script defer="defer" src="/resources/js/member.js"></script>
</head>
<body>
	<%@ include file="../com/top.jsp" %>
	<%@ include file="../com/title.jsp"%>
	회원가입페이지
	<form action="/member/insert" method="post">
		<input type="text" id="mid" name="mid">
		<div class="form-group">
			<label for="email">Email address:</label> <input type="email" class="form-control" id="email" name="email">
		</div>
		<div class="form-group">
			<label for="mpw">Password:</label> <input type="password" class="form-control" id="mpw" name="mpw">
		</div>
		<div class="form-group">
			<label for="mpw_re">Password:</label> <input type="password" class="form-control" id="mpw_re">
		</div>
		<button type="submit" class="btn btn-default">Submit</button>
	</form>
</body>
</html>