<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
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

.footer {
	background-color: #f2f2f2;
	padding: 25px;
}

</style>

<%@ include file="../com/header.jsp"%>
</head>
<body>

	<%@ include file="../com/top.jsp"%>
	
	<div>
		<%@ include file="../com/navbar.jsp"%>
	</div>
	
	
	
	
	
	

	<%@ include file="../com/footer.jsp"%>
</body>
</html>