<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>

<style type="text/css">
.status_val {
	font-size: 45px;
}

.basket_name {
	font-size: 1.5rem;
	text-overflow:ellipsis;
	height: 4rem;
}

tr td {
	margin: auto;
}

.del_menu {
	height: 2rem;
}


</style>
</head>
<body>

	<%@ include file="../com/header.jsp"%>
	<%@ include file="../com/top.jsp"%>
	<div id="antico_layout" class="container">
		<%@ include file="../com/title.jsp"%>
		<%@ include file="../com/navbar.jsp"%>
		<div id="mypage_head" class="text-center p-4">
			<h2 class="text-black-50">마이 쇼핑</h2>
		</div>
		<div id="delevery_status" class="row align-items-center  m-5">
			<div class="col-md-1"></div>
			<div class="col-md-2 status p-0 border-top border-bottom">
				<div class="border-right right-border">
					<div class="text-center m-3 del_menu">입금 전</div>
					<div class="text-center m-3 status_val" id="status_1"></div>
				</div>
			</div>
			<div class="col-md-2  status p-0 border-top border-bottom">
				<div class="border-right right-border">
					<div class="text-center m-3 del_menu">배송 준비중</div>
					<div class="text-center m-3 status_val" id="status_2"></div>
				</div>
			</div>
			<div class="col-md-2  status p-0 border-top border-bottom">
				<div class=" border-right right-border">
					<div class="text-center m-3 del_menu">배송 중</div>
					<div class="text-center m-3 status_val" id="status_3"></div>
				</div>
			</div>
			<div class="col-md-2  status p-0 border-top border-bottom">
				<div class="border-right right-border">
					<div class="text-center m-3 del_menu">배송 완료</div>
					<div class="text-center m-3 status_val" id="status_4"></div>
				</div>
			</div>

			<div class="col-md-2 status p-0 border-top border-bottom">
				<div>
					<div class="text-center m-3 del_menu">취소/교환/반품</div>
					<div class="text-center m-3 status_val" id="status_5"></div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>

		<div id="basket">
			<table class="table table-borderless m-4" style="table-layout: fixed;">
			<colgroup>
<col style="width:45%;">			
<col style="width:11%;">			
<col style="width:11%;">			
<col style="width:11%;">			
<col style="width:11%;">			
<col style="width:11%;">			
			
			
			</colgroup>
			
			
			
				<!-- <thead>
				<tr class="">
						<td id="colume_1"><div class="text-black-50">아이템</div></td>
						<td id="colume_2"><div class="text-black-50">사이즈</div></td>
						<td id="colume_3"><div class="text-black-50">색상</div></td>
						<td id="colume_4"><div class="text-black-50">수량</div></td>
						<td id="colume_5"><div class="text-black-50">가격</div></td>
						<td id="colume_6"><div class="text-black-50">배송비</div></td>
					</tr>
				</thead> -->




				<tbody>

					<tr class="align-middle text-center">
						<td class="d-flex " ><img alt=""
							src="/resources/image/show.png" class="m-2 float-left">
							<div class="basket_item_details position-relative flex-fill" style="width: 70%">
								<div class="basket_item basket_name text-left overflow-hidden">상품명 잘 되니 잘 되니 잘 되니 잘 되니 잘 되니 잘 되니 잘 되니 잘 되니 잘 되니 잘 되니 잘 되잘 되니 잘 되니 </div>
								<div class="position-absolute basket_item basket_date "
									style="bottom: 0;">2020-07-23</div>
								<div class="position-absolute basket_item basket_status repurchase"
									style="bottom: 0; right: 0;" >재구매</div>
							</div></td>
						<td class="align-middle"><div>검정, 대</div></td>

						<td class="align-middle"><div>1</div></td>
						<td class="item_price align-middle"><div>15,900 원</div></td>
						<td class="item_del_price align-middle"><div>3,000 원</div></td>
						<td class="align-middle "><div>배송 중</div>
							<button class="btn btn-outline-secondary rounded-0 item_location_search">위치 확인</button>
							<div>
								<button class="btn btn-outline-danger rounded-0" onclick="cancleitem($(this))">취소</button>
							</div></td>
					</tr>


					<tr class="align-middle text-center">
						<td class="d-flex "><img alt=""
							src="/resources/image/show.png" class="m-2 float-left">
							<div class="basket_item_details position-relative flex-fill " style="width: 70%">
								<div class="basket_item basket_name text-left overflow-hidden ">상품명 dddddddddddddddddddddddddddddddddd</div>
								<div class="position-absolute basket_item basket_date "
									style="bottom: 0;">2020-07-23</div>
								<div class="position-absolute basket_item basket_status repurchase"
									style="bottom: 0; right: 0;" >재구매</div>
							</div></td>
						<td class="align-middle"><div>검정, 대</div></td>

						<td class="align-middle"><div>1</div></td>
						<td class="item_price align-middle"><div>15,900 원</div></td>
						<td class="item_del_price align-middle"><div>3,000 원</div></td>
						<td class="align-middle "><div>배송 완료</div>
							<button class="btn btn-outline-secondary rounded-0 item_location_search">위치 확인</button>
							<div>
								<button class="btn btn-outline-danger rounded-0 " href="#"
									role="button" id="dropdownMenuLink" data-toggle="dropdown"
									aria-haspopup="true" > 교환/환불 </button>

								<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
									<a class="dropdown-item" href="#" onclick="exchangeitem($(this));">교환</a> 
									<a class="dropdown-item" href="#" onclick="refunditem($(this));">환불</a> 
								</div>
							</div>
							</td>
					</tr>




					<tr class="align-middle text-center">
						<td class="d-flex "><img alt=""
							src="/resources/image/show.png" class="m-2 float-left">
							<div class="basket_item_details position-relative flex-fill" style="width: 70%">
								<div class="basket_item basket_name text-left overflow-hidden">상품명</div>
								<div class="position-absolute basket_item basket_date "
									style="bottom: 0;">2020-07-23</div>
								<div class="position-absolute basket_item basket_status repurchase"
									style="bottom: 0; right: 0;">재구매</div>
							</div></td>
						<td class="align-middle"><div>검정, 중</div></td>

						<td class="align-middle"><div>1</div></td>
						<td class="item_price align-middle"><div>15,900 원</div></td>
						<td class="item_del_price align-middle"><div>3,000 원</div></td>
						<td class="align-middle"><div>취소</div></td>
					</tr>
				</tbody>
			</table>



		</div>





	</div>
	<%@ include file="../com/footer.jsp"%>
	<script type="text/javascript">

	function exchangeitem(that){
		console.log(that);

		}
	function refunditem(that){
		console.log(that);
		}

	function cancleitem(that){
		console.log(that);
		}
	
	
	
		$(document)
				.ready(
						function() {
							$("#status_1").append("0");
							$("#status_2").append("0");
							$("#status_3").append("1");
							$("#status_4").append("0");
							$("#status_5").append("1");
							if (window.innerWidth < 768) {
								$(".right-border").removeClass("border-right");
							}
							$(window).resize(
									function() {
										if (window.innerWidth < 768) {
											$(".right-border").removeClass(
													"border-right");
										} else {
											$(".right-border").addClass(
													"border-right")
										}

									});

							$("tbody")
									.on("click",".item_location_search",
											function() {
												location.href = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=%ED%83%9D%EB%B0%B0";

											});
							$("tbody").on("click", ".repurchase", function(){
								location.href="/order/payment";
								});
							

						});
	</script>

</body>
</html>