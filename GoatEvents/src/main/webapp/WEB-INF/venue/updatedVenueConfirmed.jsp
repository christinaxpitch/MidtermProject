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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
<h3>New Venue Details:</h3>

		<c:choose>
			<c:when test="${not empty venue}">
				<ul>
					
					<li>Venue ID: ${venue.id}</li>
					<li>Venue Name: ${venue.name}</li>
					<li>Description: ${venue.description}</li>
					<li>Capacity: ${venue.capacity}</li>
					<li>Last Updated: ${venue.lastUpdate}</li>
					<li>Address: ${venue.address.street} ${venue.address.city}, ${venue.address.state} ${venue.address.zip}</li>

				</ul>
			</c:when>
			<c:otherwise>
				<p>Adding venue failed.</p>
			</c:otherwise>
		</c:choose>
		<h2>Thank you for updating your venue!</h2>
		<form action="home.do" method="GET">
		<input type="submit" class="button" value="Home Page" />
	</form>
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