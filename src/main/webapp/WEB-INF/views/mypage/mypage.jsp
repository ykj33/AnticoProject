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
.status_val{
font-size: 45px;
}
.basket_name{
font-size: 1.5rem;
}
tr td{
margin: auto;
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
				<h2  class="text-black-50">마이 쇼핑</h2>
			</div>
			<div id="delevery_status" class="row align-items-center  m-5" >
				<div class="col-md-1"></div>
				<div class="col-md-2 status p-0 border-top border-bottom">
				<div class="border-right">
					<div class="text-center m-3">입금 전</div>
					<div class="text-center m-3 status_val" id="status_1"></div>
					</div>
				</div>
				<div class="col-md-2  status p-0 border-top border-bottom">
				<div class="border-right">
					<div class="text-center m-3 ">배송 준비중</div>
					<div class="text-center m-3 status_val" id="status_2"></div>
					</div>
				</div>
				<div class="col-md-2  status p-0 border-top border-bottom">
				<div class=" border-right">
					<div class="text-center m-3 ">배송 중</div>
					<div class="text-center m-3 status_val" id="status_3"></div>
					</div>
				</div>
				<div class="col-md-2  status p-0 border-top border-bottom">
				<div class="border-right">
					<div class="text-center m-3">배송 완료</div>
					<div class="text-center m-3 status_val" id="status_4"></div>
					</div>
				</div>
				
				<div class="col-md-2 status p-0 border-top border-bottom" >
				<div>
					<div class="text-center m-3">취소/교환/반품</div>
					<div class="text-center m-3 status_val" id="status_5"></div>
					</div>
				</div>
				<div class="col-md-1"></div>
			</div>

			<div id="basket">
				<table class="table table-borderless m-4">
				<thead>
				<tr class="">
						<td id="colume_1"><div class="text-black-50">아이템</div></td>
						<td id="colume_2"><div class="text-black-50">사이즈</div></td>
						<td id="colume_3"><div class="text-black-50">색상</div></td>
						<td id="colume_4"><div class="text-black-50">수량</div></td>
						<td id="colume_5"><div class="text-black-50">가격</div></td>
						<td id="colume_6"><div class="text-black-50">배송비</div></td>
					</tr>
				</thead>
				
				<tbody>
					
				
					<tr class="align-middle ">
						<td class="d-flex w-80">
							<img alt="" src="/resources/image/show.png" class="m-2 float-left">
							<div class="basket_item_details position-relative flex-fill">
								<div class="basket_item basket_name">상품명</div>
								<div class="position-absolute basket_item basket_date " style="bottom: 0;">2020-07-23</div>
								<div class="position-absolute basket_item basket_status" style="bottom:0; right:0;">재구매</div>
							</div>
						</td>
						<td class="align-middle"><div>대</div></td>
						<td class="align-middle"><div>검정</div></td>
						<td class="align-middle"><div>1</div></td>
						<td class="item_price align-middle"><div>15,900 원</div></td>
						<td class="item_del_price align-middle"><div>3,000 원</div></td>
					</tr><tr class="align-middle ">
						<td class="d-flex w-80">
							<img alt="" src="/resources/image/show.png" class="m-2 float-left">
							<div class="basket_item_details position-relative flex-fill">
								<div class="basket_item basket_name">상품명</div>
								<div class="position-absolute basket_item basket_date " style="bottom: 0;">2020-07-23</div>
								<div class="position-absolute basket_item basket_status" style="bottom:0; right:0;">재구매</div>
							</div>
						</td>
						<td class="align-middle"><div>대</div></td>
						<td class="align-middle"><div>검정</div></td>
						<td class="align-middle"><div>1</div></td>
						<td class="item_price align-middle"><div>15,900 원</div></td>
						<td class="item_del_price align-middle"><div>3,000 원</div></td>
					</tr>
</tbody>
				</table>



			</div>







	</div>
<%@ include file="../com/footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
							$("#status_1").append("0");
							$("#status_2").append("0");
							$("#status_3").append("1");
							$("#status_4").append("0");
							$("#status_5").append("3");


							
						});
	</script>

</body>
</html>