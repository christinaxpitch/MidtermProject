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
<link rel="stylesheet" href="resources/searchstyles.css">
<link rel="stylesheet" href="resources/logInSignInStyles.css">
<meta charset="UTF-8">
<title>Add a Venue</title>
</head>
<body>

<header>
<c:choose>
<c:when test="${empty sessionScope.loginUser}">
<ul id="menu">
  <li><a href="home.do"><img src="https://svgsilh.com/svg/44670.svg" height=35px></a></li>
       <li>   <div class="search-container">
    <form id="searchForm" action="search.do">
      <input id="searchText" type="text" placeholder="Search.." name="search">
      <button id="searchSubmit" type="submit">Search</button>
    </form>
  </div></li>
        <li id="signup">
        <a href="signUpInput.do">Sign up FREE</a>
      </li>
		<li id="drop" class="dropdown"><input id="dropcheck"
			class="dropcheck" type="checkbox"> <label for="dropcheck"
			class="dropbtn">Log in ▼</label>
			<div class="dropdown-content">
				<form action="login.do" method="GET">
					<fieldset id="inputs">
						<input id="email" type="text" name="email"
							placeholder="Your email address" required> <input
							id="password" type="password" name="password"
							placeholder="Password" required>
					</fieldset>
					<fieldset id="actions">
						<input type="submit" id="submit" value="Log in">
					</fieldset>
				</form>
			</div></li>
    </ul>
</c:when>
<c:otherwise>
<ul id="menu">
  <li><a href="home.do"><img src="https://svgsilh.com/svg/44670.svg" height=35px></a></li>
 <li>   <div class="search-container">
    <form id="searchForm" action="search.do">
      <input id="searchText" type="text" placeholder="Search.." name="search">
      <button id="searchSubmit" type="submit">Search</button>
    </form>
  </div></li>
<li id="signup">
        <a href="user.do"><img src="${sessionScope.loginUser.image}" height=45px width=45px></a>
       </ul>
</c:otherwise>
</c:choose>
</header>


<div>
<h3>Add a Venue to Our Collection:</h3>
  <form action="addVenue.do" method="POST">
  
  <br>
  <br>
    Venue Street Address:<br>
    <input type="text" name="street"/> 
    <br>
    Venue City:<br>
    <input type="text" name="city"/> 
    <br>
    Venue State:<br>   
  			<select	name= "state" > 
            <option value="AL">AL</option> 
            <option value="AK">AK</option> 
            <option value="AZ">AZ</option> 
            <option value="CA">CA</option> 
            <option value="CO">CO</option>
            <option value="CT">CT</option> 
            <option value="DE">DE</option> 
            <option value="FL">FL</option> 
            <option value="GA">GA</option> 
            <option value="HI">HI</option> 
            <option value="ID">ID</option> 
            <option value="IL">IL</option> 
            <option value="IN">IN</option> 
            <option value="IA">IA</option> 
            <option value="KS">KS</option>
            <option value="KY">KY</option> 
            <option value="ME">ME</option> 
            <option value="MD">MD</option> 
            <option value="MA">MA</option> 
            <option value="MI">MI</option>
            <option value="MN">MN</option> 
            <option value="MS">MS</option> 
            <option value="MO">MO</option> 
            <option value="MT">MT</option> 
            <option value="NE">NE</option>
            <option value="NV">NV</option> 
            <option value="NH">NH</option> 
            <option value="NJ">NJ</option> 
            <option value="NM">NM</option> 
            <option value="NY">NY</option> 
            <option value="NC">NC</option> 
            <option value="ND">ND</option> 
            <option value="OH">OH</option> 
            <option value="OK">OK</option> 
            <option value="OR">OR</option>
            <option value="PA">PA</option> 
            <option value="RI">RI</option> 
            <option value="SC">SC</option> 
            <option value="SD">SD</option> 
            <option value="TX">TX</option> 
            <option value="UT">UT</option> 
            <option value="VT">VT</option> 
            <option value="VA">VA</option> 
            <option value="WA">WA</option> 
            <option value="WV">WV</option> 
            <option value="WI">WI</option> 
            <option value="WY">WY</option>     
        </select> 
	 <br>
	Venue Zip Code:<br>
    <input type="text" name="zip"/> 
    <br>
	Venue Phone Number:<br>
    <input type="text" name="phone"/> 
    <br>
   
    Name of Venue:<br>
    <input type="text" name="name"/> 
    <br>
    Description:<br>
    <input type="text" name="description"/> 
    <br>

	Capacity:<br>
    <input type="number" name="capacity" value="0"/> 
    <br>
	
<br>
	<button type="submit" >Submit</button>
			</form><br>
			<br>			
  <br>
	
</body>
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