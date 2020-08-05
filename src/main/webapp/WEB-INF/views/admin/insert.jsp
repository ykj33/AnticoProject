<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>상품 추가</title>
<%@ include file="../com/header.jsp"%>
</head>
<body>
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/title.jsp"%>

	<div class="container">
		<%@ include file="../com/navbar.jsp"%>


		<form action="#" method="POST" id="imgupload"
			enctype="multipart/form-data">
			<div class="form-group">
				<input type="text" class="form-control rounded-0" id="goods_no" name="goods_no" placeholder="상품 번호">
				<input type="text" class="form-control rounded-0" id="goods_nm" name="goods_nm" placeholder="상품 이름">
				<input type="text" class="form-control rounded-0" id="makr" name="makr" placeholder="제조사">
				<input type="text" class="form-control rounded-0" id="goods_category" name="goods_category" placeholder="카테고리">
				<textarea rows="5" class="form-control rounded-0" id="goods_info_text" name="goods_info_text" placeholder="상품 설명"></textarea>
			</div>
			<div class="form-group">
				<p>대표 이미지를 선택해주세요.</p>
				<input type="file" class="form-control rounded-0" id="goods_img"
					name="goods_img"> <br>
				<p>설명 이미지를 선택해주세요.</p>
				<input type="file" class="form-control rounded-0"
					id="goods_info_img" name="goods_info_img">
			</div>
			
		</form>
<button class="btn btn-primary" id="img_upload_btn">이미지 업로드</button>
<div  class="text-right" id="pl_mi_btn" hidden=""><a id="addoption" href="#"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8 3.5a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5H4a.5.5 0 0 1 0-1h3.5V4a.5.5 0 0 1 .5-.5z"/>
  <path fill-rule="evenodd" d="M7.5 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H8.5V12a.5.5 0 0 1-1 0V8z"/>
  <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
</svg></a><a id="minusoption" href="#"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-dash-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  <path fill-rule="evenodd" d="M3.5 8a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.5-.5z"/>
</svg></a></div>

<div id="optioninfo">



</div>
<button id="optionupload" class="btn btn-primary" hidden="">옵션 업로드</button>
	</div>

	<!-- 	<div class="form-group" id="formNum숫자">
			<input type="text" class="form-control rounded-0" id="goods_no" name="goods_no" hidden=""
				value="1">
			<input type="number" class="form-control rounded-0" id="goods_amount" name="goods_amount"
				placeholder="수량">
			<input type="number" class="form-control rounded-0" id="goods_untpc" name="goods_untpc"
				placeholder="가격">
			<input type="text" class="form-control rounded-0" id="goods_size" name="goods_size"
				placeholder="크기">
			<input type="text" class="form-control rounded-0" id="goods_color" name="goods_color"
				placeholder="색상">
		</div> -->
	<script type="text/javascript">
	var formNum = 0;

	function addoptioninfo(){
		var no = $("#goods_no").val();
		var str = '<form class="optionform'+formNum+'">'
		+			'<div class="form-group" id="formNum">'
		+				'<input type="text" class="form-control rounded-0 goods_no" name="goods_no" hidden="" value="'+no+'">'
		+				'<input type="number" class="form-control rounded-0 goods_amount" name="goods_amount" placeholder="수량">'
		+				'<input type="number" class="form-control rounded-0 goods_untpc" name="goods_untpc" placeholder="가격">'
		+				'<input type="text" class="form-control rounded-0 goods_size" name="goods_size" placeholder="크기">'
		+				'<input type="text" class="form-control rounded-0 goods_color" name="goods_color" placeholder="색상">'
		+			'</div></form>';
		formNum = formNum+1;
		$("#optioninfo").append(str);
	
		};
		$(document).ready(function(){
			
			var formData = [];
			$(document).on("click", "#img_upload_btn", function(){
				var formData =  new FormData($("#imgupload")[0]);
				$.ajax({
					type:"POST",
					url:"imgupload",
					data : 
						formData,
					processData : false,
					contentType : false,
					success : function(result){
						console.log("이미지 업로드 성공");
						$("#goods_no").attr("readonly", "readonly");
						$("#optionupload").removeAttr("hidden");
						$("#pl_mi_btn").removeAttr("hidden");
						addoptioninfo();
						},
						error:function(request, status, error){
							console.log(error);
							}
					
					});
				
				});

			$(document).on("click", "#addoption", function(){
				addoptioninfo();
				
				});
			$(document).on("click", "#minusoption", function(){
				formNum = formNum-1;
				$("#optionform"+formNum).remove();
				});

			$(document).on("click", "#optionupload", function(){
				for(var i=0;i<formNum;i++){
					var form={
							"goods_no":$(".optionform"+i).children().children(".goods_no").attr("value"),
							"goods_amount":$(".optionform"+i).children().children(".goods_amount").val(),
							"goods_untpc":$(".optionform"+i).children().children(".goods_untpc").val(),
							"goods_size":$(".optionform"+i).children().children(".goods_size").val(),
							"goods_color":$(".optionform"+i).children().children(".goods_color").val()
							};



					
					
					
					formData.push(form);
					
					}


				console.log(formData);
				var jsonData =JSON.stringify(formData) 
				console.log(jsonData);
				
				
				$.ajax({
					type:"POST",
					url:"optionupload",
					dataType:'text',
					headers: {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "POST"
					},
					data:jsonData,
					success:function(result){
						 location.href="/board/read/"+result; 
						},
					error:function(request,status,error){
						console.log(error);
						}
					
					
					});
					
				
				
				});

			
			
			
			
			
			});
	</script>
</body>
</html>