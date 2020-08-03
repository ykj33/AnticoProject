<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script>
document.addEventListener('DOMContentLoaded', () => {
	
	let btnCart = document.getElementById('btnCart');
	
	// 장바구니 버튼 클릭시.
	btnCart.addEventListener('click', (evnet) => {
		cartShow();
	});
});
</script>

<div class="clearfix text-secondary">
	<span class="float-left">
		<span class="btn text-secondary" id="btnCart">장바구니</span>
		
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


