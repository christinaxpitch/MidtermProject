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
<link rel="stylesheet" href="resources/signUpStyles.css">
<link rel="stylesheet" href="resources/searchstyles.css">
<meta charset="UTF-8">
<title>Venue Title Page </title>
</head>
<body>
<header>
<c:choose>
<c:when test="${empty sessionScope.loginUser}">
<ul id="menu">
  <li><a href="home.do"><img src="https://svgsilh.com/svg/44670.svg" height=25px></a></li>
       <li>   <div class="search-container">
    <form id="searchForm" action="search.do">
      <input id="searchText" type="text" placeholder="Search.." name="search">
      <button id="searchSubmit" type="submit">Search</button>
    </form>
  </div></li>
        <li id="signup">
        <a href="signUpInput.do">Sign up FREE</a>
      </li>
		<li id="drop" class="dropdown"><input id="dropcheck"
			class="dropcheck" type="checkbox"> <label for="dropcheck"
			class="dropbtn">Log in ▼</label>
			<div class="dropdown-content">
				<form action="login.do" method="GET">
					<fieldset id="inputs">
						<input id="email" type="email" name="email"
							placeholder="Your email address" required> <input
							id="password" type="password" name="password"
							placeholder="Password" required>
					</fieldset>
					<fieldset id="actions">
						<input type="submit" id="submit" value="Log in">
					</fieldset>
				</form>
			</div></li>
    </ul>
</c:when>
<c:otherwise>
<ul id="menu">
  <li><a href="home.do"><img src="https://svgsilh.com/svg/44670.svg" height=25px></a></li>
 <li>   <div class="search-container">
    <form id="searchForm" action="search.do">
      <input id="searchText" type="text" placeholder="Search.." name="search">
      <button id="searchSubmit" type="submit">Search</button>
    </form>
  </div></li>
<li id="signup">
        <a href="user.do"><img src="${sessionScope.loginUser.image}" height=45px width=45px></a>
       </ul>
</c:otherwise>
</c:choose>
</header>
	<h2>Venue Information: </h2>
 <c:choose>
		<c:when test="${! empty venue }">
			Venue you are editing: - ${venue.name}
			<form action="updateVenue.do" method="POST">
			<br>
			<br>
				<label for="name">Venue Name:</label> <input type="text" name="name"
					value="${venue.name}" /> <input type="hidden" name="vid"
					value="${venue.id}" /> 
			<br>
				<label for="capacity">Venue Capacity:</label> <input type="text" name="capacity"
					value="${venue.capacity}" /> <input type="hidden" name="capacity"
					value="${venue.id}" /> 
			<br>
			<br>
				<label for="description">Venue Description:</label> <input type="text" name="description"
					value="${venue.description}" /> <input type="hidden" name="vid"
					value="${venue.id}" /> 
			<br>
			<br>
			
		<input type="submit" class="button" value="Submit" />
		<input type = "hidden" value ="${venue.id }" name = "vid" />
		</form>


		</c:when>
		<c:otherwise>
			<p>No result</p>
		</c:otherwise>
	</c:choose>
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