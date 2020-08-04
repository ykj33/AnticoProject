<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.domain.DeliveryAdbkDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<%@ include file="../com/header.jsp"%>
	<%@ include file="../com/top.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-lg-7" style="border-right: 1px solid black;">
				<%@ include file="../com/title.jsp"%>
				<%@ include file="../com/navbar.jsp"%>
				<h3 style="text-align: center">주문 | 결제</h3>
				<h5>주문자 정보</h5>
				<input type="hidden" id="email" class="form-control" name="email"
					value="${login.email}" readonly><br>

				<button id="new_address" class="btn btn-outline-secondary rounded-0">새
					주소지 추가</button>

				<div id="added_address_name">
					<br>
				</div>
				<br>
				<form action="order" method="POST" id="adbkData">

					<div>
						<input class="form-control" name="email" value="${login.email}"
							readonly><br> <input id="delivery_adbk_ncm"
							class="form-control" name="delivery_adbk_ncm"
							placeholder="새로 저장할 주소록 이름을 입력하세요(필수)" required="required"><br>
						<input id="delivery_place_tlnum" class="form-control"
							name="delivery_place_tlnum"
							placeholder="전화번호를 입력하세요(필수, -를 제외한 숫자만 입력)" required="required"><br>
						<input id="delivery_place_adres" class="form-control"
							name="delivery_place_adres" placeholder="주소를 입력하세요(필수)"
							required="required"><br> <input
							id="delivery_place_adres_detail" class="form-control"
							name="delivery_place_adres_detail" placeholder="상세 주소를 입력하세요(필수)"
							required="required">
					</div>

				</form>
				<button id="delivery_adbk_info"
					class="btn btn-outline-dark btn-block rounded-0 mt-4">배송정보저장</button>
				<br>
				
					<div id = "selectHow">
						<h4>결제수단</h4>
						<label><button
								class="btn btn-outline-dark btn-block rounded-0 mt-4 howToPay"
								name="setle_mth" value="카드"
								onclick="div_OnOff(this.value,'selectCard');">카드</button></label> <label><button
								class="btn btn-outline-dark btn-block rounded-0 mt-4 howToPay"
								name="setle_mth" value="무통장입금"
								onclick="div_OnOff(this.value,'selectDeposit');">무통장입금</button></label>
						<label><button
								class="btn btn-outline-dark btn-block rounded-0 mt-4 howToPay"
								name="setle_mth" value="간편결제"
								onclick="div_OnOff(this.value,'selectPay');">간편결제</button></label>
					</div>

					<div id="selectCard" style="display: none">
						카드를 선택하세요 <select class="custom-select" name="selectCard">
							<option value="삼성카드">삼성카드</option>
							<option value="우리카드">우리카드</option>
							<option value="신한카드">신한카드</option>
							<option value="하나카드">하나카드</option>
						</select>
					</div>
					<div id="selectDeposit" style="display: none">
						입금할 계좌를 선택하세요 <select class="custom-select" name="selectDeposit">
							<option value="우리은행">우리은행</option>
							<option value="신한은행">신한은행</option>
							<option value="하나은행">하나은행</option>
							<option value="농협은행">농협은행</option>
						</select>
					</div>
					<div id="selectPay" style="display: none">
						간편 결제 방법을 선택하세요 <select class="custom-select" name="selectPay">
							<option value="삼성페이">삼성페이</option>
							<option value="페이코">페이코</option>
							<option value="카카오페이">카카오페이</option>
						</select>
					</div>
			</div>

			<!-- 구매한 상품 리스트 -->
			<div class="col-lg-5">
				<div id="goods_list" class="row"
					style="border-bottom: 1px black solid; padding: 10px"></div>
				<div>
					<div id="totalPrice" style="padding: 10px"></div>

					<div>
						<!-- <form action="commit" method="POST">  -->
						<input class="form-control" name="email" value="${login.email}"
							hidden> <input type="button" id="commit"
							class="btn btn-outline-dark btn-block rounded-0 mt-4"
							value="상품결제">
						<!-- </form> -->
					</div>
				</div>
			</div>
			</form>

		</div>
	</div>
	</div>
	<%@ include file="../com/footer.jsp"%>
</body>

