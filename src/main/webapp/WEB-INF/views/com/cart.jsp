	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<script>
		document.addEventListener('DOMContentLoaded', () => {

			data_cart = [];
			data_email = '${login.email }';
			let hide = document.getElementById('hide');
			let list = document.getElementById('list');
			let totalPrice = document.getElementById('totalPrice');

			// 장바구니 창에 X표시를 클릭시.
			hide.addEventListener('click', () => {
				cartHide();
			});

			// 장바구니 리스트의 - + 버튼들을 클릭시.
			list.addEventListener('click', (event) => {
				let element = event.target;
				let strClass = element.getAttribute('class');
				let qtysRow = element.parentNode.parentNode;
				let	qtys = qtysRow.getElementsByClassName('qtys')[0];
				let price = qtysRow.parentNode.parentNode.getElementsByClassName('price')[0];
				let data_u_price = price.getAttribute('data-u-price');
				let strNum = qtys.innerHTML;
				strNum = strNum.replace(',', '');

				if(strClass.indexOf('minus') > -1) {
					let row = qtysRow.parentNode.parentNode;
					let cartId = row.getAttribute('data-id');
					let result = Number(strNum) - 1;
					qtys.innerHTML = result;
					price.innerHTML = numberWithCommas(result * Number(data_u_price));
					
					if(result > 0) {
						updatecart(cartId, result);
					} else {
						deletecart(cartId);
						row.remove();
					}
				}

				if(strClass.indexOf('plus') > -1) {
					let row = qtysRow.parentNode.parentNode;
					let cartId = row.getAttribute('data-id');
					let result = Number(strNum) + 1;
					qtys.innerHTML = result;
					price.innerHTML = numberWithCommas(result * Number(data_u_price));

					updatecart(cartId, result);
				}

				// 장바구 아이템의 총액을 계산후 표시.
				cartTotalPrice();
			});
		});

		// 장바구 아이템의 총액을 계산후 표시.
		function cartTotalPrice() {
			let prices = list.getElementsByClassName('price');
			let sumPrice = 0;
			for (let i = 0; i < prices.length; i++) {
				const element = prices[i];
				let strPrice = element.innerHTML;
				let numPrice = strPrice.replace(',', '');
				if(Number(numPrice) !== NaN) {
					sumPrice += Number(numPrice);
				}
			}
			totalPrice.innerHTML = numberWithCommas(sumPrice);
		};

		// 자리수 표시(3자리 마다, 표시)
		function numberWithCommas(num) {
			let strNum = String(num).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			return strNum;
		};

		function addCart(data_option, data_email) {
			if(data_email == '') {
				alert('장바구니는 로그인후 이용 가능합니다.');
				console.log('data_email ', data_email );
				location.href = '/member/login';
				return;
			}

			if(data_cart.length === 0) {
				ajaxGetCartList(data_email);
			}
			
			let idx = data_cart.length;
			// 장바구니에 중복되는 상품이 있는지 확인함.
			for (let i = 0; i < idx; i++) {
				const arr = data_cart[i];
				if(data_option.goods_no == arr.goods_no
				&& data_option.goods_color == arr.goods_color
				&& data_option.goods_size == arr.goods_size) {
					alert('같은 상품이 존재 합니다.');
					cartShow();
					return;
				};
			}

			// 새로운 상품 data
			let newCart = {
				cart_id : 0,
				email : data_email,
				goods_no : data_option.goods_no,
				goods_img : data_option.goods_img,
				goods_nm : data_option.goods_nm,
				goods_color : data_option.goods_color,
				goods_size : data_option.goods_size,
				goods_qtys : 1,
				goods_untpc : data_option.goods_untpc
			};

			// ajax 장바구니 추가.
			ajaxAddCart(newCart);
			
			// 장바구 아이템의 총액을 계산후 표시.
			cartTotalPrice();

			// 장바구니 리스트 가져옴.
			//ajaxGetCartList(data_email);
			
			// 장바구니 열림
			cartShow();
		};

		// 장바구니 열기 
		function cartShow() {	
			window.scrollTo(0, 0);
			$('.collapse').collapse('toggle');
		};

		// 장바구니 닫기 
		function cartHide() {
			$('.collapse').collapse('hide');
		}

		// 새로운 상품을 카트에 등록 
		function ajaxAddCart(newCart) {
			axios({
				method: 'post',
				url: '/board/addcart',
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "POST"
				},
				data: JSON.stringify(newCart),
				responseType: 'text'
			}).then(function (response) {

				console.log('상품등록 ajax response >>', response);

				if(response.data) {
					// 업데이트 된 list를 localdata data_cart에 추가한다.
					data_cart = response.data;

					// 장바구니 리스트 업데이트 HTML
					cartUpdateHTML();
				}
				
			});
		}

		// 장바구니 등록된 리스트 가져오기.
		function ajaxGetCartList(data_email) {
			if(data_email == '') {
				alert('장바구니는 로그인후 이용 가능합니다.');
				window.location.href = '/member/login';
				return;
			}
			
			// ajax
			axios({
				  method: 'get',
				  url: '/board/getcartlist',
				  params: {
					  	email: data_email
					}, 
				}).then(function (response) {
				    console.log('response.data', response.data);
				    data_cart = response.data;

				    if(response.data) {
						// 업데이트 된 list를 localdata data_cart에 추가한다.
						data_cart = response.data;

						// 장바구니 리스트 업데이트 HTML
						cartUpdateHTML();
					}
				});
		}

		// 장바구니 상품 수량 변경.
		function updatecart(cart_id, goods_qtys) {
			let cart = {
					cart_id : cart_id, email : '', goods_no : '', goods_img : '', goods_nm : '', goods_color : '', goods_size : '',
					goods_qtys : goods_qtys, goods_untpc : 0
			};
			
			axios({
				method: 'post',
				url: '/board/updatecart',
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "POST"
				},
				data: JSON.stringify(cart),
				responseType: 'text'
			}).then(function (response) {
				console.log('updatecart >> ', response.data)
			});
		}

		// 장바구니 상품 수량 변경.
		function deletecart(cart_id) {
			let cart = {
					cart_id : cart_id, email : '', goods_no : '', goods_img : '', goods_nm : '', goods_color : '', goods_size : '',
					goods_qtys : 0, goods_untpc : 0
			};
			
			axios({
				method: 'post',
				url: '/board/deletecart',
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "POST"
				},
				data: JSON.stringify(cart),
				responseType: 'text'
			}).then(function (response) {
				console.log('deletecart >> ', response.data);
				ajaxGetCartList(data_email);
			});
		}

		// 장바구니 리스트 업데이트 HTML
		function cartUpdateHTML() {
			let str = ''

			for (let i = 0; i < data_cart.length; i++) {
				const cart = data_cart[i];

				// 동적 테이블 생성
				const price = numberWithCommas(cart.goods_untpc * cart.goods_qtys);
				
				str += 
				`<div class="row ml-4 mb-2 text-center" data-id="\${cart.cart_id}">
					<div class="col-md-1"><img src="/displayfile?img_name=${cart.goods_img}" width="60px" height="60px"></div>
					<div class="col-md-5">\${cart.goods_nm}</div>
					<div class="col-md-1">\${cart.goods_size}</div>
					<div class="col-md-1">\${cart.goods_color}</div>
					<div class="col-md-2 line">
					<div class="row">
						<div class="col"><p class="btn btn-block minus">-</p></div>
						<div class="col mt-2"><p class="qtys">\${cart.goods_qtys}</p></div>
						<div class="col"><p class="btn btn-block plus text-muted">+</p></div>
					</div>
				</div>
				<div class="col-md-2 price" data-u-price="\${cart.goods_untpc}">\${price}</div>
				</div>`;
			}

			list.innerHTML = str;
				// 장바구 아이템의 총액을 계산후 표시.
			cartTotalPrice();
		}
	</script>
	
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
			<div class="row ml-4 text-center">
				<div class="col-md-1">이미지</div>
				<div class="col-md-5">타이틀</div>
				<div class="col-md-1">사이즈</div>
				<div class="col-md-1">색상</div>
				<div class="col-md-2">수량</div>
				<div class="col-md-2">가격</div>
			</div>

			<div class="" id="list">

				<!-- <div class="row ml-4 mb-2 text-center">
					<div class="col-md-1"><img src="/displayfile?img_name=${dto.goods_img}" width="60px" height="60px"></div>
					<div class="col-md-5">이쁜이들은 어떤 마스크를 쓸까?</div>
					<div class="col-md-1">free</div>
					<div class="col-md-1">blue</div>
					<div class="col-md-2 line">
						<div class="row">
							<div class="col"><p class="btn minus">-</p></div>
							<div class="col mt-2"><p class="amount">1</p></div>
							<div class="col"><p class="btn plus text-muted">+</p></div>
						</div>
					</div>
					<div class="col-md-2 price" data-u-price="15900">15,900</div>
				</div> -->

			</div>
			
			<div class="row text-right">
				<div class="col-md mr-5">
					<h3 id="totalPrice">0</h3>
					<a href="/order/payment" class="btn btn-outline-dark rounded-0">결제하기</a>
				</div>
			</div>
			<hr>
		</div>
	</div>