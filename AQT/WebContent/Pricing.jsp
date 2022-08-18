<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AQ Track - Pricing</title>

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
        <nav class="navbar navbar-dark full-screen-nav">
          <a class="navbar-brand" href="Home.jsp">AQ Track</a>
           <button class="nav-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
           <span class="navbar-toggler-icon"></span>
           </button>
         <div class="collapse navbar-collapse backdrop" id="navbarSupportedContent">
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
              <li class="nav-item">
                <a class="nav-link" href="Login.jsp">Login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Register.jsp">Sign Up</a>
          </li>
          </ul>
          </div>
        </nav>
    </section>
      <!-- Pricing 
      contains cards which display the pricing options for each plan-->

  <section class="white-section" id="pricing">

    <h2 class="section-heading">A Plan for Every Individual's Needs</h2>
    <p>Simple and affordable price plans for your and your Family.</p>
  <div class="row"> 
    <div class="pricing-column col-lg-4 col-md-6">
    <div class="card">
      <div class="card-header">
        <h3>Basic</h3>
      </div>
      <div class="card-body">
        <h2 class="price-text">Free</h2>
        <p>Single member Sign up</p>
        <p>Alerts limit to 10 per day</p>
        <p>Unlimited App Usage</p>
        <a href="Register.jsp">
        <button class="btn btn-lg btn-block btn-outline-dark" type="button">Sign Up</button>
        </a>
      </div>
      </div>
      </div>

      <div class="pricing-column col-lg-4 col-md-6">
      <div class="card">
        <div class="card-header">
          <h3>Premium</h3>
        </div>
        <div class="card-body">
          <h2 class="price-text">$49 / mo</h2>
          <p>3 members can use on a Single Sign up/p>
          <p>Alerts limit to 10 per day</p>
          <p>Unlimited App Usage</p>
          <a href="Register.jsp">
          <button class="btn btn-lg btn-block btn-dark" type="button">Sign Up</button>
          </a>
        </div>
        </div>
        </div>

        <div class="pricing-column col-lg-4">
        <div class="card">
          <div class="card-header">
            <h3>Pro</h3>
          </div>
          <div class="card-body">
            <h2 class="price-text">$99 / mo</h2>
            <p>Pirority Listing</p>
            <p>4 or 5 members can use on a Single sign up</p>
            <p>Unlimited Alerts</p>
            <p>Unlimited App Usage</p>
            <a href="Register.jsp">
            <button class="btn btn-lg btn-block btn-dark" type="button">Sign Up</button>
            </a>
          </div>
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