<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Timestamp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="Manager.css" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
 <h2>Manager Edit Page</h2>
<%



%>
</div>

<form action="ManagerEditServlet" method="POST" id="form1">
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
	
	<button type="submit" formmethod="post" form="form1">Submit Info</button>
	<table class="table" type = "hidden">
	<%
	List ok=new ArrayList();
	ok=(ArrayList)request.getAttribute("ok");
	if(ok!=null){
	%>
	<thead>
	      <tr>
	        <th>Succeed!</th>
	      </tr>
	  </thead>    
	  
	 <%} else{ %>
	 <%} %>
	</table>
	</div>
</form>






</body>
</html>