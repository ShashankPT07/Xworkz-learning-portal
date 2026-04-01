<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background:linear-gradient(-45deg,#141e30,#243b55,#0f2027,#2c5364);
background-size:400% 400%;
animation:gradientBG 10s ease infinite;
min-height:100vh;
display:flex;
flex-direction:column;
justify-content:center;
align-items:center;
font-family:Segoe UI;
}

@keyframes gradientBG{
0%{background-position:0% 50%;}
50%{background-position:100% 50%;}
100%{background-position:0% 50%;}
}

.portal-title{
color:white;
font-size:32px;
font-weight:bold;
margin-bottom:25px;
text-align:center;
letter-spacing:1px;
}

.reset-card{
width:420px;
background:rgba(255,255,255,0.1);
padding:35px;
border-radius:15px;
color:white;
backdrop-filter:blur(12px);
box-shadow:0 10px 30px rgba(0,0,0,0.4);
}

.password-box{
position:relative;
}

.togglePassword{
position:absolute;
right:10px;
top:8px;
cursor:pointer;
font-size:18px;
}

.reset-btn{
background:#ff7b00;
border:none;
font-weight:bold;
}

.reset-btn:hover{
background:#ff9d3f;
}

.error{
color:#ffb3b3;
margin-bottom:10px;
font-size:14px;
}

.success{
color:#b3ffcc;
margin-bottom:10px;
font-size:14px;
}

</style>
</head>

<body>

<h2 class="portal-title">X-Workz Login Portal</h2>

<div class="reset-card">

<h4 class="text-center mb-3">Create New Password</h4>

<c:if test="${not empty message}">
<div class="success text-center">${message}</div>
</c:if>

<div id="errorMsg" class="error text-center"></div>

<form action="resetPassword" method="post" onsubmit="return validatePassword()">

<input type="hidden" name="email" value="${param.email}">

<label>Email</label>
<input type="text" class="form-control mb-2" value="${param.email}" readonly>

<label>New Password</label>

<div class="password-box mb-3">
<input type="password" name="newPassword" class="form-control"
id="newPassword" placeholder="Enter new password" required>
<span toggle="#newPassword" class="togglePassword">👁️</span>
</div>

<label>Confirm Password</label>

<div class="password-box mb-3">
<input type="password" name="confirmPassword" class="form-control"
id="confirmPassword" placeholder="Confirm password" required>
<span toggle="#confirmPassword" class="togglePassword">👁️</span>
</div>

<button class="btn reset-btn w-100 mt-2">Update Password</button>

</form>

</div>

<script>

/* Password show/hide */

document.addEventListener("DOMContentLoaded", function(){

const togglePassword = document.querySelectorAll('.togglePassword');

togglePassword.forEach(function(el){

el.addEventListener('click', function(){

const input = document.querySelector(el.getAttribute('toggle'));

if(input.type === "password"){
input.type = "text";
el.textContent = "🙈";
}else{
input.type = "password";
el.textContent = "👁️";
}

});

});

});


/* Password Validation */

function validatePassword(){

let password = document.getElementById("newPassword").value;
let confirmPassword = document.getElementById("confirmPassword").value;
let error = document.getElementById("errorMsg");

/* Regex for strong password */

let regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$/;

if(!regex.test(password)){
error.innerHTML="Password must contain 8 characters, uppercase, lowercase, number and special character.";
return false;
}

if(password !== confirmPassword){
error.innerHTML="Passwords do not match.";
return false;
}

error.innerHTML="";
return true;

}

</script>

</body>
</html>