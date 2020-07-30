<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<title>이쁜이들 마스크</title>
	<%@ include file="../com/header.jsp"%>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script>
		document.addEventListener("DOMContentLoaded", () => {

			let data = { option: { goods_no:'${dto.goods_no }', goods_color: '${dto.goods_colors[0].goods_color }', goods_size: '${dto.goods_sizes[0].goods_size }' } };
			let btnCollapse = document.getElementById('btnCollapse');
			let hide = document.getElementById('hide');
			let option = document.getElementById('option');

			btnCollapse.addEventListener("click", () => {
				window.scrollTo(0, 0);
				$('.collapse').collapse('show');
			});

			hide.addEventListener("click", () => {
				$('.collapse').collapse('hide');
			});

			option.addEventListener('click', (event) => {
				console.log(event.target);
				let element = event.target;
				let strClass = element.getAttribute('class');
				console.log(element.getAttribute('class'));

				if (strClass.indexOf('goods_color') > -1) {
					console.log('@ goods_color click !!');

					let gcArr = document.getElementsByClassName('goods_color');
					for (let i = 0; i < gcArr.length; i++) {
						const element = gcArr[i];
						element.setAttribute('class', 'btn btn-sm goods_color');
					}
					element.setAttribute('class', 'btn btn-sm goods_color font-weight-bold');
					data.option.goods_color = element.innerHTML;
				}

				if (strClass.indexOf('goods_size') > -1) {
					console.log('@ goods_size click !!');

					let gsArr = document.getElementsByClassName('goods_size');
					for (let i = 0; i < gsArr.length; i++) {
						const element = gsArr[i];
						element.setAttribute('class', 'btn btn-sm goods_size');
					}
					element.setAttribute('class', 'btn btn-sm goods_size font-weight-bold');
					data.option.goods_size = element.innerHTML;
				}

				console.log('>>', data);

				// ajax
				axios({
					  method: 'get',
					  url: '/board/option?goods_color='+data.option.goods_color+'&goods_size='+data.option.goods_size+'&goods_no='+data.option.goods_no,
						
					})
					  .then(function (response) {
					    console.log('response.data', response.data);
						let data = response.data;
						console.log('data', data);
					    if(data) {
							// 가격확인.
							console.log('data.goods_untpc',data.goods_untpc);
							console.log('data.goods_color',data.goods_color);
							console.log('data.goods_size',data.goods_size);
							console.log('data.goods_colors',data.goods_colors);
							console.log('data.goods_sizes',data.goods_sizes);
							console.log('data.goods_amount',data.goods_amount);

							let colors = data.goods_colors;
							let sizes = data.goods_sizes;
							//console.log(colors.length);
							//console.log(sizes.length);
							
							let str = '';
										str +='<!-- 옵션 color  -->'
										str +='<div class="row">'
								for (let i = 0; i < colors.length; i++) {
									const dto = colors[i];
									// console.log(dto.goods_color, data.goods_color);
									if (dto.goods_color === data.goods_color) {
										str +=	'<div class="col-md">'
										str +=		'<p class="btn btn-sm goods_color font-weight-bold">'+dto.goods_color+'</p>'
										str +=	'</div>'
									} else {
										str +=	'<div class="col-md">'
										str +=		'<p class="btn btn-sm goods_color">'+dto.goods_color+'</p>'
										str +=	'</div>'
									}
								}
										str +='</div>'
										str +='<!-- 옵션 size  -->'
										str +='<div class="row">'
								// console.log(sizes);
								for (let i = 0; i < sizes.length; i++) {
									const dto = sizes[i];
									// console.log(dto.goods_size, data.goods_size);
									if (dto.goods_size === data.goods_size) {
										str +=	'<div class="col-md">'
										str +=		'<p class="btn btn-sm goods_size font-weight-bold">'+dto.goods_size+'</p>'
										str +=	'</div>'
									} else {
										str +=	'<div class="col-md">'
										str +=		'<p class="btn btn-sm goods_size">'+dto.goods_size+'</p>'
										str +=	'</div>'
									}
								}
										str +='</div>'
										str +='<!-- 옵션 color와 size에 따른 가격  -->'
										str +='<div class="row">'
										str +=	'<div class="col-md ml-2 mt-5">'
										str +=		'<h3><strong class="goods_untpc">'+data.goods_untpc+'</strong>원</h3>'
										str +=	'</div>'
										str +='</div>';
							// console.log(str);
							option.innerHTML = str;

							if(data.goods_amount > 0) {
								btnCollapse.setAttribute('disarbled', 'disarbled');
							} else {
								btnCollapse.removeAttribute('disarbled');
							}
						}
					  });
			});
		});
	</script>
