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
</div><div class="container">
  
  <div class="dropdown">
    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Select
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a onclick = fun1()>Update Employee IsManager</a></li>
      <li><a onclick = fun2()>Update Employee StartDate</a></li>
      <li><a onclick = fun3()>Update Employee Hourly Rate</a></li>
      
      <li><a onclick = fun4()>Update Customer Credit Card Number</a></li>
      
      <li><a onclick = fun5()>Update Customer Email</a></li>
      <li><a onclick = fun6()>Update Customer Rating</a></li>
      
    </ul>
  </div>
</div>


</body>
</html>



<form action="ManagerUpdateServlet" method="POST" id="form1" style="display:none">
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

<form action="ManagerUpdateServlet" method="POST" id="form2" style="display:none">
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

<form action="ManagerUpdateServlet" method="POST" id="form3" style="display:none">
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

<form action="ManagerUpdateServlet" method="POST" id="form4" style="display:none">
	  <h2>Update Credit Card # for a customer</h2>         
	<input name = "id4" placeholder="ID" required="true"/>
	<input name = "credit" placeholder="New Credit Card #" required="true"/>
	
	<button type="submit" formmethod="post" form="form4">Submit Info</button>
	</div>
</form>

<form action="ManagerUpdateServlet" method="POST" id="form5" style="display:none">
	  <h2>Update Email for a customer</h2>         
	<input name = "id5" placeholder="ID" required="true"/>
	<input name = "email" placeholder="New Email" required="true"/>
	
	<button type="submit" formmethod="post" form="form5">Submit Info</button>
	</div>
</form>

<form action="ManagerUpdateServlet" method="POST" id="form6" style="display:none">
	  <h2>Update Rating for a customer</h2>         
	<input name = "id6" placeholder="ID" required="true"/>
	<input name = "rateC" placeholder="New Rating" required="true"/>
	
	<button type="submit" formmethod="post" form="form6">Submit Info</button>
	</div>
</form>

<script>


function fun1()
{

	var x = document.getElementById("form1");
	var y = document.getElementById("form2");
	var z = document.getElementById("form3");
	var c1 = document.getElementById("form4");
    if (x.style.display=="none")
    	{
    		x.style.display = "block";
    		y.style.display = "none";
    		z.style.display = "none";
    		c1.style.display = "none";
    		document.getElementById("form5").style.display = "none";
    		document.getElementById("form6").style.display = "none";
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
	var z = document.getElementById("form3");

	var c1 = document.getElementById("form4");
	
    if (y.style.display=="none")
    	{
    		y.style.display = "block";
    		x.style.display = "none";
    		z.style.display = "none";

    		c1.style.display = "none";
    		document.getElementById("form5").style.display = "none";
    		document.getElementById("form6").style.display = "none";
    	}
    else
    	{
    		y.style.display = "none";
    	}
	}

function fun3()
{

var x = document.getElementById("form1");
var y = document.getElementById("form2");
var z = document.getElementById("form3");

var c1 = document.getElementById("form4");

if (z.style.display=="none")
	{
		z.style.display = "block";
		x.style.display = "none";
		y.style.display = "none";

		c1.style.display = "none";

		document.getElementById("form5").style.display = "none";
		document.getElementById("form6").style.display = "none";
	}
else
	{
		z.style.display = "none";
	}
}

function fun4()
{


var c1 = document.getElementById("form4");

if (c1.style.display=="none")
	{
		c1.style.display = "block";
		document.getElementById("form1").style.display = "none";
		document.getElementById("form2").style.display = "none";
		document.getElementById("form3").style.display = "none";

		document.getElementById("form5").style.display = "none";
		document.getElementById("form6").style.display = "none";
	}
else
	{
		c1.style.display = "none";
	}
}

function fun5(){
var c2 = document.getElementById("form5");

if (c2.style.display=="none")
	{
		c2.style.display = "block";
		document.getElementById("form1").style.display = "none";
		document.getElementById("form2").style.display = "none";
		document.getElementById("form3").style.display = "none";

		document.getElementById("form4").style.display = "none";
		document.getElementById("form6").style.display = "none";
	}
else
	{
		c2.style.display = "none";
	}
}

function fun6(){
	var c3 = document.getElementById("form6");

	if (c3.style.display=="none")
		{
			c3.style.display = "block";
			document.getElementById("form1").style.display = "none";
			document.getElementById("form2").style.display = "none";
			document.getElementById("form3").style.display = "none";

			document.getElementById("form4").style.display = "none";
			document.getElementById("form5").style.display = "none";
		}
	else
		{
			c3.style.display = "none";
		}
	}
</script>






</body>
</html>