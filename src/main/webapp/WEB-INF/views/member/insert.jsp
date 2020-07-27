<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@ include file="../com/header.jsp"%>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function(){
    //const axios = require('axios');

    let email = document.getElementById('inputEmail');

    console.log(email);

    email.addEventListener('focusout', (event) => {
       console.log(event.target.value);

       let emailVal = event.target.value;

       axios.get('/member/idCheck/'+emailVal)
       .then(function (response) {
          // handle success
          console.log(response);
          if(response.data == "IN_USE"){
             alert('사용중인 이메일입니다.');
          } else {
             alert('사용가능합니다.');
          }
       })
       .catch(function (error) {
          // handle error
          console.log(error);
       })
       .then(function () {
          // always executed
       });
       
    });

 });

 function validateMemberInserForm() {
    let email = document.forms['memberInserForm']['email'].value;
    let mpw = document.forms['memberInserForm']['mpw'].value;
    let reMpw = document.forms['memberInserForm']['reMpw'].value;
    let termsCheck = document.forms['memberInserForm']['termsCheck'].checked;
    
    if (email == '') {
       alert('이메일을 입력해주세요.');
       return false;
    }
    if (mpw == '') {
       alert('패스워드를 입력해주세요.');
       return false;
    }
    if (reMpw == '') {
       alert('패스워드 확인을 입력해주세요.');
       return false;
    }
    if (mpw != reMpw) {
       alert('패스워드와 패스워드 확인이 서로다릅니다.');
       return false;
    }
    if (!termsCheck) {
       alert('이용약관에 동의 해주세요.');
       return false;
    }
 }
</script>
</head>
<body>
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/title.jsp"%>
	<%@ include file="../com/navbar.jsp"%>
	<br>
	<div class="container text-center text-dark">
		<h3>회원가입</h3>
		<form class="mt-4 text-muted" action="/member/insert" method="post" name="memberInserForm" onsubmit="return validateMemberInserForm()">
			<div class="form-group">
				<input type="email" class="form-control rounded-0" id="inputEmail" name="email" placeholder="이메일을 입력해주세요.">
			</div>
			<div class="form-group">
				<input type="password" class="form-control rounded-0" id="inputPassword" name="mpw" placeholder="패스워드를 입력해주세요.">
			</div>
			<div class="form-group">
				<input type="password" class="form-control rounded-0" id="inputRePassword" name="reMpw" placeholder="패스워드를 다시 한번 더 입력해주세요.">
			</div>
			<div class="form-check text-left">
				<input type="checkbox" class="form-check-input" id="termsCheck" > <label class="form-check-label" for="termsCheck">이용약관에 동의합니다.</label>
			</div>
			<div class="text-left mt-2">
				<button type="submit" value="Submit" class="btn btn-outline-dark rounded-0">회원가입</button>
			</div>
		</form>
	</div>
</body>
</html>