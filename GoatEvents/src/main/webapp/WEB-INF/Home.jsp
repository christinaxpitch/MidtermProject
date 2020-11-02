<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="resources/styles.css">
<meta charset="UTF-8">
<title>Test Page</title>
</head>
<body>

<ul id="menu">
  <li><a href="home.do"><img src="https://svgsilh.com/svg/44670.svg" height=25px></a></li>
        <li id="signup">
        <a href="signUpInput.do">Sign up FREE</a>
      </li>
      <li id="drop" class="dropdown">
  <input id="dropcheck" class="dropcheck" type="checkbox">
  <label for="dropcheck" class="dropbtn">Log in ▼</label>
          
       
        <div class="dropdown-content">
          <form>
            <fieldset id="inputs">
              <input  id="username"
                      type="email"
                      name="Email"
                      placeholder="Your email address"
                      required>
              <input  id="password"
                      type="password"
                      name="Password"
                      placeholder="Password"
                      required>
            </fieldset>
            <fieldset id="actions">
              <input  type="submit"
                      id="submit"
                      value="Log in">
            </fieldset>
          </form>
        </div>
      
   </li>
    </ul>

	<h1>this is fun!!!!!!!!!!!!!!!!!!!!!!!</h1>

	<p>${user.username}</p>
	<%-- <p> ${user } </p>
 --%>
 <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="resources/images/RockingOut2.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-md-block d-md-block">
        <h5>First slide label</h5>
        <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="resources/images/RockingOut3.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-md-block d-md-block">
        <h5>Second slide label</h5>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="resources/images/RockingOut.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-md-block d-md-block">
        <h5>Third slide label</h5>
        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
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
</body>
</html>