<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>이쁜이들 마스크</title>
<%@ include file="../com/header.jsp"%>
<script>
	//html이 DOM에 loading되면 이 이벤트 실행
document.addEventListener("DOMContentLoaded",function () {
// js에서 이용하기위해 html에서 btnCollapse 불러옴
let btnCollapse= document.getElementById('btnCollapse');
let hide=document.getElementById('hide');

// 구매버튼에 click이벤트가 발생하면 아래와 같이 실행한다!
btnCollapse.addEventListener("click",()=>{
	// 최상단으로 이동한다.좌표가 x = 0, y =0 으로 이동해라.
	window.scrollTo(0,0);
	// 부트스트랩 명령이다. // 클래스 명이 .collapse(즉 나타나고 사라지는 애)한테 나타나라고 명령한다.
	$('.collapse').collapse('show');
	
});
//X버튼에 클릭이벤트가 발생하면 아래와 같이 실행한다.
hide.addEventListener("click",()=>{
	//부트스르랩 명령이다. 클래스명이.collapse 엘러멘트 안에 내용을 감춘다.
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
				<path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z"/>
				<path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z"/>
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
			<div class="col-md-1"><img src="https://platum.kr/wp-content/uploads/2020/04/eye.jpg" width="60px" height="60px"></div>
			<div class="col-md-5">이쁜이들은 어떤 마스크를 쓸까?</div>
			<div class="col-md-1">free</div>
			<div class="col-md-1">blue</div>
			<div class="col-md-2"><button type="button" class="btn">-</button>1<button type="button" class="btn">+</button></div>
			<div class="col-md-2">15,900</div>
		</div>

		<hr>
	  </div>
	
</div>
	<!--유지보수 하기 쉽게 파일 불러서 사용  -->
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/title.jsp"%>

	<div class="container">
		<%@ include file="../com/navbar.jsp"%>
		<!--이미지를 주소를 따서 받아온다  -->
		<img alt="마스크상세정보이미지" src="https://platum.kr/wp-content/uploads/2020/04/eye.jpg" width="100%">
		<!--클래스 추가 (글자색)  mt(마진)-->
		<h3 class="text-muted mt-4">이쁜이들은 어떤 마스크를 쓸까?</h3>
		<p class="text-muted mt-4">베이징에 거주하는 첸자신(27)은 최근 타오바오에서 아이섀도 팔레트만 6개를 구입했다. 코로나19 이후 재택근무와 외출자재 분위기로 행동반경이 제한되었지만, 첸은 인근 슈퍼마켓이나 산책 삼아 근처 공원에 갈 때 화장을 한다.그는 “간간이 집 밖으로 나갈
			때 기분전환 삼아 아이섀도우의 색깔을 바꾼다. 마스크를 쓰고 다녀야 하기에 눈만 신경쓰면 된다. 구매는 할인폭이 넓은 이커머스를 통해 진행했다”고 말한다.소셜네트워크 영향으로 중국 소비자들의 메이크업 활용은 이전보다 더욱 전문적이고 정교해졌으며 보우 화장품
			가짓수도 증가했다. 과거 화장대의 중심에는 색조화장품이 있었다. 다수의 화장품 기업 발표에 따르면, 현재 중국 소비자들은 평균 11가지 색조 메이크업 제품을 소유하고 있는 것으로 나타났다. 하지만 올해는 이런 추세와는 다르게 가고 있다.</p>
		
		<p>15,900</p>
		<button type="button" class="btn btn-outline-dark rounded-0 btn-lg btn-block" id="btnCollapse">구매</button>
		<%@ include file="../com/footer.jsp" %>
	</div>
</body>
</html>