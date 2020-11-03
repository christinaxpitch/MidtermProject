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
<title>Venue Title Page </title>
</head>
<body>
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