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
<link rel="stylesheet" href="resources/homeStyles.css">
<link rel="stylesheet" href="resources/searchstyles.css">
<meta charset="UTF-8">
<title>Search Results</title>
</head>
<body>
<header>
<c:choose>
<c:when test="${empty sessionScope.loginUser}">

<ul id="menu">
  <li><a href="home.do"><img src="https://svgsilh.com/svg/44670.svg" height=35px></a></li>
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
				<form action="login.do" method="POST">
					<fieldset id="inputs">
						<input id="email" type="text" name="email"
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
  <li><a href="home.do"><img src="https://svgsilh.com/svg/44670.svg" height=35px></a></li>
        <li id="signup">
        <a href="user.do"><img src="${sessionScope.loginUser.image}" height=45px width=45px></a>
        					<li id="logout"><form action="logout.do">

							<button id="searchSubmit" type="submit">Logout</button>
						</form>
					</li>
        				<li>
						<div class="search-container">
							<form id="searchForm" action="search.do">
								<input id="searchText" type="text" placeholder="Search.."
									name="search">
								<button id="searchSubmit" type="submit">Search</button>
							</form>
						</div>
					</li>
       </ul>
</c:otherwise>
</c:choose>
</header>
<div class="container-fluid">
			<c:if test="${empty event}">
			<c:if test="${empty venue}">
	<c:if test="${empty venues  }">
	<c:if test="${empty events  }">No Results found</c:if></c:if>
			<h6>Your Search contained ${count} results</h6>
<c:forEach var="e" items="${events}">
<div>
<table class="table table-striped table-hover, table-light">
<thead class=“thead thead-dark”>
<tr><td><img src="${e.image }" height= 70px width= 70px></td></tr>
<tr><td>Date:</td><td>${e.eventDate.month } ${e.eventDate.dayOfMonth }, ${e.eventDate.year }</td></tr>
<tr><td>Time:</td><td>${e.startTime}</td></tr>
<tr><td>Acts:</td><td><c:forEach var="a" items="${e.artists }"> ${a.artistName } ( ${a.artistType} )<br> </c:forEach></td></tr>
<tr><td>Event:</td><td>${e.title } ( <c:forEach var="et" items="${e.eventTypes }"> ${et.category } </c:forEach> )</td></tr>
<tr><td>Venue:</td><td>${e.venue.name }</td></tr>
<tr><td>Tickets Available:</td><td>${e.numOfTickets }</td></tr>
<tr><td>Event Capacity:</td><td>${e.maxCapacity }</td></tr>
<tr><td>Description:</td><td>${e.description }</td></tr>
<tr><td><form action="buyTicket.do"><button name="id" type="submit" value="${e.id}">Buy Ticket</button></form>
</td><td><form action="addFavEvent.do"><button name="id" type="submit" value="${e.id}">Add Event to my Favorites</button></form></td></tr>
</table>

</div>

</c:forEach>
<c:forEach var="v" items="${venues}">
<div>
<table class="table table-striped table-hover, table-light">
<thead class=“thead thead-dark”>
<tr><td><img src="${v.logo }" height= 70px width= 70px></td></tr>
<tr><td>Venue:</td><td>${v.name }</td></tr>
<tr><td>Address:</td><td>${v.address.street} ${v.address.city} ${v.address.state} ${v.address.zip}</td></tr>
<tr><td>Max Capacity:</td><td>${v.capacity }</td></tr>
<tr><td>Description:</td><td>${v.description }</td></tr>
<tr><td><form action="addFavVenue.do"><button name="id" type="submit" value="${v.id}">Add Venue to my Favorites</button></form></td></tr>
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