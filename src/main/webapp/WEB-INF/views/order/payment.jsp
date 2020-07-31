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
				<div id="adress_name"></div>
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
				<div>
					<h4>결제수단</h4>
					<label><input type="radio" name="setle_mth" value="카드"
						onclick="div_OnOff(this.value,'selectCard');">카드</label> <label><input
						type="radio" name="setle_mth" value="무통장입금"
						onclick="div_OnOff(this.value,'selectDeposit');">무통장입금</label> <label><input
						type="radio" name="setle_mth" value="간편결제"
						onclick="div_OnOff(this.value,'selectPay');">간편결제</label>
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

			<div class="col-lg-5">
				<div id="goods_list">
					<table class="table" style="border-bottom: 1px solid black;">
						<%-- 추후 DB구축 시 사용할 테이블
						<c:forEach items="#{}" var="dto">
							<tr>
								<td>사진</td>
								<td>KF-90 마스크</td>
								<td>15,900원</td>
							</tr>
						</c:forEach> --%>
						<tr>
							<td style="border: none"><img
								src="../resources/image/show.png" height="70px" width="70px"></td>
							<td style="border: none">KF-90 마스크</td>
							<td style="border: none">15,900원</td>
						</tr>
						<tr>
							<td style="border: none"><img
								src="../resources/image/show.png" height="70px" width="70px"></td>
							<td style="border: none">KF-84 마스크</td>
							<td style="border: none">12,900원</td>
						</tr>
					</table>

				</div>
				<div>
					<div>
						<h4 style="display: inline">총액</h4>
						<h4 style="float: right; display: inline">28,800원</h4>
					</div>

					<div>
						<button class="btn btn-outline-dark btn-block rounded-0 mt-4">상품
							결제</button>
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
	$(document).ready(
			function() {

				var email = $("#email").val();

				console.log(email);
				$.ajax({
					type : 'POST',
					url : 'payment',

					data : {
						email : email
					},
					success : function(result) {
						
						
						for (var i = 0; i < result.length; i++) {
							var ncm = result[i].delivery_adbk_ncm;
							$("#adress_name").append(
									"<div class='namelist' style = 'display : inline' data-idx='"+i+"'>"
											+ ncm + "</div>");
							$("#adress_name").append("    ");
						}
					

					},
					error : function(request, status, error) {

						console.log(error);
					}

				});

				$(document).on("click", ".namelist", function() {

					var email = $("#email").val();
						var idx = $(this).attr('data-idx');
						
					$.ajax({
						type : 'POST',
						url : 'payment',

						data : {
							email : email
						},
						success : function(result) {
							var name = result[idx].delivery_adbk_ncm;
							var telnum = result[idx].delivery_place_tlnum;
							var address = result[idx].delivery_place_adres;
							var address_detail = result[idx].delivery_place_adres_detail;
							$("#delivery_adbk_ncm").val(name);
							$("#delivery_place_tlnum").val(telnum);
							$("#delivery_place_adres").val(address);
							$("#delivery_place_adres_detail").val(address_detail);


						},
						error : function(request, status, error) {

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
			document.getElementById("selectCard").style.display = "";
			document.getElementById("selectDeposit").style.display = "none";
			document.getElementById("selectPay").style.display = "none";
		} else if (value == "무통장입금") {
			document.getElementById("selectCard").style.display = "none";
			document.getElementById("selectDeposit").style.display = "";
			document.getElementById("selectPay").style.display = "none";
		} else if (value == "간편결제") {
			document.getElementById("selectCard").style.display = "none";
			document.getElementById("selectDeposit").style.display = "none";
			document.getElementById("selectPay").style.display = "";
		}

	}
</script>
</html>