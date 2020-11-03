<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/styles.css">
<title>Show Event</title>
</head>
<body>
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
			<p>
				<a href="home.do" class="btn btn-secondary" role="button">Back
					to Home</a>
			</p>
		</c:when>
		<c:otherwise>
    No Event found
    <br>
    
    	<p>
				<a href="home.do" class="btn btn-secondary" role="button">Back
					to Home</a>
			</p>
		</c:otherwise>
	</c:choose>
	


</body>
</html>