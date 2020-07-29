<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="clearfix text-secondary">
	<span class="float-left">
		<a href="#" class="btn">장바구니</a>
		
	</span>
	<span class="float-right">
	
		<c:if test="${empty login.email}">
			<span><a href="/member/login" class="btn"> 로그인 </a></span>
		</c:if>
	
		<c:if test="${not empty login.email}">
			<span><a href="/member/logout" class="btn"> 로그아웃 </a></span>
		</c:if>

		<a href="/member/insert" class="btn">회원가입</a>
	
	</span>
</div>


