<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AQ Track - Login Page</title>

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

	<%@ page import="java.util.*, java.sql.*" %>
	
	<section class="coloured-section" id="title">
    
        <div class="container-fluid">
        <!-- Nav Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark">
          <a class="navbar-brand" href="Index.jsp">AQ Track</a>
           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
           <span class="navbar-toggler-icon"></span>
           </button>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto" id="test">
              <li class="nav-item">
                  <a class="nav-link" href="Contact.jsp">Contact</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="Pricing.jsp">Pricing</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="Index.jsp#cta">Download</a>
              </li>
          </ul>
          </div>
        </nav>
    </section>

    <!-- Login 
         Email and password input to login into the website-->

    <section class="vh-100">
        <div class="container-fluid h-custom">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-9 col-lg-6 col-xl-5">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp" class="img-fluid"
                alt="Sample image">
            </div>
            <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
              <form style="font-family: Montserrat-light;" method="post" action="LoginServlet">      
                <!-- Email input -->
                <div class="form-outline mb-4">
                  <p class="lead fw-normal mb-0 me-3">Sign in with your email</p>
                  <br>
                  <input type="email" name="email" id="form3Example3" class="form-control form-control-lg"
                    placeholder="Enter a valid email address" />
                  <label class="form-label" for="form3Example3"></label>
                </div>
      
                <!-- Password input -->
                <div class="form-outline mb-4">
                  <input type="password" name="password" id="form3Example4" class="form-control form-control-lg"
                    placeholder="Enter password" />
                  <label class="form-label" for="form3Example4"></label>
                </div>
                
                <!-- Account type input -->
                <div class="form-outline mb-4">
                <label class="form-label" for="form3Example4">Account Type:</label>
                <select id="type" name="account">
                <option value="Admin">Admin</option>
                <option value="User">User</option>
                </select>
                </div>
      
                <div class="d-flex justify-content-between align-items-center">
                  <!-- Checkbox -->
                  <div class="form-check mb-0">
                    <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
                    <label class="form-check-label" for="form2Example3">
                      Remember me
                    </label>
                  </div>
                  <a href="#!" class="text-body">Forgot password?</a>
                </div>
      
                <div class="text-center text-lg-start mt-4 pt-2">
                <input type="submit" value="Login" class="btn btn-primary btn-lg"
                    style="padding-left: 2.5rem; padding-right: 2.5rem;"/>
                  <!-- <button type="button" class="btn btn-primary btn-lg"
                    style="padding-left: 2.5rem; padding-right: 2.5rem;"><a href="myAccount.jsp" style="color: beige;">Login</a></button> -->
                  <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="Register.jsp"
                      class="link-danger">Register</a></p>
                </div>
              </form>
            </div>
          </div>
        </div>
      </section>
      
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

<ul id="tree"></ul>
    <input type="text" id="formText">
    <br>
    <button type="button" class="btn btn-dark btn-lg" id= "confirmButton" style="margin-top: 5px;">Build a DOM tree</button>

    <!-- JavaScript -->
<script src="js/index.js"></script>

</body>
</html>