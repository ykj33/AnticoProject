<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<%@ include file="../com/header.jsp" %>
	
	<script>
		function del(seq) {
			var chk = confirm("정말 삭제하시겠습니까?");
			if (chk) {
				location.href='delete?seq='+seq;
			}
		}	
	</script>
	
</head>
<body>
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/title.jsp"%>
	<div>
		<%@ include file="../com/navbar.jsp"%>
	</div>
	
	E-Mail : ${dto.email}<br>
	PassWord : ${dto.mpw}<br>
			
	<a href="/member/update/${dto.email}">수정</a> | <a href="/member/delete/${dto.email}">삭제</a>

	
</body>
</html>