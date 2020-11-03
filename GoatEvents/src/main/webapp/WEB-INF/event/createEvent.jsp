<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>Create New Event</h4>
	<form action="event.do" method="POST">
		<label for="title">Title</label> <input type="text" name="title" value="The Crimson Goat Event"> 
		<br> 
		<label for="description">Description:</label> 
		<input type="text" name="description" value="top 2 not 2"> 
		<br>
		<label for="sTime">Start Time:</label> 
		<input type="time" name="sTime" value=""> 
		<br> 
		<label for="eTime">End Time:</label> 
		<input type="time" name="eTime" value=""> 
		<br> 
	    <label for="venue.id">Venue ID:</label> 
		<input type="hidden" name="venue.id" value="${venue.id}"> 
		<br> 
		<label for="maxCapacity">Max Capacity:</label>
		<input type="text" name="maxCapacity" value="50000"> 
		<br>
		<label for="numOfTickets">Number Of Tickets:</label>
		<input type="text" name="numOfTickets" value="50000"> 
		<br>
		<label for="eventDate">Event Date:</label>
		<input type="datetime-local" name="eventDate" value=""> 
		<br>
		
		<button type="submit" name = "vid" value = "${venue.id}">Submit</button>
	</form>
</body>
</html>