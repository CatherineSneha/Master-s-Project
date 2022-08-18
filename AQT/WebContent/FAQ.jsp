<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AQ Track - FAQ</title>
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
                  <a class="nav-link" href="#footer">Contact</a>
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

<!-- FAQ Section 
     contains an Accordion class from the bootstrap framework which displays the FAQ questions 
     and answers are displayed when the question is clicked on like an accordion-->
<br><br>
<h3>Frequently Asked Questions</h3>
<br><br>
<div class="accordion" id="accordionExample">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h2 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          What is AQT?
        </button>
      </h2>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
        AQT stands for Air Quality Tracking.It is a platform that was built to track the air quality from sensor data from a wearable personal device once configured with the website or app.
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Is AQT a free platform?
        </button>
      </h2>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      <div class="card-body">
        AQT can be used by anyone anywhere is the world.One just needs to login and connect their wearable devices.There are 3 plans available for users.For More information head onto the <a href="pricing.html">Pricing Page</a>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingThree">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          Is there an app for this?
        </button>
      </h2>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      <div class="card-body">
        Yes.There are both an android and iOS application available.You can download it from PlayStore on Android and from App Store on iOS.You can click on the links in the <a href="Index.jsp#cta">Downloads</a> Section. 
      </div>
    </div>
  </div>
</div>
    
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