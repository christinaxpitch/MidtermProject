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
<link rel="stylesheet" href="resources/signUpStyles.css">
<link rel="stylesheet" href="resources/searchstyles.css">
<link rel="stylesheet" href="resources/logInSignInStyles.css">
<meta charset="UTF-8">
<title>Sign Up Its FREE</title>
</head>
<body>
	<header>
		<c:choose>
			<c:when test="${empty sessionScope.loginUser}">
				<ul id="menu">
					<li><a href="home.do"><img
							src="https://svgsilh.com/svg/44670.svg" height=35px></a></li>
					<li>
						<div class="search-container">
							<form id="searchForm" action="search.do">
								<input id="searchText" type="text" placeholder="Search.."
									name="search">
								<button id="searchSubmit" type="submit">Search</button>
							</form>
						</div>
					</li>
					<li id="drop" class="dropdown"><input id="dropcheck"
						class="dropcheck" type="checkbox"> <label for="dropcheck"
						class="dropbtn">Log in ▼</label>
						<div class="dropdown-content">
							<form action="login.do" method="POST">
								<fieldset id="inputs">
									<input id="email" type="text" name="email"
										placeholder="Your email or username" required> <input
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
					<li><a href="home.do"><img
							src="https://svgsilh.com/svg/44670.svg" height=35px></a></li>
					<li id="signup"><a href="user.do"><img
							src="${sessionScope.loginUser.image}" height=45px width=45px></a>
					<li>
						<div class="search-container">
							<form id="searchForm" action="search.do">
								<input id="searchText" type="text" placeholder="Search.."
									name="search">
								<button id="searchSubmit" type="submit">Search</button>
							</form>
						</div>
					</li>


				</ul>
			</c:otherwise>
		</c:choose>
	</header>

	<br>
	<div id="whySignUp">
		<p>
			Why not sign up ITS FREE<br> You can buy tickets, <br> save
			your favorite venues.<br>AND MORE!
		</p>
	</div>
<!-- 	<form action="signUp.do" method="POST">
	
	<div class="slashed">
  <div class="top" title="Slashed"></div>
  <div class="bot" title="Slashed">
		<h1>
			<a> SIGN UP </a>
		</h1>
		</div>
</div>
		<br> <br>
		<h4>
			<a> First Name: </a>
		</h4>
		<input type="text" name="firstName" /><br>
		<h4>Last Name:</h4>
		<input type="text" name="lastName" /> <br>
		<h4>Email:</h4>
		<input type="email" name="email" /> <br>
		<h4>User Name:</h4>
		<input type="text" name="username" /> <br>
		<h4>Password:</h4>
		<input type="text" name="password" /> <br> <input type="hidden"
			name="enabled" value="1" /> <br> <input type="hidden"
			name="role" value="User" /> <br> <input type="checkbox"
			name="role" value="Vendor" id="choice-user" /> <label
			for="choice-user">Venue Owner</label>

		<div class="reveal-if-active">
			Venue Name: <br> <input type="text" name="name" /><br>
			Venue Street: <br> <input type="text" name="street" /><br>
			Venue City: <br> <input type="text" name="city" /><br>
			Venue State: <br> <input type="text" name="state" /><br>
			Venue Zip: <br> <input type="text" name="zip" /><br> Venue
			Phone Number: <br> <input type="text" name="phone" /><br>
			Venue Description: <br> <input type="text" name="description" /><br>
		</div>
		<input type="submit" class="button" value="Sign Up" /> <br> <br>
		<br> <br> <br> </a> -->
		
		
		
	<form action="signUp.do" method="POST">
 	<table class="table table-striped table-hover, table-dark">
  	<thead class="thead thead-dark">
    <th colspan = 4 style="text-align:center" > SIGN UP</th></thead>  
    
    <tr>
    <td>First Name:</td>
    <td><input type="text" name="firstName" placeholder= "Professor" /></td>
  </tr>
  
   <tr>
    <td>Last Name:</td>
    <td><input type="text" name="lastName" placeholder= "Tofu" /></td>
  </tr>

   <tr>
    <td>Email:</td>
    <td><input type="email" name="email" placeholder= "cryforhelp@SD.com" /> </td>
  </tr>
  
  <tr>
    <td>Username:</td>
    <td><input type="text" name="username" placeholder="dfresh99" /></td>

     <tr>
    <td>Password:</td>
    <td> <input type="text" name="password" /> <br> <input type="hidden" >
		</td>
       </tr>
       
       <input type="hidden"
			name="enabled" value="1" /> <br> <input type="hidden"
		name="role" value="User" />
        
       <!--  <tr><td>
        <input type="checkbox"
			name="role" value="Vendor" id="choice-user" /> 	<label
			for="choice-user">Venue Owner</label>
  		</td></tr> -->
  		</table>
  		
  		<div class = "container"  >
  		<input type="checkbox"
			name="role" value="Vendor" id="choice-user" /> 	<label
			for="choice-user">Venue Owner</label>
  		</td></tr>
  		
 
<div class="reveal-if-active">
 <table class="table table-striped table-hover, table-dark">

  <tr>
    <td>Venue Name:</td>
    <td><input type="text" placeholder="Venue Name"  name="name"/></td>
  </tr>
  
  <tr>
    <td>Venue Street:</td>
    <td><input type="text" placeholder="Street"  name="street"/></td>
  </tr>
  
  <tr>
    <td>Venue City:</td>
    <td><input type="text" placeholder="City"  name="city"/></td>
  </tr>
  
  
  <tr>
    <td>Venue State:</td>
    <td><select	name= "state" > 
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
        </select> </td>
  </tr>
  
  
    <tr>
    <td>Venue Zip:</td>
    <td><input type="text" maxlength="5" placeholder="11111"  name="zip"/></td>
  </tr>
  
  <tr>
    <td>Venue Phone #:</td>
    <td><input type="text" placeholder="012-345-6789"  name="phone"/></td>
  </tr>
  
  <tr>
    <td>Venue Description:</td>
    <td><input type="text" placeholder="Description" name="description" /></td>
  </tr>
    
   </div> 
  
 
     </table>
     </div> 
       <input type="submit" class="button" value="Sign Up" /> 
		
		
     </form>
		
		
		
		
		
		
		
		
		
		
		
	</form>
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