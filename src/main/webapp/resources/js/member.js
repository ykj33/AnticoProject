/**
 * 
 */
 'use script';
 
 let email = document.getElementById('email');
 let mid = document.getElementById('mid');

 email.addEventListener('focusout', (event) => {
    // console.log(event.target.value);
    let emailVal = event.target.value;
    let midVal = emailVal.substring(0, emailVal.indexOf('@'));
    mid.value = midVal;
 })