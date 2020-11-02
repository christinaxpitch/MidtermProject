<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="resources/signUpStyles.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<ul id="menu">
		<li><a href="home.do"><img
				src="https://svgsilh.com/svg/44670.svg" height=25px></a></li>
		<li id="signup"></li>
	</ul>
	<br>
	<form action="signUp.do" method="POST">
		<a> First Name: <br> <input type="text" name="firstName" /><br>
			Last Name: <br> <input type="text" name="lastName" /> <br>
			User Name: <br> <input type="text" name="userName" /> <br>
		<br> <input type="checkbox" name="choice-user" id="choice-user">
			<label for="choice-user">Venue Owner</label>
			<div class="reveal-if-active">
				Venue Name: <br> <input type="text" name="venueName" /><br>
				Venue Address: <br> <input type="text" name="address" /><br>
				Venue Email: <br> <input type="text" name="email" /><br>
				Venue Description: <br> <input type="text" name="description" /><br>
			</div> <input type="submit" class="button" value="Add" />
		</a>
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