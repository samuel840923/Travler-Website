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
 <h2>Manager Update Page</h2>
<%



%>
</div>

<form action="ManagerUpdateServlet" method="POST" id="form1">
	  <h2>Update IsManager for a Employee</h2>         
	<input name = "id" placeholder="ID" required="true"/>
	<input name = "isM" placeholder="Is Manager 1 for Yes other is no" required="true"/>
	
	<button type="submit" formmethod="post" form="form1">Submit Info</button>
	<table class="table" type = "hidden">
	<%
	List ok=new ArrayList();
	ok=(ArrayList)request.getAttribute("ok");
	if(ok!=null){
	%> 
	  
	 <%} else{ %>
	 <%} %>
	</table>
	</div>
</form>

<form action="ManagerUpdateServlet" method="POST" id="form2">
	  <h2>Update StartDate for a Employee</h2>         
	<input name = "id2" placeholder="ID" required="true"/>
	<input name = "start" placeholder="New Start Date" required="true"/>
	
	<button type="submit" formmethod="post" form="form2">Submit Info</button>
	<table class="table" type = "hidden">
	<%
	ok=new ArrayList();
	ok=(ArrayList)request.getAttribute("ok");
	if(ok!=null){
	%>  
	  
	 <%} else{ %>
	 <%} %>
	</table>
	</div>
</form>

<form action="ManagerUpdateServlet" method="POST" id="form3">
	  <h2>Update HourlyRate for a Employee</h2>         
	<input name = "id3" placeholder="ID" required="true"/>
	<input name = "rate" placeholder="New Hourly Rate" required="true"/>
	
	<button type="submit" formmethod="post" form="form3">Submit Info</button>
	<table class="table" type = "hidden">
	<%
	ok=new ArrayList();
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