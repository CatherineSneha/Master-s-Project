<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AQ Track - My Account</title>
    <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400&family=Ubuntu:wght@400&display=swap" rel="stylesheet">
  
  <!-- CSS Stylesheets -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <link rel="stylesheet" href="css/styles.css">

  <!-- Font Awesome -->
  <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>

  <!-- Bootstarp Scripts -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

</head>
<body>
<!-- Gets the session details from the servlet  -->
	<%
	if (session.getAttribute("email") == null) {
		response.sendRedirect("Login.jsp");
	}
	%>
	<!-- Nav Bar which conatins Home MyProfile My Account which further has dropdown options -->
    <section class="coloured-section" id="title">
    
    <div class="container-fluid">
    
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="Home.jsp">AQ Track</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="Index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">My Profile</a>
            </li>
            <li>
            <a class="nav-link" href="ViewUser.jsp">Add User</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Account
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item nav-link" style="color: #ff4c68;" href="#features">Report</a>
                <a class="dropdown-item nav-link" style="color: #ff4c68;" href="#testimonials">Dashboard</a>
            </li>            
            <li class="nav-item">
                <img src="images/profile-modified.png" alt="profile picture" width="40"
                height="40">
            </li>
            <li>
            <h4>${email}</h4>
            </li>
          </ul>
          <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-dark btn-dark my-2 my-sm-0" type="submit" style="color: beige;">Search</button>
          </form>
        </div>
      </nav>
    </section>
    <br><br>
    <!-- Initializing Database -->
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/test_db"
         user = "root"  password = "Yellow@12"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
       SELECT * FROM test_db.contact_form_details </sql:query>
       
       <table border="1" width="100%">
		<tr>
			<th>ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
			<th>Address 1</th>
			<th>Address 2</th>
			<th>City</th>
			<th>State</th>
			<th>Country</th>
			<th>Zip</th>
			<th>Message</th>
			
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.ID}" /></td>
				<td><c:out value="${row.FIRSTNAME}" /></td>
				<td><c:out value="${row.LASTNAME}" /></td>
				<td><c:out value="${row.EMAIL}" /></td>
				<td><c:out value="${row.ADDRESS1}" /></td>
				<td><c:out value="${row.ADDRESS2}" /></td>
				<td><c:out value="${row.CITY}" /></td>
				<td><c:out value="${row.STATE}" /></td>
				<td><c:out value="${row.COUNTRY}" /></td>
				<td><c:out value="${row.ZIP}" /></td>
				<td><c:out value="${row.MESSAGE}" /></td>
			</tr>
		</c:forEach>
	</table>
	<br><br>
	<br><br>

	<!-- Footer -->

<footer class="white-section" id="footer">
    <div class="container-fluid">
    <i class="social-icon fab fa-facebook-f"></i>
    <i class="social-icon fab fa-twitter"></i>
    <i class="social-icon fab fa-instagram"></i>
    <i class="social-icon far fa-envelope"></i>
    <ul class="list-inline">
      <li class="list-inline-item"><a class="nav-link" href="Contact.jsp">Contact Us</a></li>
      <li class="list-inline-item"><a class="nav-link" href="FAQ.jsp">FAQ</a></li>
      <li class="list-inline-item"><a class="nav-link" href="Help.jsp">Help Center</a></li>
    </ul>
    <p>© Copyright 2022 AQ Track</p>
    </div>
</footer>
</body>
</html>