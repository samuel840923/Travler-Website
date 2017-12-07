<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Timestamp"%>
<jsp:include page="navbar.jsp" />
<jsp:include page="Error.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Delete a Employee or Customer</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="Manager.css" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
 <h2>Manager Delete Page</h2>
<%



%>
<div class="container">
  
  <div class="dropdown">
    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Select
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a onclick = fun1()>Delete an Employee</a></li>
      <li><a onclick = fun2()>Delete a Customer</a></li>
      
    </ul>
  </div>
 </div>





<form action="ManagerDeleteServlet" method="POST" id="form1" style="display:none">
	  <h2>Update IsManager for a Employee</h2>         
	<input name = "id" placeholder="ID" required="true"/>
	
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
</form>

<form action="ManagerDeleteServlet" method="POST" id="form2" style="display:none">
	  <h2>Update StartDate for a Employee</h2>         
	<input name = "id2" placeholder="ID" required="true"/>
	
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