<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<!-- <link rel="stylesheet" href="resources/styles.css">
<link rel="stylesheet" href="resources/searchstyles.css">
<link rel="stylesheet" href="resources/logInSignInStyles.css"> -->
<link rel="stylesheet" href="resources/signUpStyles.css">
<link rel="stylesheet" href="resources/searchstyles.css">
<link rel="stylesheet" href="resources/logInSignInStyles.css">

<title>Create Event</title>
</head>
<body>
	<header>
		<c:choose>
			<c:when test="${empty sessionScope.loginUser}">
				<ul id="menu">
					<li><a href="home.do"><img
							src="https://svgsilh.com/svg/44670.svg" height=35px></a></li>
					<li>
						<div class="search-container">
							<form id="searchForm" action="search.do">
								<input id="searchText" type="text" placeholder="Search.."
									name="search">
								<button id="searchSubmit" type="submit">Search</button>
							</form>
						</div>
					</li>
					<li id="signup"><a href="signUpInput.do">Sign up FREE</a></li>
					<li id="drop" class="dropdown"><input id="dropcheck"
						class="dropcheck" type="checkbox"> <label for="dropcheck"
						class="dropbtn">Log in ▼</label>
						<div class="dropdown-content">
							<form action="login.do" method="POST">
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
					<li><a href="home.do"><img
							src="https://svgsilh.com/svg/44670.svg" height=35px></a></li>
					<li>
						<div class="search-container">
							<form id="searchForm" action="search.do">
								<input id="searchText" type="text" placeholder="Search.."
									name="search">
								<button id="searchSubmit" type="submit">Search</button>
							</form>
						</div>
					</li>
					<li id="signup"><a href="user.do"><img
							src="${sessionScope.loginUser.image}" height=45px width=45px></a>
				</ul>
			</c:otherwise>
		</c:choose>
	</header>
	
	<%-- <h4>Create New Event</h4>
	<form action="event.do" method="POST">
		<label for="title">Title</label> <input type="text" name="title"
			value="The Crimson Goat Event"> <br> 
		<label
			for="description">Description:</label> <input type="text"
			name="description" value="top 2 not 2"> <br> 
		<label
			for="sTime">Start Time:</label> <input type="time" name="sTime"
			value=""> <br> 
		<label for="eTime">End Time:</label> <input
			type="time" name="eTime" value=""> <br> 
		<label for="maxCapacity">Max
			Capacity:</label> <input type="text" name="maxCapacity" value="50000"><br>
		 <label for="numOfTickets">Number Of Tickets:</label> <input
			type="text" name="numOfTickets" value="50000"> <br> 
		<label
			for="eDate">Event Date:</label> <input type="date" name="eDate"
			value=""> <br>
			<input type="hidden" name="venueId" value="${ venue.id}">
		<button type="submit">Submit</button>
	</form> --%>
<div>
 <form action="event.do" method="POST">
 <table class="table table-striped table-hover, table-dark">
   		<thead class="thead thead-dark">
    <th colspan = 4 style="text-align:center" > Create an Event</th></thead> 
   
   <tr>
    <td>Title of Event:</td>
    <td><input type="text" name="title"
	placeholder="The Crimson Goat Event"> </td>
  </tr> 
    
  	<tr>
    <td>Description::</td>
    <td><input type="text" name="description" placeholder="The life span of a goat is about that of a dog.">
	</td>
     </tr>
 
    <tr>
    <td>Start Time:</td>
    <td><input type="time" name="sTime" value=""></td>
  </tr>
  
  <tr>
    <td>End Time:</td>
    <td><input type="time" name="eTime" value=""></td>
  </tr>
  
  <tr>
    <td>Max Capacity:</td>
    <td> <input type="text" name="maxCapacity" placeholder="666">  
    </td>
  </tr>
  
  
  <tr>
    <td>Number Of Tickets:</td>
    <td><input
			type="text" name="numOfTickets" placeholder="666"> </td>
  </tr>
  
  <tr>
    <td>Event Date:</td>
    <td> <input type="date" name="eDate" value="">  
    </td>
  </tr>
  
    <tr><td> <input colspan = 4 style="text-align:center" type="hidden" name="venueId" value="${venue.id}">
		<button class = "button" type="submit">Submit</button> </td></tr>
			
     </table> 
     </form>

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

<style type="text/css">
	
	.button{
	
		background: none;
		padding: 7px 15px;
		color: white;
		}
		
		.button:hover{
		color: black;
		}
}