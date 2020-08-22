<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script>
document.addEventListener('DOMContentLoaded', () => {
	
	const btnCart = document.querySelector('#btnCart');
	const btnLogin = document.querySelector('#btnLogin');
	const btnMypage = document.querySelector('#btnMypage');
	const btnLogout = document.querySelector('#btnLogout');
	const url = document.location.href;
	
	// 장바구니 버튼 클릭시.
	btnCart.addEventListener('click', (evnet) => {
		if(isLogin()){
			ajaxGetCartList()
		}
		cartShow();
	});

});
</script>

<div class="clearfix" id="top">
	<span class="float-left">
		<a class="btn text-secondary shadow-none" id="btnCart">장바구니</a>
		
	</span>
	<span class="float-right">
		
		<c:if test="${empty login.email}">
			<a href="/member/login" class="btn text-secondary shadow-none" id="btnLogin"> 로그인 </a>
		</c:if>
	
		<c:if test="${not empty login.email}">
			<a href="/mypage" class="btn text-secondary shadow-none" id="btnMypage">마이페이지</a>
			<a href="/member/logout" class="btn text-secondary shadow-none" id="btnLogout"> 로그아웃 </a>
		</c:if>

		<c:if test="${empty login.email}">
			<a href="/member/insert" class="btn text-secondary shadow-none">회원가입</a>
		</c:if>

		<c:if test="${not empty login.email}">
			<a href="/member/update/login.email" class="btn text-secondary shadow-none">회원정보수정</a>
		</c:if>
	</span>
</div>


