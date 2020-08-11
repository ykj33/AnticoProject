<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="kr.co.domain.BoardDTO"%>
<%@page import="java.util.List"%>
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

	<%
  List<BoardDTO> list=(List<BoardDTO>)request.getAttribute("list");
 
  ObjectMapper mapper=new ObjectMapper();

  String list2=mapper.writeValueAsString(list);

  pageContext.setAttribute("list2", list2);


  %>
	<div class="container">
		<%@ include file="../com/navbar.jsp"%>
		<div class="row">
			<div class="col-md-1"></div>
			<!-- 1열 -->
			<c:forEach items="${list }" var="dto" begin="0" end="1">
				<div class="col-md-5">
					<a href="/board/read/${dto.goods_no}"> 
								<div><img id="main"
									src='/displayfile?goods_no=${dto.goods_no}&&img_name=${dto.goods_img}'
									width="100%" height="100%" margin="auto" /></div>
									
									
						<div>
							<h5>[${dto.goods_no }] ${dto.goods_nm }</h5>
						</div> 
					</a>
				</div>
			</c:forEach>
				<div class="col-md-1"></div>
				</div>
				<br><br><br><br>
			<!-- 2열 -->
			<div class="row">
			<div class="col-md-1"></div>
			<c:forEach items="${list }" var="dto" begin="2" end="3">
				<div class="col-md-5">
					<a href="/board/read/${dto.goods_no}"> 
								<div><img id="main"
									src='/displayfile?goods_no=${dto.goods_no}&&img_name=${dto.goods_img}'
									width="100%" height="100%" margin="auto" /></div>
						<div>
							<h5>[${dto.goods_no }] ${dto.goods_nm }</h5>
						</div> 
					</a>
				</div>
			</c:forEach>
				<div class="col-md-1"></div>
		</div>
		<br><br><br><br>
		<%@ include file="../com/footer.jsp"%>
	</div>

<script type="text/javascript">

$(document).ready(function(){
	var data = <c:out value="${list2}" escapeXml="false"/>;
	var tar = 4;	
$(window).scroll(function(){
	if($(window).scrollTop() > $(document).height() - $(window).height()-100){
		if(tar <8){
		
				var list = '<div class="row">'
					+	'<div class="col-md-1"></div>';
					for(var i=tar;i<tar+2;i++){
						var no = data[i].goods_no;
						var img = data[i].goods_img;
						var nm = data[i].goods_nm;
						 list += '<div class="col-md-5">'
							 	+	'<a href="/board/read/'+no+'">'
								+	'<div>'
								+		'<img id="main"src="/displayfile?img_name='+img
								+		'" width="100%" height="100%" margin="auto" /></div>'
								+	'<div>'
								+		'<h5>['+no+'] '+nm+'</h5>'
								+	'</div>'
								+'</a>'
								+'</div>'

						}
					list += 	'<div class="col-md-1"></div>'
							+	'</div><br><br><br><br>';
					$("#back-to-top").before(list);
					tar +=2;
					
		}
	
				
		}
});
});
</script>
	
</body>
</html>