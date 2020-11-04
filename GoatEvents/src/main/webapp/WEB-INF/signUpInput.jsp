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
<link rel="stylesheet" href="resources/signUpStyles.css">
<link rel="stylesheet" href="resources/searchstyles.css">
<link rel="stylesheet" href="resources/logInSignInStyles.css">
<meta charset="UTF-8">
<title>Sign Up Its FREE</title>
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
					<li id="drop" class="dropdown"><input id="dropcheck"
						class="dropcheck" type="checkbox"> <label for="dropcheck"
						class="dropbtn">Log in ▼</label>
						<div class="dropdown-content">
							<form action="login.do" method="GET">
								<fieldset id="inputs">
									<input id="email" type="text" name="email"
										placeholder="Your email or username" required> <input
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
					<li id="signup"><a href="user.do"><img
							src="${sessionScope.loginUser.image}" height=45px width=45px></a>
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

	<br>
	<div id="whySignUp">
		<p>
			Why not sign up ITS FREE<br> You can buy tickets, <br> save
			your favorite venues.<br>AND MORE!
		</p>
	</div>
	<form action="signUp.do" method="POST">
		<h4>
			<a> SIGN UP 
		</h4>
		<h4>
			<a> First Name: 
		</h4>
		<input type="text" name="firstName" /><br>
		<h4>Last Name:</h4>
		<input type="text" name="lastName" /> <br>
		<h4>Email:</h4>
		<input type="email" name="email" /> <br>
		<h4>User Name:</h4>
		<input type="text" name="username" /> <br>
		<h4>Password:</h4>
		<input type="text" name="password" /> <br> <input type="hidden"
			name="enabled" value="1" /> <br> <input type="hidden"
			name="role" value="User" /> <br> <input type="checkbox"
			name="role" value="Vendor" id="choice-user" /> <label
			for="choice-user">Venue Owner</label>

		<div class="reveal-if-active">
			Venue Name: <br> <input type="text" name="name" /><br>
			Venue Street: <br> <input type="text" name="street" /><br>
			Venue City: <br> <input type="text" name="city" /><br>
			Venue State: <br> <input type="text" name="state" /><br>
			Venue Zip: <br> <input type="text" name="zip" /><br> Venue
			Phone Number: <br> <input type="text" name="phone" /><br>
			Venue Description: <br> <input type="text" name="description" /><br>
		</div>
		<input type="submit" class="button" value="Add" /> <br> <br>
		<br> <br> <br> </a>
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