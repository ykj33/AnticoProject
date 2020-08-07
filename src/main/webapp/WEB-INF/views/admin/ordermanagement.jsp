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
<title>배송 관리</title>
</head>
<body>
	<%@ include file="../com/header.jsp"%>
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/title.jsp"%>
		
<div class="container">
		<%@ include file="../com/navbar.jsp"%>
<div id="delivery_list">


</div>

	<table id="delivery_table" class="table table-striped">
		<thead>
		
			<tr>
				<th>주문 번호</th>
				<th>주문 일자</th>
				<th>환송 사유</th>
				<th>주문 처리 상태</th>
			</tr>
		</thead>
		
		<tbody>
		
		
		</tbody>
	
	</table>


</div>

<script type="text/javascript">

$(document).ready(function(){
	list_fresh();

	


	$(document).on("change", ".status_select", function(){
		let info = $(this).val();
		let no = $(this).attr("data-no");

		$.ajax({
			type:'post',
			url:'statuschange',
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "POST"
			},
			data:JSON.stringify({
				info:info,
				no:no,
				}),
			success:function(result){
				console.log('성공');
				list_fresh();
				
				},
			error:function(request, status, error){
				console.log(error);
				}
			});
		
		});

	
	
});


function list_fresh(){
	$("#delivery_table").children("tbody").empty();
	$.ajax({
		type:'get',
		url:'deliverylist',
		dataType:'text',
		success:function(result){
			let data = JSON.parse(result);
			for(let i=0; i<data.length;i++){
				
			var str = 	'<tr class="tr"'+i+'>'
						+'<td>'+data[i].order_no+'</td>'
						+'<td>'+data[i].order_date+'</td>'
						+'<td>';
						
			if(data[i].frwll_reason_code!=null){
				str += data[i].frwll_reason_code;
				}


				str +='</td><td class="option">' 
						+'<select class="status_select se'+i+'" data-no="'+data[i].order_no+'">'
						+'<option value="취소" class="취소">취소</option>'
						+'<option value="배송 준비 중" class="배송 준비 중">배송 준비 중</option>'
						+'<option value="배송 중" class="배송 중">배송 중</option>'
						+'<option value="배송 완료" class="배송 완료">배송 완료</option>'
						+'<option value="반송 중" class="반송 중">반송 중</option>'
						+'</select></td>'
						+'</tr>';


						
						
			$("#delivery_table").children("tbody").append(str);
			$(".se"+i).children("[value='"+data[i].order_pro_sttus_code+"']").attr("selected", "selected");
			}
			},
		error:function(request, status, error){
			console.log(error);
			}
		
		
		});
}

</script>

</body>
</html>