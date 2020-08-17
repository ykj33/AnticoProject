	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<style type="text/css">
		.back-to-top {
			cursor: pointer;
			position: fixed;
			bottom: 20px;
			right: 20px;
			display: none;
		}
	</style>
	
	<script>
		$(window).scroll(function () {
		    if ($(this).scrollTop() > 50) {
		        $('#back-to-top').fadeIn();
		    } else {
		        $('#back-to-top').fadeOut();
		    }
		});
	
		// scroll body to 0px on click
		$('#back-to-top').click(function () {
		    $('#back-to-top').tooltip('hide');
		    $('body,html').animate({
		        scrollTop: 0
		    }, 800);
		    return false;
		});
	
		$('#back-to-top').tooltip('show');

		// footer 주소줄에 member가 포함할때 바닥에 고정.
		document.addEventListener('DOMContentLoaded', () => {
			if(document.location.href.indexOf('/member') > -1) {
				let footer = document.querySelector('footer');
				footer.setAttribute('class', 'fixed-bottom container-fluid text-center text-secondary');
			}
		});
	</script>
	
	<a id="back-to-top" href="#" class="btn btn-secondary btn-md back-to-top" role="button" title="Click to return on the top page" 
		data-toggle="tooltip" data-placement="left"><span class="btn btn-secondary">^</span></a>
		
	<footer class="container-fluid text-center text-secondary">
		<hr>
		<p>000회사  대표이사 000  사업자번호  000-0000-000 </p>
		<p>Tel. 02-123-4567  Fax. 02-456-1233  E-mail OOOO@naver.com</p>
		<p>서울시 광진구 뚝섬로00길 00 (자양4동, 000건물)</p>
	</footer>