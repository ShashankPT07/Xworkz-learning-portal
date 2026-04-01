<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Workz Registration Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- FONT AWESOME -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body{
min-height:100vh;
display:flex;
flex-direction:column;
align-items:center;
font-family:'Segoe UI',sans-serif;
background:linear-gradient(-45deg,#141e30,#243b55,#0f2027,#2c5364);
background-size:400% 400%;
animation:gradientBG 10s ease infinite;
padding-top:40px;
}
@keyframes gradientBG{
0%{background-position:0% 50%;}
50%{background-position:100% 50%;}
100%{background-position:0% 50%;}
}
.pageHeading{
font-size:34px;
font-weight:bold;
color:white;
margin-bottom:25px;
letter-spacing:2px;
text-align:center;
text-shadow:0 3px 10px rgba(0,0,0,0.6);
}
.cardBox{
width:380px;
padding:25px;
border-radius:10px;
background:rgba(255,255,255,0.1);
backdrop-filter:blur(12px);
box-shadow:0 10px 25px rgba(0,0,0,0.4);
color:white;
}
.title{
text-align:center;
font-size:22px;
font-weight:bold;
margin-bottom:15px;
color:#ff7b00;
}
.formGroup{ margin-bottom:12px; }
label{ font-size:13px; }
input,select{
width:100%;
padding:7px;
border:none;
border-radius:5px;
margin-top:3px;
outline:none;
}
.error{
font-size:13px;
color:#ff4d4d;
text-align:center;
margin-bottom:10px;
}
button{
width:100%;
padding:10px;
border:none;
border-radius:6px;
background:#ff7b00;
color:white;
font-size:15px;
font-weight:bold;
margin-top:10px;
transition:0.3s;
}
button:hover{
background:#ff9d3f;
}
.passwordBox{ position:relative; }
.togglePassword{
position:absolute;
right:10px;
top:32px;
cursor:pointer;
font-size:16px;
color:#ffb347;
}
.togglePassword:hover{ color:#ffffff; }
a{ color:#ffb347; text-decoration:none; }
a:hover{ text-decoration:underline; }
</style>

<script>
function validate(){

let valid=true;

let name=document.getElementById("name").value;
let email=document.getElementById("email").value;
let phone=document.getElementById("phone").value;
let username=document.getElementById("username").value;
let password=document.getElementById("password").value;
let confirm=document.getElementById("confirm").value;

/* Name */
let nameCheck=/^[A-Z][a-zA-Z]*(\s[A-Z][a-zA-Z]*)*$/;
if(!nameCheck.test(name)){
document.getElementById("nameError").innerHTML="Start with capital letter";
valid=false;
}else{
document.getElementById("nameError").innerHTML="";
}

/* Email */
let emailCheck=/^[a-zA-Z0-9._]+@gmail\.com$/;
if(!emailCheck.test(email)){
document.getElementById("emailError").innerHTML="Must end with @gmail.com";
valid=false;
}else{
document.getElementById("emailError").innerHTML="";
}

/* Phone */
let phoneCheck=/^[6-9][0-9]{9}$/;
if(!phoneCheck.test(phone)){
document.getElementById("phoneError").innerHTML="Invalid phone number";
valid=false;
}else{
document.getElementById("phoneError").innerHTML="";
}

/* Username */
if(username.toLowerCase() !== email.toLowerCase()){
document.getElementById("usernameError").innerHTML="Username must match email";
valid=false;
}else{
document.getElementById("usernameError").innerHTML="";
}

/* Password */
let passCheck=/^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[@$!%*#?&]).{8,}$/;
if(!passCheck.test(password)){
document.getElementById("passwordError").innerHTML="Weak password";
valid=false;
}else{
document.getElementById("passwordError").innerHTML="";
}

/* Confirm */
if(password !== confirm){
document.getElementById("confirmError").innerHTML="Passwords not matching";
valid=false;
}else{
document.getElementById("confirmError").innerHTML="";
}

return valid;
}

/* Password toggle */
document.addEventListener("DOMContentLoaded", function(){
const toggles=document.querySelectorAll(".togglePassword");
toggles.forEach(function(el){
el.addEventListener("click", function(){
const input=document.querySelector(el.getAttribute("toggle"));
const icon=el.querySelector("i");
if(input.type==="password"){
input.type="text";
icon.classList.remove("fa-eye");
icon.classList.add("fa-eye-slash");
}else{
input.type="password";
icon.classList.remove("fa-eye-slash");
icon.classList.add("fa-eye");
}
});
});
});
</script>

</head>

<body>

<div class="pageHeading">
X-Workz Registration Portal
</div>

<div class="cardBox">

<div class="title">Create Account</div>

<c:if test="${not empty errMessage}">
    <div class="error">${errMessage}</div>
</c:if>

<form action="signup" method="post" onsubmit="return validate()">

<div class="formGroup">
<label>Name</label>
<input type="text" id="name" name="name">
<div class="error" id="nameError"></div>
</div>

<div class="formGroup">
<label>Surname</label>
<input type="text" name="surname">
</div>

<div class="formGroup">
<label>Email</label>
<input type="text" id="email" name="email">
<div class="error" id="emailError"></div>
</div>

<div class="formGroup">
<label>Phone Number</label>
<input type="text" id="phone" name="phoneNumber">
<div class="error" id="phoneError"></div>
</div>

<div class="formGroup">
<label>Gender</label>
<select name="gender">
<option value="">Select Gender</option>
<option>Male</option>
<option>Female</option>
<option>Other</option>
</select>
</div>

<div class="formGroup">
<label>Username</label>
<input type="text" id="username" name="username">
<div class="error" id="usernameError"></div>
</div>

<div class="formGroup passwordBox">
<label>Password</label>
<input type="password" id="password" name="password">
<span toggle="#password" class="togglePassword">
    <i class="fa-solid fa-eye"></i>
</span>
<div class="error" id="passwordError"></div>
</div>

<div class="formGroup passwordBox">
<label>Confirm Password</label>
<input type="password" id="confirm" name="confirmPassword">
<span toggle="#confirm" class="togglePassword">
    <i class="fa-solid fa-eye"></i>
</span>
<div class="error" id="confirmError"></div>
</div>

<button type="submit">Register</button>

</form>

<p class="text-center mt-2">
Already have account? <a href="signin.jsp">Sign In</a>
</p>

</div>

</body>
</html>