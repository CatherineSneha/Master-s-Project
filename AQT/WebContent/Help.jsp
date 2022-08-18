;<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
    <title>AQ Track - Help Center</title>
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
    <section class="coloured-section" id="title">
    
        <div class="container-fluid">
        <!-- Nav Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark">
          <a class="navbar-brand" href="Home.jsp">AQ Track</a>
           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
           <span class="navbar-toggler-icon"></span>
           </button>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto" id="test">
              <li class="nav-item">
                <a class="nav-link" href="Login.jsp">Login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Register.jsp">Sign Up</a>
          </li>
          </ul>
          </div>
        </nav>
        <h3><center>Help Center</center></h3>
    </section>

<!-- Help center 
     contains a form to send in messages to contact the team-->

<section class="white-section" id="cta">
    
  <div class="container-fluid">
  <h3 class="big-heading">Sign in for personalised help</h3>
  <div>
    <button type="button" class="btn btn-secondary btn-lg download-button"><a href="login.html" style="color: beige;">Login</a></button>
    <button type="button" class="btn btn-dark btn-lg download-button"><a href="register.html" style="color: beige;" >Sign Up</a></button>
   </div>
  </div>
  <h3>Contact Us.Just drop in a message!</h3>
  <br>
  <form name='myForm' onSubmit="return(validate());" method="post" action="Help"> 
    <div class="form-group  mb-3">
      <label for="inputFname"></label>
      <input type="text" class="form-control" id="fname" name="inputFname" placeholder="First Name" >
    </div>
    <div class="form-group  mb-3">
      <label for="inputLname"></label>
      <input type="text" class="form-control" id="lname" name="inputLname" placeholder="Last Name" >
    </div>
  <div class="mb-3">
    <label for="Email" class="form-label"></label>
    <input type="email" id="email" name="email" class="form-control" aria-describedby="emailHelp" placeholder="Email address">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="form-group mb-3">
          <label for="inputAddress"></label>
          <input type="text" class="form-control" id="address1" name="inputAddress" placeholder="Address Line 1" required>
        </div>
        <div class="form-group mb-3">
          <label for="inputAddress2"></label>
          <input type="text" class="form-control" id="address2" name="inputAddress2" placeholder="Address Line 2">
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputCity"></label>
            <input type="text" class="form-control" id="city" name="inputCity" placeholder="City" required>
          </div>
          <div class="form-group col-md-4">
            <label for="inputState"></label>
            <input type="text" class="form-control" id="state" name="inputState" placeholder="State" required>
          </div>
          <div class="form-group col-md-2">
            <label for="inputZip"></label>
            <input type="text" class="form-control" id="zip" name="inputZip" placeholder="Zip Code" required> 
          </div>
        </div>
  <div class="mb-3">
    <label for="country" class="form-label"></label>
    <input type="text" class="form-control" id="icountry" placeholder="Country" name="country">
  </div>
  <div class="mb-3">
    <label for="Message" class="form-label"></label>
    <textarea class="form-control" id="imessage" name="message" placeholder="Write your message here..." style="height:200px"></textarea>
  </div>
  <div class="mb-3 form-check">
    <input type="checkbox" class="form-check-input" name="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Consent to subscribe email to recieve AQ Track News</label>
  </div>
  <button id="submit" type="submit" class="btn btn-primary" >Submit</button>
</form>

<br>
  <button id="retrieveButton" class="btn btn-primary" >Retrieve records</button>
<br>
<br>
  <div id="retrieve"></div>
<br>
<br>
<table border="1">
  <tbody>
    <tr>
      
    </tr>
  </tbody>
</table>
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
  <!-- JavaScript -->
  <script src="js/help.js"></script>
</body>
</html>