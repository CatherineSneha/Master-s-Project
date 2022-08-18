<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Air Quality Tracking</title>

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

	<!-- All items are styled in in order to adapt to any screen size be it a laptop or a smartphone using col-lg-4 col-lg-6 -->

  <section class="coloured-section" id="title">
    
    <div class="container-fluid">
    <!-- Nav Bar 
         contains the Menu Bar with the items About Us Contact Pricing Login Sign Up-->
    <nav class="navbar  navbar-dark full-screen-nav">
      <a class="navbar-brand" href="Home.jsp">AQ Track</a>
       <button class="nav-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
       </button>
     <div class="collapse nav-collapse backdrop" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto" id="test">
          <li class="nav-item">
              <a class="nav-link" href="AboutUs.jsp">About Us</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" href="#footer">Contact</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" href="Pricing.jsp">Pricing</a>
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

    
    <!-- Title 
        contains the Title text and a video about air pollution-->

    <div class="row">

       <div class="col-lg-6">
        <h1 class="big-heading">Stay safe and track the quality of air in your environment anytime anywhere.</h1>
        <button type="button" class="btn btn-dark btn-lg download-button"><i class="fab fa-apple"></i> Download</button>
        <button type="button" class="btn btn-outline-light btn-lg download-button"><i class="fab fa-google-play"></i> Download</button>
       </div>

       <div class="col-lg-6">
        <iframe  width="500" height="305" src="https://www.youtube.com/embed/W8p6YI45mFs">
        </iframe>
       </div>

    </div>
   </div>
  </section>


  <!-- Features 
       explains the features present in the Web Application -->

  <section class="white-section" id="features">
  <div class="container-fluid">

  <div class="row">
  <div class="feature-box col-lg-4">
    <i class="icon fas fa-check-circle fa-4x"></i> 
    <h3 class="feature-title">Easy to use.</h3>
    <p>User Friendly.Simple to use and navigate</p>
  </div>

  <div class="feature-box col-lg-4">
    <i class="icon fas fa-bullseye fa-4x"></i> 
    <h3 class="feature-title">Elite Clientele</h3>
    <p>We have clients from all over the world that recommend this product.</p>
  </div>

  <div class="feature-box col-lg-4">
    <i class="icon fas fa-heart fa-4x"></i> 
    <h3 class="feature-title">Guaranteed to work.</h3>
    <p>Find if the air you breathe is safe or not.</p>
  </div>
  </div>
  </div>

  </section>


  <!-- Testimonials by customers are styled like a carousel  using the class "carousel slide",
        which can be navigated through using a arrow -->

  <section class="coloured-section" id="testimonials">
    <div id="testimonial-carousel" class="carousel slide" data-ride="false">
      <div class="carousel-inner">
        <div class="carousel-item active container-fluid">
          <h2 class="testimonial-text">I no longer have to worry about the health risks due to Air pollution.I can just track and monitor the air quality in just a click.</h2>
          <img class="testimonial-image" src="images/lady-img.jpg" alt="dog-profile">
          <em>Jane, New York</em>
        </div>
        <div class="carousel-item container-fluid">
          <h2 class="testimonial-text">AQ Track is very user friendly.Good that I can even download it to my phone.</h2>
          <img class="testimonial-image" src="images/lady-img.jpg" alt="lady-profile">
          <em>Beverly, Illinois</em>
        </div>
      </div>
      <a class="carousel-control-prev" href="#testimonial-carousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon"></span >
      </a>
      <a class="carousel-control-next" href="#testimonial-carousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon"></span>
      </a>
    </div>
  </section>


  <!-- Press -->

  <section class="coloured-section" id="press">
    <img class="press-logo" src="images/techcrunch.png" alt="tc-logo">
    <img class="press-logo" src="images/tnw.png" alt="tnw-logo">
    <img class="press-logo" src="images/bizinsider.png" alt="biz-insider-logo">
    <img class="press-logo" src="images/mashable.png" alt="mashable-logo">

  </section>



  <!-- Download option for the App can be found here -->

  <section class="coloured-section" id="cta">
    
    <div class="container-fluid">
    <h3 class="big-heading">It does more than just tracking the air quality of the place you are in</h3>
    <div>
      <button type="button" class="btn btn-dark btn-lg download-button"><i class="fab fa-apple"></i> Download</button>
      <button type="button" class="btn btn-outline-light btn-lg download-button"><i class="fab fa-google-play"></i> Download</button>
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
