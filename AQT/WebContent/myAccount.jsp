<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AQ Track - My Account</title>
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400&family=Ubuntu:wght@400&display=swap"
	rel="stylesheet">

<!-- CSS Stylesheets -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/styles.css">

<!-- Font Awesome -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>

<!-- Bootstarp Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
	integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
	crossorigin="anonymous"></script>

</head>
<body>

	<%if (session.getAttribute("email") == null) {
		response.sendRedirect("Login.jsp");
	} %>
	<!-- Nav Bar which conatins Home MyProfile My Account which further has dropdown options -->
	<section class="coloured-section" id="title">

		<div class="container-fluid">

			<nav class="navbar navbar-expand-lg navbar-dark">
				<a class="navbar-brand" href="Index.jsp">AQ Track</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a class="nav-link"
							href="Index.jsp">Home <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="'/Servlet?uname=" +${emailId}>My Profile</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> Account </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item nav-link" style="color: #ff4c68;"
									href="#features">Report</a> <a class="dropdown-item nav-link"
									style="color: #ff4c68;" href="#testimonials">Dashboard</a></li>
						<li class="nav-item"><img src="images/profile-modified.png"
							alt="profile picture" width="40" height="40"></li>
						<li>
							<h4>${email}</h4>
						</li>
					</ul>
					<form class="form-inline my-2 my-lg-0">
						<input class="form-control mr-sm-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-dark btn-dark my-2 my-sm-0"
							type="submit" style="color: beige;">Search</button>
					</form>
				</div>
			</nav>
	</section>

	<!-- Report of sensor data-->

	<!-- Initializing Database -->
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/test_db" user="root"
		password="Yellow@12" />

	<sql:query dataSource="${snapshot}" var="result">
       SELECT * FROM test_db.aqi_details WHERE USERNAME ='${email}' ORDER BY ID DESC LIMIT 1 </sql:query>

	<section class="white-section" id="features">
		<div class="container-fluid">
			<h1 class="report-title">REPORT</h1>
			<br> <br>
			<h2 class="report-title">PM 2.5</h2>
			<br>
			<iframe width="550" height="375" style="border: 1px solid #cccccc;"
				src="https://thingspeak.com/channels/1802514/charts/1?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15"></iframe>
			<br> <br>
			<h2 class="report-title">MQ 135</h2>
			<br>
			<iframe width="550" height="375" style="border: 1px solid #cccccc;"
				src="https://thingspeak.com/channels/1803338/charts/1?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15"></iframe>
			<br> <img src="images/report.jpg" alt="Report" width="340"
				height="340">
		</div>

	</section>


	<!-- Dashboard shows status of each gases in the place-->

	<section class="white-section" id="testimonials"
		style="background-color: white;">
		<div class="container-fluid">
			<h1 class="report-title">DASHBOARD</h1>
			<br>
			<c:forEach var="row" items="${result.rows}">
				<h2>
					AIR QUALITY :
					<c:out value="${row.CATEGORY}" />
				</h2>
			</c:forEach>
			<br> <br>
			<%-- <h2>
				AIR QUALITY :
				<c:out value="${result.CATEGORY}" />
			</h2> --%>
			<!-- <img src="images/dashboard.jpg" alt="Report" width="1000"
					height="440"> -->
			<br>
			<iframe width="550" height="375" style="border: 1px solid #cccccc;"
				src="https://thingspeak.com/channels/1826222/charts/1?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15"></iframe>
			<br> 
			<img src="images/report.jpg" alt="Report" width="340"
				height="340">
		</div>
	</section>


	<!-- Footer -->

	<footer class="white-section" id="footer">
		<div class="container-fluid">
			<i class="social-icon fab fa-facebook-f"></i> <i
				class="social-icon fab fa-twitter"></i> <i
				class="social-icon fab fa-instagram"></i> <i
				class="social-icon far fa-envelope"></i>
			<ul class="list-inline">
				<li class="list-inline-item"><a class="nav-link"
					href="Contact.jsp">Contact Us</a></li>
				<li class="list-inline-item"><a class="nav-link" href="FAQ.jsp">FAQ</a></li>
				<li class="list-inline-item"><a class="nav-link"
					href="Help.jsp">Help Center</a></li>
			</ul>
			<p>© Copyright 2022 AQ Track</p>
		</div>
	</footer>
</body>
</html>