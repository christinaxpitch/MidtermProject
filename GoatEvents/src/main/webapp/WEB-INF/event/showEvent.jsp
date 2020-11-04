<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/styles.css">
<link rel="stylesheet" href="resources/searchstyles.css">
<title>Show Event</title>
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
	<c:choose>
		<c:when test="${! empty event}">
			<h1>Event Results</h1>
			<table>
				<tr>
					<td>Event ID:</td>
					<td>${event.id}</td>
				</tr>
				<tr>
					<td>Title:</td>
					<td>${event.title}</td>
				</tr>
				<tr>
					<td>Description :</td>
					<td>${event.description}</td>
				</tr>
				<tr>
					<td>Venue : </td>
					<td>${venue.name}</td>
				</tr>
				<tr>
					<td>Start Time</td>
					<td>${event.startTime}</td>
				</tr>
				<tr>
					<td>End Time:</td>
					<td>${event.endTime}</td>
				</tr>
				<tr>
					<td>Comments</td>
					<td>${event.comments}</td>
				</tr>
			</table>
			
		</c:when>
		<c:otherwise>
    No Event found
    <br>
		</c:otherwise>
	</c:choose>
	


</body>
</html>