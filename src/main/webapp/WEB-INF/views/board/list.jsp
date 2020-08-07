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
	<%@ include file="../com/cart.jsp" %>
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/title.jsp"%>

	<div class="container">
		<%@ include file="../com/navbar.jsp"%>
		<div class="row">
			<div class="col-md-1"></div>
			<!-- 1열 -->
			<c:forEach items="${list }" var="dto" begin="0" end="1">
				<div class="col-md-5">
					<a href="/board/read/${dto.goods_no}"> <%-- <c:forEach
							items="${forImg }" var="img">
							<c:if test="${dto.goods_no == img.goods_no  }"> --%>
								<img id="main"
									src='/displayfile?goods_no=${dto.goods_no}&&img_name=${dto.goods_img}'
									width="100%" height="70%" margin="auto" />
						<%-- 	</c:if>
						</c:forEach> --%>
						<div>
							<h5>[${dto.goods_no }] ${dto.goods_nm }</h5>
						</div> <%-- <c:forEach items="${board }" var="option">
							<c:if test="${dto.goods_no == option.goods_no  }">
								${option.goods_color }
							</c:if> 
						<%-- </c:forEach> <c:forEach items="${optionByNo }" var="option"
							begin="0" end="1"> --%>
							<%-- <c:if test="${dto.goods_no == option.goods_no  }"> --%>
								<%-- <div style="float: right">${dto.goods_untpc}원</div> --%>
							<%-- </c:if> --%>
						<%-- </c:forEach> --%>
					</a>
				</div>
			</c:forEach>
				<div class="col-md-1"></div>
			<!-- 2열 -->
			<div class="col-md-1"></div>
			<c:forEach items="${list }" var="dto" begin="2" end="3">
				<div class="col-md-5">
					<a href="/board/read/${dto.goods_no}"> <%-- <c:forEach
							items="${forImg }" var="img">
							<c:if test="${dto.goods_no == img.goods_no  }"> --%>
								<img id="main"
									src='/displayfile?goods_no=${dto.goods_no}&&img_name=${dto.goods_img}'
									width="100%" height="70%" margin="auto" />
						<%-- 	</c:if>
						</c:forEach> --%>
						<div>
							<h5>[${dto.goods_no }] ${dto.goods_nm }</h5>
						</div> <%-- <c:forEach items="${board }" var="option">
							<c:if test="${dto.goods_no == option.goods_no  }">
								${option.goods_color }
							</c:if> 
						<%-- </c:forEach> <c:forEach items="${optionByNo }" var="option"
							begin="0" end="1"> --%>
							<%-- <c:if test="${dto.goods_no == option.goods_no  }"> --%>
								<%-- <div style="float: right">${dto.goods_untpc}원</div> --%>
							<%-- </c:if> --%>
						<%-- </c:forEach> --%>
					</a>
				</div>
			</c:forEach>
				<div class="col-md-1"></div>
		</div>
		<%@ include file="../com/footer.jsp"%>
	</div>
</body>
</html>