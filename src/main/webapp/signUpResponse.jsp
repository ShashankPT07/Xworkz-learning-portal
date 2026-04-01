<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Successful</title>

<style>

body{
font-family:'Segoe UI',sans-serif;
height:100vh;
display:flex;
justify-content:center;
align-items:center;
margin:0;

background:linear-gradient(-45deg,#141e30,#243b55,#0f2027,#2c5364);
background-size:400% 400%;
animation:gradientBG 10s ease infinite;
}

@keyframes gradientBG{
0%{background-position:0% 50%;}
50%{background-position:100% 50%;}
100%{background-position:0% 50%;}
}

/* Card */

.card{
background:rgba(255,255,255,0.1);
backdrop-filter:blur(15px);
padding:40px;
border-radius:12px;
text-align:center;
box-shadow:0 15px 35px rgba(0,0,0,0.4);
width:360px;
color:white;
}

/* Title */

.card h2{
color:#ff7b00;
margin-bottom:15px;
}

/* Message */

.card p{
font-size:16px;
margin-bottom:25px;
}

/* Buttons */

.btn{
padding:10px 20px;
background:#ff7b00;
color:white;
border:none;
border-radius:6px;
text-decoration:none;
font-weight:bold;
margin:6px;
display:inline-block;
transition:0.3s;
}

.btn:hover{
background:#ff9d3f;
transform:scale(1.05);
}

</style>

</head>

<body>

<div class="card">

<h2>Registration Successful</h2>

<p>Your account has been created successfully.</p>

<a href="signin.jsp" class="btn">Go to Login</a>
<a href="index.jsp" class="btn">Go to Home</a>

</div>

</body>
</html>