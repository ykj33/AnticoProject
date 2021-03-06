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
<title>상품 관리</title>
</head>
<body>
	<%@ include file="../com/header.jsp"%>
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/title.jsp"%>
		
<div class="container">
		<%@ include file="../com/navbar.jsp"%>

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
		<br>
		<div id="inputdiv">
			
			
		
		</div>
		
		
<!-- 	 -->

</div>
<script type="text/javascript">




$(document).ready(function(){
	
	var goodsno = "";
	var info;
	$(document).on("keyup", "#input_no", function(){
		info = $("#input_no").val();
		$.ajax({
			type:'post',
			url:'goodsidentify',
			dataType:'JSON',
			data: {
				no:info
			},
			success : function(result){
				$("#input_no").addClass("text-primary");
				$("#goods_info").replaceWith(
						'<div id="goods_info" style="height: 100px;">'
						+	'<img id="main" src="/displaythumb?img_name='+result.goods_img+'"/>'
						+	'<h3 class="d-inline m-4">'+result.goods_nm+'</h3>'
						+'</div>');
				goodsno = result.goods_no;
				},
			error : function(request, status, error){
				$("#input_no").removeClass("text-primary");
				$("#goods_info").empty();
				$("#inputdiv").empty();
				goodsno = "";
				}
			
			});
	
		});
	$("#goods_delete").click(function(){
		if(goodsno != ""){
			var isOk = confirm("삭제하시겠습니까?")
			if(isOk){
				location.href="/admin/delete/"+goodsno;
				}
			
			}
	});

	$("#goods_update").click(function(){
		$("#inputdiv").empty();
		if(goodsno != ""){
			$.ajax({
				type:'post',
				url:'goodsidentify',
				dataType:'JSON',
				data: {
					no:info
				},
				success : function(result){
					$("#inputdiv").replaceWith(
							'<div id="inputdiv">'
							+	'<form action="#" method="POST" id="goods_img_update" enctype="multipart/form-data">'
							+		'<div class="form-group">'
							+			'<input type="text" class="form-control rounded-0" id="goods_no" name="goods_no" readonly="readonly" value="'+result.goods_no+'">'
							+			'<input type="text" class="form-control rounded-0" id="goods_nm" name="goods_nm" value="'+result.goods_nm+'">'
							+			'<input type="text" class="form-control rounded-0" id="makr" name="makr" placeholder="제조사" value="">'
							+			'<input type="text" class="form-control rounded-0" id="goods_category" name="goods_category" value="'+result.goods_category+'">'
							+			'<textarea rows="5" class="form-control rounded-0" id="goods_info_text" name="goods_info_text" >'+result.goods_info_text+'</textarea>'
							+		'</div>'
							+		'<div class="form-group">'
							+			'<p>대표 이미지를 선택해주세요.</p>'
							+			'<input type="file" class="form-control rounded-0" id="goods_img" name="goods_img">'
							+			'<br>'
							+			'<p>설명 이미지를 선택해주세요.</p>'
							+			'<input type="file" class="form-control rounded-0" id="goods_info_img" name="goods_info_img">'
							+		'</div>'
							+	'</form>'
							+	'<button id="goods_update_ajax" class="form-control btn btn-info rounded-0">수정 확인</button>'
							+'</div>');
					},
				error : function(request, status, error){
					console.log(error);
					}
				
				});
		}
		});

	$(document).on("click","#goods_update_ajax", function(){
		var formData =  new FormData($("#goods_img_update")[0]);
		$.ajax({
			type:"POST",
			url:"imgupdate",
			data : 
				formData,
			processData : false,
			contentType : false,
			success : function(result){
				location.href="/board/read/"+result;
				},
				error:function(request, status, error){
					console.log(error);
					}
			
			});
		});
		
		
	
	$("#option_update").click(function(){
		$("#inputdiv").empty();
		if(goodsno != ""){
		optiondisplay();
		}
	});

	$(document).on("click", ".option_delete", function(){
		$("#inputdiv").empty();
		var color = $(this).parent().parent().children(".goods_color").text();
		var size = $(this).parent().parent().children(".goods_size").text();
		
		$.ajax({
			type:'get',
			url:'optiondelete',
			data :{
				color :	color,
				size : size,
				no : info
				},
		success : function(result){
				optiondisplay();
			},
			error : function(request, status, error){
			}
			});
		});


	$(document).on("click", "#option_input_ajax", function(){
		var data = $("#optionform").serialize();
		$.ajax({
			type:'post',
			url:'optioninput',
			data : data,
			success:function(result){
				$("#inputdiv").empty();
				optiondisplay();
				},
			error:function(request, status, error){
				console.log(error);
				}
			});
		
		
		});
	
	
	
	


	function optiondisplay(){
		$.ajax({
			type:'GET',
			url:'getoption/'+info,
			
			success : function(result){
				var str = '<table class="table table-striped"><tbody>';
				for(var i=0;i<result.length;i++){
					str+='<tr><td>'+result[i].goods_amount+'</td><td>'+result[i].goods_untpc+'</td><td class="goods_size">'+result[i].goods_size+'</td><td class="goods_color">'+result[i].goods_color+'</td><td><button class="btn btn-danager option_delete">삭제</button></td></tr>';
					}
				str += '</tbody></table>';
				if(result.length!=0){
					$("#inputdiv").append(str);
				} else{
					$("#inputdiv").append("<h4>옵션은 반드시 1개 이상 존재해야 합니다.<h4><br>");
				}
				$("#inputdiv").append(
						'<form id="optionform">'
						+	'<div class="form-group" id="formNum">'
						+		'<input type="text" class="form-control rounded-0" id="goods_no" name="goods_no" hidden="" value="'+info+'">'
						+		'<input type="number" class="form-control rounded-0 goods_amount" name="goods_amount" placeholder="수량">'
						+		'<input type="number" class="form-control rounded-0 goods_untpc" name="goods_untpc" placeholder="가격">'
						+		'<input type="text" class="form-control rounded-0 goods_size" name="goods_size" placeholder="크기">'
						+		'<input type="text" class="form-control rounded-0 goods_color" name="goods_color" placeholder="색상">'
						+	'</div>'
						+'</form>'
						+'<button id="option_input_ajax" class="form-control btn btn-info rounded-0">옵션 추가</button>');				
			},
			error : function(request, status, error){
				console.log(error);
				}
			
			});
}
	
	
});
</script>
</body>
</html>