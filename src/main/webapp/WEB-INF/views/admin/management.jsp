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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="container">

<form action="goods" method="post">
<div class="form-group">
		<input type="text" class="form-control rounded-0 " id="input_no" name="goods_no" placeholder="상품 번호">
		<br>
		<div id="goods_info"  style="height: 100px;">
		
		
		</div>
		
	
</div>
</form>
	<div class="text-right">
			<button id="goods_update"class="btn btn-warning">상품 수정</button>
			<button id="option_update"class="btn btn-warning">옵션 수정</button>
			<button id="goods_delete"class="btn btn-danger">삭제</button>
		</div>
<!-- 	 -->

</div>
<script type="text/javascript">
$(document).ready(function(){
	var goodsno = "";
	$(document).on("keyup", "#input_no", function(){
		var info = $("#input_no").val();
		console.log(info);
		$.ajax({
			type:'post',
			url:'/goodsidentify',
			dataType:'JSON',
			data: {
				no:info
			},
			success : function(result){
				$("#input_no").addClass("text-primary");
				$("#goods_info").replaceWith('<div id="goods_info" style="height: 100px;"><img id="main" src="/displaythumb?img_name='+result.goods_img+'"/><h3 class="d-inline m-4">'+result.goods_nm+'</h3></div>');
				goodsno = result.goods_no;
				console.log(result);
				},
			error : function(request, status, error){
				$("#input_no").removeClass("text-primary");
				$("#goods_info").empty();
				goodsno = "";
				console.log(error);
				}
			
			});
	
		});
	$("#goods_delete").click(function(){
		if(goodsno != ""){
			console.log(goodsno);
			location.href="/admin/delete/"+goodsno;
			}
	});

	$("#goods_update").click(function(){
		if(goodsno != ""){
			
		}
		});
	$("#option_update").click(function(){
		if(goodsno != ""){
			
		}
		});

	
});
</script>
</body>
</html>