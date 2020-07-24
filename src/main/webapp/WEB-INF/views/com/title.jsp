<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%-- 
<div id="tab">
<nav class="navbar navbar-expand-sm bg-white navbar-light">
  
	  <ul class="nav navbar-nav">
					
			<li class="nav-item active">
				<a class="nav-link disabled">Antico</a>
			</li>
					
			<li class="tab_signup">
				<a href="/antico/login">
				<span class="glyphicon glyphicon-user"></span> Sign Up </a>
									
			</li>
	
				
			<li class="tab_login">
				<c:if test="${empty login}">
					<a href="/antico/login">Login</a>
				</c:if>
			</li>
					
			<li class="tab_logout">
				<c:if test="${not empty login}">
					<a href="/antico/login">Logout</a>
				</c:if>
			</li>
	
	
		</ul>
	  
	</nav>

</div> --%>

<!-- <div class="row">
	<div class="col-6 text-left">
		<a class="btn" style="color:#999;">장바구니</a>
	</div>
	<div class="col-6 text-right">
		<a class="btn" style="color:#999;">로그인</a><a class="btn" style="color:#999;">회원가입</a>
	</div>
</div> -->

<div class="jumbotron text-center">
	<h1>Antico</h1>
</div>
