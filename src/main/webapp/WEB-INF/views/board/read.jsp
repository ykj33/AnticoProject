<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>이쁜이들 마스크</title>
<%@ include file="../com/header.jsp"%>
<script>
document.addEventListener("DOMContentLoaded", () => {
	let btnCollapse= document.getElementById('btnCollapse');
	let hide=document.getElementById('hide');
	
	btnCollapse.addEventListener("click",()=> {
		window.scrollTo(0,0);
		$('.collapse').collapse('show');
	});
	
	hide.addEventListener("click",()=> {
		$('.collapse').collapse('hide');
	});
});
</script>
</head>

<body>
	<div class="clearfix text-secondary">
		<div class="collapse" id="collapseExample">
			<div class="text-right text-primary mr-2">
				<svg id="hide" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				<path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z" />
				<path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z" />
			</svg>
			</div>
			<div class="row ml-4">
				<div class="col-md-1">이미지</div>
				<div class="col-md-5">타이틀</div>
				<div class="col-md-1">사이즈</div>
				<div class="col-md-1">색상</div>
				<div class="col-md-2">수량</div>
				<div class="col-md-2">가격</div>
			</div>

			<div class="row ml-4">
				<%-- 			<div class="col-md-1"><img src="${uploadPath + read.goods_img}" width="60px" height="60px"></div> --%>



				<div class="col-md-5">이쁜이들은 어떤 마스크를 쓸까?</div>
				<div class="col-md-1">free</div>
				<div class="col-md-1">blue</div>
				<div class="col-md-2">
					<button type="button" class="btn">-</button>
					1
					<button type="button" class="btn">+</button>
				</div>
				<div class="col-md-2">15,900</div>

			</div>

			<hr>
		</div>
	</div>
	
	<!--장바구니, 로그인 | 회원가입   -->
	<%@ include file="../com/top.jsp"%>
	<!--타이틀(홈 링크)   -->
	<%@ include file="../com/title.jsp"%>

	<div class="container">
		<%@ include file="../com/navbar.jsp"%>
		<img id="main" src="/displayfile?img_name=${dto.goods_info_img}" width="100%" />
		
		<h3 class="text-muted mt-4">${dto.goods_nm}</h3>
		
		<div class="row">
			<div class="col-md-8">
				<pre class="text-muted mt-4">${dto.goods_info_text }</pre>
			</div>
			<div class="col-md-4 mt-4 text-dark">
				<!-- 옵션 color  -->
				<div class="row">
					<div class="col-md-2"><p class="btn btn-sm"><strong>White</strong></p></div>
					<div class="col-md-2"><p class="btn btn-sm">Black</p></div>
				</div>
		
				<!-- 옵션 size  -->
				<div class="row">
					<div class="col-md-2"><p class="btn btn-sm">L</p></div>
					<div class="col-md-2"><p class="btn btn-sm"><strong>S</strong></p></div>
				</div>
			
				<!-- 옵션 color와 size에 따른 가격  -->
				<div class="row">
					<div class="col-md-6 ml-2 mt-5"><h3><strong>5000</strong>원</h3></div>
				</div>
				
			</div>
		</div>
		<button type="button" class="btn btn-outline-dark rounded-0 btn-lg btn-block mt-5 mb-5" id="btnCollapse">구매</button>
		<%@ include file="../com/footer.jsp"%>
	</div>
</body>
</html>