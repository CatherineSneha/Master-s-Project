<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AQ Track - About Us</title>
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
    <br><br>
    <!-- Information about AQ Track the text is styled using inline CSS
         The links to external pages are given using the a tag-->
    <h3 style="font-family: Montserrat-bold;">About Us</h3>
    <br>
    <p  style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;">We are a company based on providing solution to track and monitor air pollution.AQT is platform where one can track the air quality in their surroundings.
        <br>This will help to reduce the exposure to harmful pollutants which might cause long term effects on a person.
        <br>This platform will track and provide alternate way in which air pollution and exposure to air pollution can be minimized</p>
    <br><br>
    <h3 style="font-family: Montserrat-bold;">Air Pollution and its effects</h3>
    <p  style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;">Air pollution is a complex problem, and in most cases invisible.

        It is the presence in the atmosphere of gases, dust and particles at a percentage that may be harmful to humans, animals and plants.
        
        Common air pollutants in the atmosphere are carbon monoxide (CO), ground-level ozone (O3), nitrogen dioxide (NO2), particulate matter (PM), and sulphur dioxide (SO2).
        
        The information that was provided by hackAIR only referred to particulate matter.
        
        Air pollution can contribute to the formation of photochemical smog and the reduction of visibility, the formation of acid rain and the damage of buildings and monuments, water quality deterioration, decrease of soil productivity, flora and fauna damages.</p>
    <br><br>
    <br><br>
    <h4>For More information on Air Pollution and Air Quality , refer to <a href="https://www.who.int/teams/environment-climate-change-and-health/air-quality-and-health">WHO - Air quality and health</a> and <a href="https://www.hackair.eu/air-quality/">HackAir - Air Quality</a></h4> 
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