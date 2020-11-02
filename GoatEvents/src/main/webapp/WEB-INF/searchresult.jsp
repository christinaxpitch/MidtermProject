<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="resources/searchstyles.css">
<meta charset="UTF-8">
<title>Search Results</title>
</head>
<body>
<header>
<c:choose>
<c:when test="${empty vendor }">

<ul id="menu">
  <li><a href="home.do"><img src="https://svgsilh.com/svg/44670.svg" height=25px></a></li>
        <li id="signup">
        <a href="signUp.do">Sign up FREE</a>
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














</c:when>
<c:otherwise>

<ul id="menu">
  <li><a href="home.do"><img src="https://svgsilh.com/svg/44670.svg" height=25px></a></li>
        <li id="profile"><a href="user.do">Profile</a></li>
        <li id="signup">
        <a href="user.do"><img src="${user.image}" height=40px width=40px></a>
      </li>
       </ul>


      
  
   </c:otherwise>
































</c:choose>













</header>



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