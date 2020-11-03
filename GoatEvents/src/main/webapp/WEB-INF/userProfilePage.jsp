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
<link rel="stylesheet" href="resources/signUpStyles.css">
<link rel="stylesheet" href="resources/homeStyles.css">
<meta charset="UTF-8">
<title>User Page (Login)</title>
</head>
<body>

	<h2>Welcome ${sessionScope.loginUser.username}!</h2>

	<br>

	<br>

	<h2>List of Your Favorite Events:</h2>
	
	<br>
	<table class="table table-striped table-hover, table-dark">
		<thead class="thead thead-dark">
			<tr>
				<th>Venue</th>
				<th>Event</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${venueFavoritesList}" var="event">
				<tr>

					<td><a>${venue.name}</a></td>
					<td><p>
<%-- 							<a href="user.do?id=${event.id}" class="text-danger">${event.title}</a>
 --%>						</p></td>
				</tr>
			</c:forEach>



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