<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Successful</title>

<style>

body{
font-family:'Segoe UI',sans-serif;
background:linear-gradient(-45deg,#141e30,#243b55,#0f2027,#2c5364);
background-size:400% 400%;
animation:gradientBG 10s ease infinite;

display:flex;
justify-content:center;
align-items:center;
height:100vh;
margin:0;
}

@keyframes gradientBG{
0%{background-position:0% 50%;}
50%{background-position:100% 50%;}
100%{background-position:0% 50%;}
}

.card{
background:rgba(255,255,255,0.1);
padding:40px;
border-radius:12px;
text-align:center;
backdrop-filter:blur(12px);
box-shadow:0 10px 30px rgba(0,0,0,0.4);
width:360px;
color:white;
}

.card h2{
color:#ff7b00;
margin-bottom:20px;
}

.btn{
display:block;
margin-top:15px;
padding:10px;
background:#ff7b00;
color:white;
border-radius:6px;
text-decoration:none;
font-weight:bold;
transition:0.3s;
}

.btn:hover{
background:#ff9d3f;
}

</style>

</head>

<body>

<div class="card">

<h2>Login Successful</h2>

<p>Welcome! You have logged in successfully.</p>

<a href="index.jsp" class="btn">Go to Home</a>

</div>

</body>
</html>