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
		<h3>Add a Venue to Our Collection!</h3>
  <form action="addVenue.do" method="POST">
  
    Name of Venue:
    <input type="text" name="name"/> 
    <br>
    Description:
    <input type="text" name="description"/> 
    <br>

	Capacity:
    <input type="number" name="capacity" value="0"/> 
    <br>
	

  </form>
  <br>
  <form action="home.do" method="GET">
		<input type="submit" class="button" value="Back" />
	</form>
	
</body>
	
	
</body>
</html>