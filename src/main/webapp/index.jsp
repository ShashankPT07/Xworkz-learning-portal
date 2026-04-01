<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>X-Workz Learning Portal</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family: 'Segoe UI', sans-serif;
}

/* Background */
body{
background:url("https://images.unsplash.com/photo-1498050108023-c5249f4df085")
no-repeat center center/cover;
height:100vh;
color:white;
}

/* Overlay */
.overlay{
background:rgba(0,0,0,0.75);
min-height:100vh;
}

/* Navbar */

.navbar{
display:flex;
justify-content:space-between;
align-items:center;
padding:20px 60px;
border-bottom:1px solid rgba(255,255,255,0.1);
}

.logo{
font-size:28px;
font-weight:bold;
color:#ff6600;
}

.nav-links a{
color:white;
text-decoration:none;
margin-left:30px;
font-size:16px;
transition:0.3s;
}

.nav-links a:hover{
color:#ff6600;
}

/* Buttons */

.auth-buttons button{
padding:10px 20px;
margin-left:10px;
border-radius:6px;
border:none;
cursor:pointer;
font-weight:bold;
transition:0.3s;
}

.signin{
background:transparent;
border:1px solid white;
color:white;
}

.signup{
background:#ff6600;
color:white;
}

.signup:hover{
background:#ff8533;
}

.signin:hover{
background:white;
color:black;
}

/* Hero Section */

.hero{
display:flex;
flex-direction:column;
justify-content:center;
align-items:center;
text-align:center;
height:60vh;
}

.hero h1{
font-size:48px;
margin-bottom:15px;
}

.hero p{
font-size:20px;
color:#ddd;
margin-bottom:25px;
}

.start-btn{
padding:14px 35px;
font-size:18px;
border:none;
background:#ff6600;
color:white;
border-radius:8px;
cursor:pointer;
transition:0.3s;
}

.start-btn:hover{
background:#ff8533;
transform:scale(1.05);
}

/* Section Title */

.section-title{
text-align:center;
margin:20px 0 30px;
font-size:22px;
color:#ddd;
}

/* Cards */

.cards{
display:flex;
justify-content:center;
gap:30px;
flex-wrap:wrap;
}

.card{
background:rgba(255,255,255,0.08);
border:1px solid rgba(255,255,255,0.1);
padding:30px;
width:260px;
border-radius:12px;
text-align:center;
transition:0.3s;
}

.card:hover{
transform:translateY(-10px);
background:rgba(255,255,255,0.15);
}

.card h3{
margin-bottom:10px;
}

.card p{
font-size:14px;
color:#ccc;
}

/* Footer */

.footer{
text-align:center;
padding:20px;
margin-top:40px;
color:#aaa;
border-top:1px solid rgba(255,255,255,0.1);
}

/* Responsive */

@media(max-width:768px){

.navbar{
flex-direction:column;
gap:15px;
}

.hero h1{
font-size:32px;
}

.cards{
flex-direction:column;
align-items:center;
}

}

</style>
</head>

<body>

<div class="overlay">

<!-- Navbar -->
<div class="navbar">

<div class="logo">X-Workz</div>

<div class="nav-links">
<a href="#">Home</a>
<a href="#">Courses</a>
<a href="#">Projects</a>
<a href="#">Contact</a>
</div>

<div class="auth-buttons">
<button class="signin" onclick="location.href='signin.jsp'">Sign In</button>
<button class="signup" onclick="location.href='signup.jsp'">Sign Up</button>
</div>

</div>

<!-- Hero Section -->

<div class="hero">

<h1>Become a Java Full Stack Developer</h1>

<p>
Learn Spring Boot, Hibernate, REST APIs and build real-world enterprise applications
</p>

<button class="start-btn" onclick="location.href='signup.jsp'">
Start Learning
</button>

</div>

<div class="section-title">
— Our Learning Paths —
</div>

<!-- Cards -->

<div class="cards">

<div class="card">
<h3>Java Backend</h3>
<p>
Spring Boot, Hibernate, REST APIs and Microservices architecture.
</p>
</div>

<div class="card">
<h3>Frontend</h3>
<p>
HTML, CSS, JavaScript, Bootstrap and responsive web design.
</p>
</div>

<div class="card">
<h3>Industry Projects</h3>
<p>
Build enterprise applications and improve coding skills.
</p>
</div>

</div>

<!-- Footer -->

<div class="footer">
© 2026 X-Workz Portal | Designed for Java Full Stack Learning
</div>

</div>

</body>
</html>