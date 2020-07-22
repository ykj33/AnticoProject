<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>

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
	<nav class="navbar navbar-default navbar-expand-md">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">동동이</a>
			</div>
			<ul class="nav navbar-nav">
				<!-- <li class="active"><a href="l_select.sdj">메인</a></li> -->

			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/antico/login"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>

				<c:if test="${empty login}">
					<li><a href="/antico/login"> <span
							class="glyphicon glyphicon-log-in"></span> Login
					</a></li>
				</c:if>

				<c:if test="${not empty login}">
					<li><a href="/antico/login"> <span
							class="glyphicon glyphicon-log-out"></span> Logout
					</a></li>
				</c:if>

			</ul>
		</div>
	</nav>
	<div class="jumbotron text-center">
		<h1>안티코</h1>
	</div>
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="#">페이지 1</a></li>
			<li><a href="#">페이지 2</a></li>
			<li><a href="#">페이지 3</a></li>
			<li><a href="#">페이지 4</a></li>
		</ul>

		<div class="row">
			<div class="col-xs-6">ddd</div>
			<div class="col-xs-6">ddd</div>
		</div>
	</div>
	<hr>
	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>


</body>
</html>