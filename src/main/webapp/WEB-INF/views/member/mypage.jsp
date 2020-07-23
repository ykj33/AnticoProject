<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
#antico_layout {
	width: 1200px;
	margin: 0 auto;
	font-size: 20px;
}

#antico_container {
	width: 900px;
	margin: 0 auto;
}

#mypage_head {
	text-align: center;
	margin: 40px 0;
}

#delevery_status {
	border-bottom: 1px solid black;
	border-top: 1px solid black;
	height: 220px;
	width: 900px;
}

#basket table {
	width: 100%;
	margin: 70px 0;
	text-align: center;
}

#basket table tr th {
	color: gray;
	font-size: 18px;
}

#colume_1 {
	width: 450px;
}

#colume_2, #colume_3, #colume_4 {
	width: 70px;
}

#colume_5, #colume_6 {
	width: 120px;
	text-align: center;
}

.status {
	width: 180px;
	height: 180px;
	margin: 20px 0;
	display: inline-block;
	position: relative;
}

.status_left {
	border-right: 1px solid black;
}

.status_name {
	text-align: center;
	font-size: 18px;
	margin-top: 20px;
}

.status_figure {
	font-size: 50px;
	margin-top: 35px;
	text-align: center;
}

.basket_img {
	background-color: black;
	float: left;
	width: 130px;
	height: 130px;
}

.basket_item_details {
	position: relative;
	height: 130px;
	width: 280px;
	display: inline-block;
	text-align: left;
}

.basket_name {
	font-size: 24px;
	
}

.basket_option {
	font-size: 16px;
}

.basket_item {
	margin-left: 10px;
	display: inline-block;
}

.basket_date {
	bottom: 0;
	position: absolute;
	left: 0;
}

.basket_status {
	display: inherit;
	bottom: 0;
	right: 0;
	position: absolute;
}

.item_price, .item_del_price {
}

td {
	padding: 20px 0;
}
</style>

</head>
<body>


	<div id="antico_layout">
		<div id="antico_container">
			<div id="mypage_head">
				<h2 style="color: gray;">마이 쇼핑</h2>
			</div>

			<div id="delevery_status">
				<div class="status_left status">
					<div class="status_name">입금 전</div>
					<div class="status_figure" id="status_1"></div>
				</div><div class="status_left status">
					<div class="status_name">배송 준비중</div>
					<div class="status_figure" id="status_2"></div>
				</div><div class="status_left status">
					<div class="status_name">배송 중</div>
					<div class="status_figure" id="status_3"></div>
				</div><div class="status_left status">
					<div class="status_name">배송 완료</div>
					<div class="status_figure" id="status_4"></div>
				</div><div class="status">
					<div class="status_name">취소/교환/반품</div>
					<div class="status_figure" id="status_5"></div>
				</div>

			</div>


			<div id="basket">
				<table>
					<tr>
						<th id="colume_1">아이템</th>
						<th id="colume_2">사이즈</th>
						<th id="colume_3">색상</th>
						<th id="colume_4">수량</th>
						<th id="colume_5">가격</th>
						<th id="colume_6">배송비</th>
					</tr>
					<tr>
						<td>
							<div class="basket_img"></div>
							<div class="basket_item_details">
								<div class="basket_item basket_name">상품명</div>
								<!-- <div class="basket_item basket_option">상품 사이즈 및 색상</div> -->
								<div class="basket_item basket_date">2020-07-23</div>
								<div class="basket_item basket_status">재구매</div>
							</div>
						</td>
						<td>대</td>
						<td>검정</td>
						<td>1</td>
						<td class="item_price">15,900 원</td>
						<td class="item_del_price">3,000 원</td>
					</tr>
					
				</table>



			</div>







		</div>
	</div>

<script type="text/javascript">
$(document).ready(function(){
	$("#status_1").append("0");
	$("#status_2").append("0");
	$("#status_3").append("1");
	$("#status_4").append("0");
	$("#status_5").append("3");

	$("table").append('<tr><td><div class="basket_img"></div><div class="basket_item_details"><div class="basket_item basket_name">상품명</div><div class="basket_item basket_date">2020-07-23</div><div class="basket_item basket_status">재구매</div></div></td><td>대</td><td>검정</td><td>1</td><td class="item_price">15,900 원</td><td class="item_del_price">3,000 원</td></tr>');

	$("table").on("click", ".basket_status", function(){
		var a = $(this).parent().parent().parent().children("#item_price").val();
		console.log(a);
		});
});


</script>

</body>
</html>