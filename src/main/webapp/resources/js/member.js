/**
 * 
 */
 'use script';


 document.addEventListener('DOMContentLoaded', function(){
      //const axios = require('axios');

      let email = document.getElementById('inputEmail');
      let mid = document.getElementById('inputMid');

      console.log(email);

      email.addEventListener('focusout', (event) => {
         console.log(event.target.value);

         let emailVal = event.target.value;
         let midVal = emailVal.substring(0, emailVal.indexOf('@'));

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
         
         mid.value = midVal;
         console.log(midVal);
      });

   });
 
   function validateMemberInserForm() {
      let mid = document.forms['memberInserForm']['mid'].value;
      let email = document.forms['memberInserForm']['email'].value;
      let mpw = document.forms['memberInserForm']['mpw'].value;
      let reMpw = document.forms['memberInserForm']['reMpw'].value;
      let termsCheck = document.forms['memberInserForm']['termsCheck'].checked;
      
      if (mid == '') {
         alert('이메일을 다시 한번 입력해주세요.');
         return false;
      }
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

   function validateMemberLoginForm() {
      let mid = document.forms['memberLoginForm']['mid'].value;
      let email = document.forms['memberLoginForm']['email'].value;
      let mpw = document.forms['memberLoginForm']['mpw'].value;
      let RemembeMeCheck = document.forms['memberLoginForm']['RemembeMeCheck'].checked;
      
      if (mid == '') {
         alert('이메일을 다시 한번 입력해주세요.');
         return false;
      }
      if (email == '') {
         alert('이메일을 입력해주세요.');
         return false;
      }
      if (mpw == '') {
         alert('패스워드를 입력해주세요.');
         return false;
      }  
   }