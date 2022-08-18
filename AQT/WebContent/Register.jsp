<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AQ Track - Register/Sign Up</title>
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
    <body class="text-center">
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
              </ul>
              </div>
            </nav>
        </section>

        <!-- Sign In 
        contains a form to register to create an account for AQ Track
        On clicking submit it takes you to the login page to login-->

        <form class="form-signin" style="font-family: Montserrat-light;" name='registerForm' onSubmit="return(validateRegisterForm());" method="post" action="Register">
          <img class="mb-4" src="images/logo.png" alt="" width="72" height="72">
          <h1 class="h3 mb-4 font-weight-normal">Please sign in</h1>
            <div class="form-group">
              <label for="inputFname"></label>
              <input type="text" class="form-control" id="inputFname" name="fname" placeholder="First Name">
            </div>
            <div class="form-group">
              <label for="inputLname"></label>
              <input type="text" class="form-control" id="inputLname" name="lname" placeholder="Last Name">
            </div>
            <div class="form-group">
              <label for="inputEmail4"></label>
              <input type="email" class="form-control" id="inputEmail4" name="email" placeholder="Email">
            </div>
            <div class="form-group">
              <label for="inputPassword4"></label>
              <input type="password" class="form-control" id="inputPassword4" name="password" placeholder="Password">
            </div>
             <!-- Account type input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="form3Example4">Account Type:</label>
                <select id="type" name="account">
                <option value="Admin">Admin</option>
                <option value="User">User</option>
                </select>
            </div>
          <div class="form-group">
            <label for="inputAddress"></label>
            <input type="text" class="form-control" id="inputAddress" name="address1" placeholder="1234 Main St">
          </div>
          <div class="form-group">
            <label for="inputAddress2"></label>
            <input type="text" class="form-control" id="inputAddress2" name="address2" placeholder="Apartment, studio, or floor">
          </div>
            <div class="form-group ">
              <label for="inputCity"></label>
              <input type="text" class="form-control" id="inputCity" name="city" placeholder="City">
            </div>
            <div class="form-group">
              <label for="inputState"></label>
              <input type="text" class="form-control" id="inputState" name="state" placeholder="State">
            </div>
            <div class="form-group ">
              <label for="inputCountry"></label>
              <input type="text" class="form-control" id="inputCountry" name="country" placeholder="Country">
            </div>
            <div class="form-group ">
              <label for="inputZip"></label>
              <input type="text" class="form-control" id="inputZip" name="zip" placeholder="Zip Code">
            </div>
            <div class="form-group ">
              <label for="apiKey"></label>
              <input type="text" class="form-control" id="apiKey" name="api" placeholder="API Key">
            </div>
          <div class="form-group">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" id="gridCheck">
              <label class="form-check-label" for="gridCheck">
                Agree to Terms and Condition
              </label>
            </div>
          </div>
          <div class="checkbox mb-4">
              <input type="checkbox" value="remember-me"> 
              <label>Remember me</label>
          </div>
          <button class="btn btn-lg btn-primary btn-block" type="submit" id="submit"><a href="login.html" style="color: white;">Sign in</a></button>
          <p class="small fw-bold mt-2 pt-1 mb-0">Already have an account? <a href="login.html"
            class="link-danger">Login</a></p>
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
  <script src="js/register.js"></script>
  </body>
</html>