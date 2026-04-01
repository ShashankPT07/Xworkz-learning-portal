<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- ✅ Redirect if not logged in -->
<c:if test="${empty user}">
    <script>
        window.location.href="signin.jsp";
    </script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Workz Learning Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    margin:0;
    background:#f4f6f9;
    font-family:Segoe UI;
}

/* NAVBAR */
.navbar{
    background:#0f2027;
    padding:10px 25px;
}

/* SIDEBAR */
.sidebar{
    position:fixed;
    left:0;
    top:60px;
    width:220px;
    height:100%;
    background:#1c2b36;
    padding-top:20px;
}

.sidebar a{
    display:block;
    color:white;
    padding:12px 20px;
    text-decoration:none;
    font-size:15px;
    transition:0.3s;
}

.sidebar a:hover{
    background:#32495a;
    padding-left:25px;
}

/* MAIN CONTENT */
.content{
    margin-left:240px;
    margin-top:80px;
    padding:20px;
}

/* DASHBOARD CARDS */
.dashboard-card{
    border-radius:10px;
    padding:20px;
    color:white;
    text-align:center;
}

.card1{background:#007bff;}
.card2{background:#28a745;}
.card3{background:#ff7b00;}

/* PROFILE ICON */
.profile-icon{
    width:40px;
    height:40px;
    border-radius:50%;
    background:#ff7b00;
    display:flex;
    align-items:center;
    justify-content:center;
    color:white;
    font-weight:bold;
    cursor:pointer;
}

/* PROFILE DROPDOWN */
.profile-box{
    position:absolute;
    right:20px;
    top:60px;
    width:250px;
    background:white;
    border-radius:10px;
    box-shadow:0 5px 20px rgba(0,0,0,0.2);
    display:none;
    padding:15px;
}

.profile-box p{
    font-size:14px;
    margin:4px 0;
}

</style>

</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-dark fixed-top d-flex justify-content-between">

<h4 class="text-white">X-Workz Learning Portal</h4>

<div onclick="toggleProfile()" class="profile-icon">
    <c:if test="${not empty user.name}">
        ${fn:toUpperCase(user.name.substring(0,1))}
    </c:if>
</div>

</nav>

<!-- PROFILE DROPDOWN -->
<div id="profileBox" class="profile-box">

<h5>${user.name} ${user.surname}</h5>

<hr>

<p><b>Email :</b> ${user.email}</p>
<p><b>Phone :</b> ${user.phoneNumber}</p>
<p><b>Gender :</b> ${user.gender}</p>
<p><b>Username :</b> ${user.username}</p>

<hr>

<form action="logout" method="post">
<button class="btn btn-danger btn-sm w-100"
onclick="return confirm('Are you sure you want to logout?')">
Logout
</button>
</form>

</div>

<!-- SIDEBAR -->
<div class="sidebar">

<a href="#">🏠 Dashboard</a>
<a href="#">📚 Courses</a>
<a href="#">📝 Assignments</a>
<a href="#">📊 Progress</a>
<a href="#">⚙ Settings</a>

</div>

<!-- MAIN CONTENT -->
<div class="content">

<h3>Welcome ${user.name} 👋</h3>
<p>This is your learning dashboard.</p>

<div class="row mt-4">

<div class="col-md-4">
<div class="dashboard-card card1">
<h4>12</h4>
<p>Courses Enrolled</p>
</div>
</div>

<div class="col-md-4">
<div class="dashboard-card card2">
<h4>8</h4>
<p>Assignments Completed</p>
</div>
</div>

<div class="col-md-4">
<div class="dashboard-card card3">
<h4>75%</h4>
<p>Learning Progress</p>
</div>
</div>

</div>

</div>

<script>

/* Toggle profile dropdown */
function toggleProfile(){
    let box=document.getElementById("profileBox");

    if(box.style.display==="block"){
        box.style.display="none";
    }else{
        box.style.display="block";
    }
}

/* Close dropdown when clicking outside */
document.addEventListener("click", function(e){
    let box = document.getElementById("profileBox");
    let icon = document.querySelector(".profile-icon");

    if(box && icon && !box.contains(e.target) && !icon.contains(e.target)){
        box.style.display = "none";
    }
});

</script>

</body>
</html>