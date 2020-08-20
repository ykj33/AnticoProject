<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<title>Antico</title>
	<%@ include file="../com/header.jsp"%>
	<script>
		document.addEventListener("DOMContentLoaded", () => {

			// local data
			let data_option = {
				goods_no: '${dto.goods_no }'
				, goods_color: '${dto.goods_colors[0].goods_color }'
				, goods_size: '${dto.goods_sizes[0].goods_size }'
				, goods_untpc: '${dto.goods_untpc }'
				, goods_nm: '${dto.goods_nm }'
				, goods_img: '${dto.goods_img}'
			};


			let btnCollapse = document.getElementById('btnCollapse');
			let option = document.getElementById('option');

			// 상품 가격에 3자리마다 "," 추가
			document.getElementById('untpc').innerHTML = numberWithCommas(data_option.goods_untpc);

			// 구매 버튼 
			btnCollapse.addEventListener('click', () => {
				addCart(data_option);
			});

			// 상품에 option의 버튼들을 클릭시.
			option.addEventListener('click', (event) => {
				let selectedElement = event.target;
				let selectedClassName = selectedElement.getAttribute('class');

				if (selectedClassName.indexOf('goods_color') > -1) {
					let allGoodsColorArr = Array.from(document.getElementsByClassName('goods_color'));
					allGoodsColorArr.forEach((goodsColorElement) => goodsColorElement.setAttribute('class', 'btn btn-sm goods_color'));
					selectedElement.setAttribute('class', 'btn btn-sm goods_color font-weight-bold');
					data_option.goods_color = selectedElement.innerHTML;
				}

				if (selectedClassName.indexOf('goods_size') > -1) {
					let allGoodsSizeArr = Array.from(document.getElementsByClassName('goods_size'));
					allGoodsSizeArr.forEach((goodsSizeElement) => goodsSizeElement.setAttribute('class', 'btn btn-sm goods_size'));
					selectedElement.setAttribute('class', 'btn btn-sm goods_size font-weight-bold');
					data_option.goods_size = selectedElement.innerHTML;
				}

				axios({
					method: 'get',
					url: '/board/option',
					params: {
						goods_no: data_option.goods_no,
						goods_color: data_option.goods_color,
						goods_size: data_option.goods_size
					},
				}).then(function (response) {
					// console.log('response.data', response.data);
					let dto = response.data;
					// console.log('data', dto);
					if (dto) {

						let colors = dto.goods_colors;
						let sizes = dto.goods_sizes;
						let untpc = dto.goods_untpc;
						data_option.goods_untpc = untpc;

						let str = `
							<!-- 옵션 color  -->
							<div class="row">`;
						str += colors.map((item) => {
							if (item.goods_color === dto.goods_color) {
								return `
								<div class="col-md">
									<p class="btn btn-sm goods_color font-weight-bold">\${item.goods_color}</p>
								</div>`;
							} else {
								return `
								<div class="col-md">
									<p class="btn btn-sm goods_color">\${item.goods_color}</p>
								</div>`;
							}
						}).join('');

						str +=	`
							</div>
							<!-- 옵션 size  -->
							<div class="row">`;

						str += sizes.map((item) => {
							if (item.goods_size === dto.goods_size) {
								return `
								<div class="col-md">
									<p class="btn btn-sm goods_size font-weight-bold">\${item.goods_size}</p>
								</div>`;
							} else {
								return `
								<div class="col-md">
									<p class="btn btn-sm goods_size">\${item.goods_size}</p>
								</div>`;
							}
						}).join('');

						str += `
							</div>
							<!-- 옵션 color와 size에 따른 가격  -->
							<div class="row">
								<div class="col-md ml-2 mt-5">
									<h3><strong class="goods_untpc" id="untpc">\${numberWithCommas(dto.goods_untpc)}</strong>원</h3>
								</div>
							</div>`;
						option.innerHTML = str;

						// 상품 제고 수량에 따라 구매 or 재고업음 으로 표시 	
						if (dto.goods_amount > 0) {
							btnCollapse.setAttribute('disarbled', 'disarbled');
							btnCollapse.innerHTML = '구매';
						} else {
							btnCollapse.removeAttribute('disarbled');
							btnCollapse.innerHTML = '재고없음';
						}
					}
				});
			});
		}); // DOMContentLoaded
	</script>
</head>

<body>
	<!-- 장바구니 리스트  -->
	<%@ include file="../com/cart.jsp" %>
	<!-- 장바구니 버튼, 로그인 | 회원가입 버튼   -->
	<%@ include file="../com/top.jsp" %>
	<!-- 타이틀(홈 링크)   -->
	<%@ include file="../com/title.jsp" %>
	<!-- 상단 네비게이션 메뉴 -->
	<%@ include file="../com/navbar.jsp"%>

	<div class="container h-100">
		<img id="main" src="/displayfile?img_name=${dto.goods_info_img}" width="100%" />

		<h3 class="text-muted mt-4">${dto.goods_nm}</h3>

		<div class="row">
			<div class="col-md-8">
				<pre class="text-muted mt-4"
					style="overflow: auto; white-space: pre-wrap;">${dto.goods_info_text }</pre>
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
						<h3><strong class="goods_untpc" id="untpc">${dto.goods_untpc }</strong>원</h3>
					</div>
				</div>

			</div>
		</div>
		<c:if test="${dto.goods_amount > 0 }">
			<button type="button" class="btn btn-outline-dark rounded-0 btn-lg btn-block mt-5 mb-5"
				id="btnCollapse">구매</button>
		</c:if>
		<c:if test="${dto.goods_amount <= 0 }">
			<button type="button" class="btn btn-outline-dark rounded-0 btn-lg btn-block mt-5 mb-5" id="btnCollapse"
				disabled="disabled">재고없음</button>
		</c:if>

	</div>
	<%@ include file="../com/footer.jsp"%>
</body>

</html>