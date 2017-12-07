<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Timestamp"%>
<jsp:include page="navbar.jsp" />
<jsp:include page="Error.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Add Employee or Customer</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <style type="text/css">
  	.button {
  	background-color: #00bfff;
  	border: none;
  	
  	}
  	body {
  		background-image:url("background/back3.jpg");
  		background-size:     cover;                     
    		background-repeat:   no-repeat;
  	}
  	
  	input {
  		width: 30%;
  		border:none;
  		border-bottom: 1px solid #555;
  		color: black;
  		margin-bottom: 15px;
  		margin-right:5px
  	}
  </style>
</head>
<body>

<div class="container">
 <h2>Manager Edit Page</h2>
<%



%>

<div class="container">
  
  <div class="dropdown">
    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Select
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a onclick = fun1()>Add an Employee</a></li>
      <li><a onclick = fun2()>Add a Customer</a></li>
      
    </ul>
  </div>
</div>



<form action="ManagerEditServlet" method="POST" id="form1" style="display:none;">
	  <h2>Add a Employee</h2>         
	<input name = "id" placeholder="ID" required="true"/>
	<input name = "first" placeholder="First Name" required="true"/>
	<input name = "last" placeholder="Last Name" required="true"/>
	<input name = "add" placeholder="Address" required="true"/>
	<input name = "city" placeholder="City" required="true"/>
	<input name = "state" placeholder="State" required="true"/>
	<input name = "zip" placeholder="Zipcode" required="true"/>
	<input name = "SSN" placeholder="SSN" required="true"/>
	<input name = "isM" placeholder="Is Manager 0 or 1" required="true"/>
	<input name = "start" placeholder="Start Date" required="true"/>
	<input name = "hourly" placeholder="Hourly Rate" required="true"/>
	
	<button class="button" type="submit" formmethod="post" form="form1">Submit Info</button>
	
</form>

<form action="ManagerEditServlet" method="POST" id="form2" style="display:none;">
	  <h2>Add a Customer</h2>         
	<input name = "id" placeholder="ID" required="true"/>
	<input name = "first" placeholder="First Name" required="true"/>
	<input name = "last" placeholder="Last Name" required="true"/>
	<input name = "add" placeholder="Address" required="true"/>
	<input name = "city" placeholder="City" required="true"/>
	<input name = "state" placeholder="State" required="true"/>
	<input name = "zip" placeholder="Zipcode" required="true"/>
	<input name = "accountno" placeholder="Account number" required="true"/>
	<input name = "credit" placeholder="Credit card #" required="true"/>
	<input name = "email" placeholder="Email" required="true"/>
	<input name = "creation" placeholder="Creation Date" required="true"/>
	<input name = "rate" placeholder="Rating" required="true"/>
	<input name = "pass" placeholder="Password" required="true"/>
	
	<button class="button" type="submit" formmethod="post" form="form2">Submit Info</button>
	
</form>

<script>


function fun1()
{

	var x = document.getElementById("form1");
	var y = document.getElementById("form2");
    if (x.style.display=="none")
    	{
    		x.style.display = "block";
    		y.style.display = "none";
    	}
    else
    	{
    		x.style.display = "none";
    	}
}

function fun2()
	{

	var x = document.getElementById("form1");
	var y = document.getElementById("form2");
    if (y.style.display=="none")
    	{
    		y.style.display = "block";
    		x.style.display = "none";
    	}
    else
    	{
    		y.style.display = "none";
    	}
}
</script>


</div>
</body>
</html>