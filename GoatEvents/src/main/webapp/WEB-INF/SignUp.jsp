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


	<form action="signUp.do" method="POST">
		<a> First Name: <input type="text" name="episodes" /><br>
			Last Name: <input type="text" name="firstEpisode" /> <br> User
			Name: <input type="text" name="seasonName" /> <br> <input
			type="submit" class="button" value="Add" /> <input type="checkbox"
			name="choice-animals" id="choice-animals-dogs"> <label
			for="choice-animals-dogs">Venue Owner</label>
			<div class="reveal-if-active">
				Venue Name: <input type="text" name="episodes" /><br> Venue
				Address: <input type="text" name="episodes" /><br> Venue
				Email: <input type="text" name="episodes" /><br> Venue
				Description: <input type="text" name="episodes" /><br>
			</div> <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
				integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
				crossorigin="anonymous"></script> <script
				src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
				integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
				crossorigin="anonymous"></script> <script
				src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
				integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
				crossorigin="anonymous"></script>
</body>
</html>