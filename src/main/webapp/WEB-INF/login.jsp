<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
   

<!DOCTYPE html>
<html>
<head>
<title>COOL STUFF</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<style>
h1,h2,h3,h4,h5,h6,a {font-family: "Oswald"}
body {font-family: "Open Sans"}
</style>
<script type="text/javascript" src="/js/app.js"></script>
</head>
<body class="w3-light-grey">

<!-- Navigation bar with social media icons -->
<div class="w3-bar w3-black w3-hide-small">
	<h3 class="w3-margin-left w3-bar-item w3-button " >COOL STUFF</h3>
	
	<a href="/coolstuff" class=" w3-padding-24 w3-margin-right w3-bar-item w3-button w3-right w3-large" > BACK </a>
  
</div>
  
<!-- w3-content defines a container for fixed size centered content, 
and is wrapped around the whole page content, except for the footer in this example -->
<div class="w3-content" style="max-width:1600px">

  <!-- Header -->
  <header class="w3-container w3-center w3-padding-48 w3-white">
    <h1 class="w3-xxxlarge"><b>LOGIN & REGISTER</b></h1>
    <h6 class="w3-tag">STAY COOL, HANG LOOSE, ADMIT NOTHING </h6>
  </header>
 	<br>
	<div class="w3-white w3-margin-top">
        <div class="w3-container w3-padding w3-black">
          <h4>Login</h4>
        </div>
        <form:form action="/login" method="post" modelAttribute="newLogin">
	        <div class="w3-container w3-white">
		        <div>
		          <p><label>Email:</label></p>
		          <p><form:input path="email" class="w3-input w3-border"  placeholder="Enter e-mail" style="width:100%"/></p>
		       	  <form:errors path="email" class="text-danger" />
		        </div>
	        	<div>
		          <p><label>Password:</label></p>
		          <p><form:password path="password" class="w3-input w3-border"  placeholder="Enter password" style="width:100%"/></p>
	        	  <form:errors path="password" class="text-danger" />
	        	</div>
		         <p><input type="submit" value="Login" class="w3-button  w3-red"></p>
	        </div>
	    </form:form>
     </div>
     <br>
     
     <div class="w3-white w3-margin-top">
        <div class="w3-container w3-padding w3-black">
          <h4>Register</h4>
        </div>
        
        <form:form action="/register" method="post" modelAttribute="newUser">
	        <div class="w3-container w3-white">
	        	<div>
		          <p><label>User Name:</label></p>
		          <p><form:input path="userName" class="w3-input w3-border"  placeholder="Enter username" style="width:100%"/></p>
	        	  <form:errors path="userName" class="text-danger" />
	        	</div>
	        	<div>
		          <p><label>Email:</label></p>
		          <p><form:input path="email" class="w3-input w3-border" placeholder="Enter e-mail" style="width:100%"/></p>
		          <form:errors path="email" class="text-danger" />
	        	</div>
	        	<div>
		          <p><label>Password:</label></p>
		          <p><form:password path="password" class="w3-input w3-border"  placeholder="Enter password" style="width:100%"/></p>
		          <form:errors path="password" class="text-danger" />
	        	</div>
	        	<div>
		          <p><label>Confirm Password:</label></p>
		          <p><form:password path="confirm" class="w3-input w3-border"  placeholder="Confirm password" style="width:100%"/></p>
	        	  <form:errors path="confirm" class="text-danger" />
	        	</div>
	          	  <p><input type="submit" value="Register"  class="w3-button  w3-red"></p>
	        </div>
        </form:form>
     </div>


  <!-- END GRID -->
  </div>

<br>
<!-- Footer -->
<footer class="w3-container w3-black w3-margin-top  " style="padding:16px">
  <p class="w3-right">Powered by <a href="" target="_blank">WD</a></p>
</footer>



</body>
</html>
