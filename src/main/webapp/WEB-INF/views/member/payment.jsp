<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

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
				<form action="payment" method="POST">
					<div>
						<input class="form-control" name="mname"
							placeholder="이름을 입력하세요(필수)"><br> <br> <input
							class="form-control" name="telephone"
							placeholder="전화번호를 입력하세요(필수)"><br> <br> <input
							class="form-control" name="delivery_place_adres"
							placeholder="주소를 입력하세요(필수)">
					</div>
					<br>
					<div>
						<h4>결제수단</h4>
						<label><input type="radio" name="payment" value="1"
							onclick="div_OnOff(this.value,'selectCard');">카드</label> <label><input
							type="radio" name="payment" value="2"
							onclick="div_OnOff(this.value,'selectDeposit');">무통장입금</label> <label><input
							type="radio" name="payment" value="3"
							onclick="div_OnOff(this.value,'selectPay');">간편결제</label>
					</div>

					<div id="selectCard" style="display: none">
						카드를 선택하세요 <select class="custom-select" name="selectCard">
							<option value="samsung">삼성카드</option>
							<option value="woori">우리카드</option>
							<option value="shinhan">신한카드</option>
							<option value="hana">하나카드</option>
						</select>
					</div>
					<div id="selectDeposit" style="display: none">
						입금할 계좌를 선택하세요 <select class="custom-select" name="selectDeposit">
							<option value="woori">우리은행</option>
							<option value="shinhan">신한은행</option>
							<option value="hana">하나은행</option>
							<option value="nonghyub">농협은행</option>
						</select>
					</div>
					<div id="selectPay" style="display: none">
						간편 결제 방법을 선택하세요 <select class="custom-select" name="selectPay">
							<option value="samsungpay">삼성페이</option>
							<option value="payco">페이코</option>
							<option value="kakao">카카오페이</option>
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
					<div style="display: inline">
						<h4>총액</h4>
					</div>
					<div style="display: inline">
						<h4>28,800원</h4>
					</div>
				</div> 
				<div style="float: right">
					<button class="button btn btn-primary">상품 결제</button>
				</div>
			</div>
			</form>
		</div>
	</div>
	</div>
	<%@ include file="../com/footer.jsp"%>
</body>
<script type="text/javascript">
	function div_OnOff(value, id) {
		if (value == "1") {
			document.getElementById("selectCard").style.display = "";
			document.getElementById("selectDeposit").style.display = "none";
			document.getElementById("selectPay").style.display = "none";
		} else if (value == "2") {
			document.getElementById("selectCard").style.display = "none";
			document.getElementById("selectDeposit").style.display = "";
			document.getElementById("selectPay").style.display = "none";
		} else if (value == "3") {
			document.getElementById("selectCard").style.display = "none";
			document.getElementById("selectDeposit").style.display = "none";
			document.getElementById("selectPay").style.display = "";
		}

	}
</script>
</html>