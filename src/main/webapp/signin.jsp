<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In</title>

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

/* animated background */

@keyframes gradientBG{
0%{background-position:0% 50%;}
50%{background-position:100% 50%;}
100%{background-position:0% 50%;}
}

/* Portal Heading */

.portal-title{
color:white;
font-size:32px;
font-weight:bold;
margin-bottom:25px;
text-align:center;
letter-spacing:1px;
}

/* Login Card */

.login-card{
width:420px;
background:rgba(255,255,255,0.1);
padding:35px;
border-radius:15px;
color:white;
backdrop-filter:blur(12px);
box-shadow:0 10px 30px rgba(0,0,0,0.4);
}

/* Error */

.error{
color:#ffb3b3;
margin-bottom:10px;
font-size:14px;
}

/* Password Eye */

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

/* Button */

.login-btn{
background:#ff7b00;
border:none;
font-weight:bold;
}

.login-btn:hover{
background:#ff9d3f;
}

/* Register link */

a{
color:#ffb347;
text-decoration:none;
}

a:hover{
text-decoration:underline;
}

</style>
</head>

<body>

<h2 class="portal-title">X-Workz Login Portal</h2>

<div class="login-card">

<h4 class="text-center mb-3">Sign In</h4>

<!-- If account locked redirect to reset password page -->
<c:if test="${message == 'ACCOUNT_LOCKED'}">
<script>
window.location.href="resetPassword.jsp?email=${param.email}";
</script>
</c:if>

<!-- Show normal error messages -->
<c:if test="${not empty message && message != 'ACCOUNT_LOCKED'}">
<div class="error text-center">${message}</div>
</c:if>

<c:if test="${not empty error}">
<p style="color:red">${error}</p>
</c:if>
<c:if test="${error == 'Account locked. Reset password.'}">
    <div class="text-center mt-2">
        <a href="resetPassword.jsp?email=${email}" class="btn btn-warning btn-sm">
            Reset Password
        </a>
    </div>
</c:if>

<form action="login"method="post">

<label>Email</label>
<input type="text" name="email" class="form-control mb-3" placeholder="Enter email" required>

<label>Password</label>

<div class="password-box mb-3">
<input type="password" name="password" class="form-control" id="signinPassword" placeholder="Enter password" required>
<span toggle="#signinPassword" class="togglePassword">👁️</span>
</div>

<button class="btn login-btn w-100 mt-2">Login</button>

</form>

<p class="mt-3 text-center">
Don't have account? <a href="signup.jsp">Register</a>
</p>

</div>

<script>

/* Password toggle */

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

</script>

</body>
</html>