<script type="text/javascript">
var choicePay = "";
	$(document).ready(function() {
						addressNameDisplay();
						cartList();
						$(document).on("click",	".namelist",function() {

											var email = $("#email").val();
											var idx = $(this).attr('data-idx');

											$
													.ajax({
														type : 'POST',
														url : 'payment',

														data : {
															email : email
														},
														success : function(
																result) {
															var name = result["adbkList"][idx].delivery_adbk_ncm;
															var telnum = result["adbkList"][idx].delivery_place_tlnum;
															var address = result["adbkList"][idx].delivery_place_adres;
															var address_detail = result["adbkList"][idx].delivery_place_adres_detail;
															$(
																	"#delivery_adbk_ncm")
																	.val(name);
															$(
																	"#delivery_place_tlnum")
																	.val(telnum);
															$(
																	"#delivery_place_adres")
																	.val(
																			address);
															$(
																	"#delivery_place_adres_detail")
																	.val(
																			address_detail);

														},
														error : function(
																request,
																status, error) {

															console.log(error);
														}

													});
										});

						$("#delivery_adbk_info").click(function() {
							var formData = $('#adbkData').serialize();

							console.log(formData);
							$.ajax({
								type : "POST",
								url : "order",
								data : formData,
								success : function(result) {
									$("#added_address_name").empty();
									addressNameDisplay();
								},
								error : function(request, status, error) {
									console.log(error);
								}
							});
						});

						$("#new_address").click(function() {
							$("#delivery_adbk_ncm").val("");
							$("#delivery_place_tlnum").val("");
							$("#delivery_place_adres").val("");
							$("#delivery_place_adres_detail").val("");
						});
						
						$("#commit").click(function() {
							var totalPrice = $("#tPrice").html().replace('원', '');
							console.log("total" ,totalPrice);
							
							
							console.log("pay", choicePay)
							if(choicePay == "") {
										alert("결제 방법을 선택해주세요.");
										return;
								}
							var email = $("#email").val();
							var OrderDTO = {delivery_adbk_no: 0,
									delivery_no: null,
									email: email,
									frwll_reason_code: null,
									order_date: null,
									order_no: 0,
									order_pro_sttus_code: null,
									order_totamt:  Number(totalPrice),
									setle_mth: choicePay};
							$.ajax({
										type : 'POST',
										url : 'commit',

/* 										data : {
											email : email,
											totalPrice : Number(totalPrice),
											howToPay : howToPay
										}, */
										headers: {
											"Content-Type": "application/json",
											"X-HTTP-Method-Override": "POST"
										},
										data: JSON.stringify(OrderDTO),
										dataType: 'text',
										success : function(result) {
											console.log(result);

										},
										error : function(request, status, error) {

											console.log(error);
										}

									});
							
							});
							
					});
	function div_OnOff(value, id) {
		if (value == "카드") {
			choicePay = "카드";
			document.getElementById("selectCard").style.display = "";
			document.getElementById("selectDeposit").style.display = "none";
			document.getElementById("selectPay").style.display = "none";
		} else if (value == "무통장입금") {
			choicePay = "무통장입금";
			document.getElementById("selectCard").style.display = "none";
			document.getElementById("selectDeposit").style.display = "";
			document.getElementById("selectPay").style.display = "none";
		} else if (value == "간편결제") {
			choicePay = "간편결제";
			document.getElementById("selectCard").style.display = "none";
			document.getElementById("selectDeposit").style.display = "none";
			document.getElementById("selectPay").style.display = "";
		}

	}

	

	function cartList() {
		var email = $("#email").val();
		$.ajax({
					type : 'POST',
					url : 'payment',
					data : {
						email : email
					},
					success : function(result) {
						console.log("map")

						for (var i = 0; i < result["orderList"].length; i++) {

							var img = result["orderList"][i].goods_img;
							var name = result["orderList"][i].goods_nm;
							var quantity = result["orderList"][i].goods_qtys;
							var price = result["orderList"][i].goods_untpc;
							var totalPrice = 0;
							totalPrice += price;

							$("#goods_list")
									.append(
											"<div class='goodsList col-md-3' style = 'display : inline' data-idx='"+i+"'><img id='main' src='/displaythumb?img_name="
													+ img + "'/></div>");
							$("#goods_list").append(
									"<div class='goodsList col-md-4' style = 'display : inline' data-idx='"+i+"'>"
											+ name + "</div>");
							$("#goods_list").append(
									"<div class='goodsList col-md-2' style = 'display : inline' data-idx='"+i+"'>"
											+ quantity + "</div>");
							$("#goods_list")
									.append(
											"<div class='goodsList col-md-2' style = 'display : inline; text-align : right' data-idx='"+i+"'>"
													+ price + "</div>");
							$("#totalPrice").append(
									"<h4 style='display: inline'>총액</h4><h4 id = 'tPrice' style='float: right; display: inline'>"
											+ totalPrice + "원</h4>");

						}

					},
					error : function(request, status, error) {

						console.log(error);
					}

				});
	}

	function addressNameDisplay() {
		var email = $("#email").val();

		console.log(email);
		$
				.ajax({
					type : 'POST',
					url : 'payment',

					data : {
						email : email
					},
					success : function(result) {
						console.log("map")

						for (var i = 0; i < result["adbkList"].length; i++) {

							var ncm = result["adbkList"][i].delivery_adbk_ncm;
							console.log(ncm);
							$("#added_address_name")
									.append(
											"<div class='namelist' style = 'display : inline' data-idx='"+i+"'><button class='btn btn-outline-secondary rounded-0'>"
													+ ncm + "</button></div>");
							$("#added_address_name").append("    ");
						}

					},
					error : function(request, status, error) {

						console.log(error);
					}

				});
	}
</script>
</html>