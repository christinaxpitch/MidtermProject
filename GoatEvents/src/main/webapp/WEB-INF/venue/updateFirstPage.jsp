<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Update a Venue:</h3>

Please enter the venue ID of the venue you would like to update:

	<form action="findVenueByID.do" method="GET">
		ID: <input type="text" name="vid" /> <input type="submit"
			value="Get Venue" />
	</form>

</body>
</html>