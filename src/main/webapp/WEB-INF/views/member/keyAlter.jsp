<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증확인</title>
<%@ include file="../com/header.jsp" %>
</head>
<body>
<%@ include file="../com/top.jsp" %>
<%@ include file="../com/title.jsp" %>
<%@ include file="../com/navbar.jsp" %>
<div class="container mt-5 mb-5 text-center">
	<c:if test="${msg eq 'fail' }">
		<h1>인증에 실패했습니다.</h1>
		<p>관리자에게 antico19test@gmail.com로 문의 부탁드립니다.</p>
	</c:if>
	<c:if test="${msg eq 'success' }">
		<h1>환영합니다.</h1>
		<p>안녕하세요  ${dto.email }님 저희 사이트에 가입해주셔서 감사합니다.</p><br>
		<p>지금 부터 로그인후 모든 서비스를 이용하실수 있습니다.</p><br>
		<a href="/member/login" class="btn btn-outline-dark rounded-0">로그인 페이지 이동</a>
	</c:if>
	
</div>
<%@ include file="../com/footer.jsp" %>
</body>
</html>