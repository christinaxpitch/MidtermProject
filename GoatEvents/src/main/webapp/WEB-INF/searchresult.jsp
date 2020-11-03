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
<c:when test="${empty user }">

<ul id="menu">
  <li><a href="home.do"><img src="https://svgsilh.com/svg/44670.svg" height=25px></a></li>
        <li id="signup">
        <a href="signUp.do">Sign up FREE</a>
      </li>
      <li id="drop" class="dropdown">
  <input id="dropcheck" class="dropcheck" type="checkbox">
  <label for="dropcheck" class="dropbtn">Log in ▼</label>
          
       
        <div class="dropdown-content">
          <form action="credentials.do">
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
        <li id="signup">
        <a href="user.do"><img src="${user.image}" height=45px width=45px></a>
       </ul>
</c:otherwise>
</c:choose>
</header>
<div class="container-fluid">
			<c:if test="${empty event}">
			<c:if test="${empty venue}">
	<c:if test="${empty venues  }"></c:if>
	<c:if test="${empty events  }">No Results found</c:if>
			<h6>Your Search contained ${count} results</h6>
<c:forEach var="e" items="${events}">
<div>
<table class="table table-striped table-hover, table-light">
<thead class=“thead thead-dark”>
<tr><td><img src="${e.image }" height= 70px width= 70px></td></tr>
<tr><td>${e.eventDate.month } ${e.eventDate.dayOfMonth }, ${e.eventDate.year }</td></tr>
<tr><td>${e.title }</td></tr>
<tr><td>${e.venue.name }</td></tr>
<tr><td>${e.numOfTickets } tickets available</td></tr>
<tr><td>${e.maxCapacity } max capacity</td></tr>
<tr><td>${e.description }</td></tr>
</table>
</div>

</c:forEach>





</c:if>

</c:if>





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