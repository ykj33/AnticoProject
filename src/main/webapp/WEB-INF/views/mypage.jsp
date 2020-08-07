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
	height: 5rem;
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

	<%@ include file="com/header.jsp"%>
	<%@ include file="com/top.jsp"%>
	<div id="antico_layout" class="container">
		<%@ include file="com/title.jsp"%>
		<%@ include file="com/navbar.jsp"%>
		<div id="mypage_head" class="text-center p-4">
			<h2 class="text-black-50">마이 쇼핑</h2>
		</div>
		<div id="delevery_status" class="row align-items-center  m-5">
			<div class="col-md-3  status p-0 border-top border-bottom">
				<div class="border-right right-border">
					<div class="text-center m-3 del_menu">배송 준비 중</div>
					<div class="text-center m-3 status_val" id="status_1"></div>
				</div>
			</div>
			<div class="col-md-3  status p-0 border-top border-bottom">
				<div class=" border-right right-border">
					<div class="text-center m-3 del_menu">배송 중</div>
					<div class="text-center m-3 status_val" id="status_2"></div>
				</div>
			</div>
			<div class="col-md-3  status p-0 border-top border-bottom">
				<div class="border-right right-border">
					<div class="text-center m-3 del_menu">배송 완료</div>
					<div class="text-center m-3 status_val" id="status_3"></div>
				</div>
			</div>

			<div class="col-md-3 status p-0 border-top border-bottom">
				<div>
					<div class="text-center m-3 del_menu">취소/교환/반품</div>
					<div class="text-center m-3 status_val" id="status_4"></div>
				</div>
			</div>
		</div>

		<div id="basket">
			
			
		</div>



	</div>
	<%@ include file="com/footer.jsp"%>
	<script type="text/javascript">

	function getlist(){
		$.ajax({
			type:'post',
			url:'getdata',
			dataType:'JSON',
			success:function(result){

				for(var i=0;i<result.length;i++){
					if($("#tbody"+result[i].order_no).length>0){
						
						}else{

							var str ='<table class="table table-borderless" style="table-layout: fixed;">'
									+'<colgroup>'
									+	'<col style="width: 45%;">'
									+	'<col style="width: 11%;">'
									+	'<col style="width: 8%;">'
									+	'<col style="width: 11%;">'
									+	'<col style="width: 11%;">'
									+	'<col style="width: 14%;">'
									+'</colgroup>'
									+'<tbody id="tbody'+result[i].order_no+'"></tbody></table><hr>';

									$("#basket").append(str);
						}

					var tr ='<tr class="align-middle text-center">'
							+	'<td class="d-flex " >'
							+		'<img src="/displaythumb?img_name='+result[i].goods_img+'"class="m-2 float-left">'	
							+		'<div class="basket_item_details position-relative flex-fill" style="width: 70%">'
							+		'<div class="basket_item basket_name text-left overflow-hidden">'+result[i].goods_nm+'</div>'
							+		'<div class="position-absolute basket_item basket_status repurchase" id="resell'+result[i].goods_no+'" style="bottom: 0; right: 0;" >재구매</div>'
							+	'</div></td>'	
							+	'<td class="align-middle"><div>'+result[i].goods_color+'</div><div>'+result[i].goods_size+'</div></td>'
							+	'<td class="align-middle"><div>'+result[i].order_amount+'</div></td>'	
							+	'<td class="item_price align-middle"><div>'+result[i].goods_untpc+' 원</div></td>'	
							+	'<td class="item_del_price align-middle"><div>3,000 원</div></td>';

					if($("#btns"+result[i].order_no).length==0){
						tr += 	'<td class="align-middle btns '+result[i].order_pro_sttus_code+'" id="btns'+result[i].order_no+'"><div>'+result[i].order_pro_sttus_code+'</div>';

							if(result[i].order_pro_sttus_code=='배송 준비 중'){
								tr+='<button class="btn btn-outline-danger rounded-0" onclick="cancleitem('+result[i].order_no+')">취소</button>'
							}else if(result[i].order_pro_sttus_code=='배송 중'){
								tr+='<button class="btn btn-outline-secondary rounded-0 item_location_search">위치 확인</button>'
							}else if(result[i].order_pro_sttus_code=='배송 완료'){
								tr+='<button class="btn btn-outline-danger rounded-0 " href="#" role="button" id="dropdownMenuLink"'
									+'data-toggle="dropdown"aria-haspopup="true" > 교환/환불 </button>'
									+'<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">'
									+'<a class="dropdown-item" href="#" onclick="exchangeitem('+result[i].order_no+');">교환</a>'
									+'<a class="dropdown-item" href="#" onclick="refunditem('+result[i].order_no+');">환불</a>'
									+'</div>'
									
							}
							
						}
							
						tr	+=	'<div>'+result[i].order_date.substring(5,10)+'</div>'	
							+	'</td></tr>';	
						
					$("#tbody"+result[i].order_no).append(tr);

					var rowno = $("#tbody"+result[i].order_no).children("tr").length;
					$("#tbody"+result[i].order_no).children("tr").children(".btns").attr("rowspan", rowno);
					console.log(rowno);
					
					
					
					
					}

				
									
				},
			error:function(request, status, error){
				console.log(error);
				}
			
			});
		}
	
	function exchangeitem(no){
		
		}
	function refunditem(no){
		var isOk = confirm("환불하시겠습니까?");
		if(isOk){
			$.ajax({
				type:'post',
				url:'refundorder/'+no,
				success:function(result){
					console.log('성공');
					$("#basket").empty();
					getlist();
					},
				error:function(request, error, status){
					console.log(error);
					}
				});
			}
		}

	function cancleitem(no){
		var isOk = confirm("취소하시겠습니까?");
		if(isOk){
			$.ajax({
				type:'post',
				url:'cancleorder/'+no,
				success:function(result){
					console.log('성공');
					$("#basket").empty();
					getlist();
					},
				error:function(request, error, status){
					console.log(error);
					}
				});
			}
		
		}
	
		
	
		$(document).ready(function() {
			getlist();

			
			
			
			
							$("#status_1").append($("."));
							$("#status_2").append();
							$("#status_3").append();
							$("#status_4").append();
							
							if (window.innerWidth < 768) {
								$(".right-border").removeClass("border-right");
							}
							$(window).resize(function() {
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