</head>

<body>
	<div class="clearfix text-secondary">
		<div class="collapse" id="collapseExample">
			<div class="text-right text-primary mr-2">
				<svg id="hide" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
					<path fill-rule="evenodd"
						d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z" />
					<path fill-rule="evenodd"
						d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z" />
				</svg>
			</div>
			<div class="row ml-4">
				<div class="col-md-1">이미지</div>
				<div class="col-md-5">타이틀</div>
				<div class="col-md-1">사이즈</div>
				<div class="col-md-1">색상</div>
				<div class="col-md-2">수량</div>
				<div class="col-md-2">가격</div>
			</div>

			<div class="row ml-4">
				<%-- 			<div class="col-md-1"><img src="${uploadPath + read.goods_img}" width="60px" height="60px"></div> --%>



				<div class="col-md-5">이쁜이들은 어떤 마스크를 쓸까?</div>
				<div class="col-md-1">free</div>
				<div class="col-md-1">blue</div>
				<div class="col-md-2">
					<button type="button" class="btn">-</button>
					1
					<button type="button" class="btn">+</button>
				</div>
				<div class="col-md-2">15,900</div>

			</div>

			<hr>
		</div>
	</div>

	<!--장바구니, 로그인 | 회원가입   -->
	<%@ include file="../com/top.jsp"%>
	<!--타이틀(홈 링크)   -->
	<%@ include file="../com/title.jsp"%>

	<div class="container">
		<%@ include file="../com/navbar.jsp"%>
		<img id="main" src="/displayfile?img_name=${dto.goods_info_img}" width="100%" />

		<h3 class="text-muted mt-4">${dto.goods_nm}</h3>

		<div class="row">
			<div class="col-md-8">
				<pre class="text-muted mt-4">${dto.goods_info_text }</pre>
			</div>
			<div class="col-md-4 mt-4 text-muted" id="option">
				<!-- 옵션 color  -->
				<div class="row">
					<c:forEach items="${dto.goods_colors }" var="option" varStatus="status">
						<c:if test="${status.index eq 0 }">
							<div class="col-md">
								<p class="btn btn-sm goods_color font-weight-bold">${option.goods_color }</p>
							</div>
						</c:if>
						<c:if test="${status.index ne 0 }">
							<div class="col-md">
								<p class="btn btn-sm goods_color">${option.goods_color }</p>
							</div>
						</c:if>
					</c:forEach>
				</div>

				<!-- 옵션 size  -->
				<div class="row">
					<c:forEach items="${dto.goods_sizes }" var="option" varStatus="status">
						<c:if test="${status.index eq 0 }">
							<div class="col-md">
								<p class="btn btn-sm goods_size font-weight-bold">${option.goods_size }</p>
							</div>
						</c:if>
						<c:if test="${status.index ne 0 }">
							<div class="col-md">
								<p class="btn btn-sm goods_size">${option.goods_size }</p>
							</div>
						</c:if>
					</c:forEach>
				</div>

				<!-- 옵션 color와 size에 따른 가격  -->
				<div class="row">
					<div class="col-md ml-2 mt-5">
						<h3><strong class="goods_untpc">${dto.goods_untpc }</strong>원</h3>
					</div>
				</div>

			</div>
		</div>
		<c:if test="${dto.goods_amount > 0 }">
			<button type="button" class="btn btn-outline-dark rounded-0 btn-lg btn-block mt-5 mb-5" id="btnCollapse" >구매</button>
		</c:if>
		<c:if test="${dto.goods_amount <= 0 }">
			<button type="button" class="btn btn-outline-dark rounded-0 btn-lg btn-block mt-5 mb-5" id="btnCollapse" disabled="disabled">재고없음</button>
		</c:if>
		
		<%@ include file="../com/footer.jsp"%>
	</div>
</body>

</html>