<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Antico</title>
<%@ include file="../com/header.jsp"%>
</head>
<body>
	<!--유지보수 하기 쉽게 파일 불러서 사용  -->
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/title.jsp"%>

	<div class="container">
		<%@ include file="../com/navbar.jsp"%>
		<div class="row">
			<c:forEach items="${list }" var="dto" begin="0" end="1">
				<div class="col-md-6">
					<a href="/board/read/${dto.goods_no}"> <img
						src="http://i.011st.com/ex_t/R/400x400/1/85/0/src/pd/20/5/8/1/6/9/6/YpwuC/2941581696_B.jpg"
						width="100%" margin="auto"> <%-- <img src="${dto.goods_img }"> --%>
						<div>
							<h5>${dto.goods_no }${dto.goods_nm }</h5>
						</div> <c:forEach items="${board }" var="option">
							<c:if test="${dto.goods_no == option.goods_no  }">
								${option.goods_color }
							</c:if>
						</c:forEach> 
						
						<c:forEach items="${optionByNo }" var="option" begin="0" end="0">
							<c:if test="${dto.goods_no == option.goods_no  }">
								<div style="float: right">${option.goods_untpc}원</div>
							</c:if>
						</c:forEach>
					</a>
				</div>
			</c:forEach>



			<c:forEach items="${list }" var="dto" begin="2" end="3">
				<div class="col-md-6">
					<a href="/board/read/${dto.goods_no}"> <img
						src="http://i.011st.com/ex_t/R/400x400/1/85/0/src/pd/20/5/8/1/6/9/6/YpwuC/2941581696_B.jpg"
						width="100%" margin="auto"> <%-- <img src="${dto.goods_img }"> --%>
						<div>
							<h5>${dto.goods_no }${dto.goods_nm }</h5>
						</div> <c:forEach items="${optionByNo }" var="option">
							<c:if test="${dto.goods_no == option.goods_no  }">

								<div style="float: right">${option.goods_untpc}원</div>
							</c:if>
						</c:forEach>
					</a>
				</div>
			</c:forEach>
		</div>
		<%@ include file="../com/footer.jsp"%>
	</div>
</body>
</html>