<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
		<h2>Added a Venue to Our Collection: </h2>
		<h3>Thank you!</h3>
		<c:choose>
			<c:when test="${not empty venue}">
				<ul>
					
					<li>Venue ID: ${venue.id}</li>
					<li>Venue Name: ${venue.name}</li>
					<li>Description: ${venue.description}</li>
					<li>Capacity: ${venue.capacity}</li>

				</ul>
			</c:when>
			<c:otherwise>
				<p>Adding venue failed.</p>
			</c:otherwise>
		</c:choose>
		
		<form action="home.do" method="GET">
		<input type="submit" class="button" value="Home Page" />
	</form>
	</div>

</body>
</html>