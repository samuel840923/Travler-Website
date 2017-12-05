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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
 <h2>Manager</h2>
<%



%>
</div>

<form action="ManagerServlet" method="POST">
	<input name = "Month" placeholder="Enter a month" required="true"/>
	<button type="submit" formmethod="post">Submit using POST</button>
	<div class="container" id="monSales">
	  <h2>Monthly Sales Report</h2>         
	<table class="table" type = "hidden">
	<%
	List monSales=new ArrayList();
	monSales=(ArrayList)request.getAttribute("monSales");
	if(monSales!=null && monSales.size()>0 ){
	%>
	<thead>
	      <tr>
	        <th>Month</th>
	        <th>Total Fare</th>
	      </tr>
	  </thead>    
	  <tbody> 
	
	  	<%for(int i=0;i<monSales.size();i++){
	  		List sub = (ArrayList)monSales.get(i);%>
	  	<tr>
	      <td> <%= sub.get(0) %> </td>
	      <td> <%= sub.get(1) %>  </td>
	       </tr>
	   <%} %>
	  </tbody>  
	 <%} else{ %>
	 No Result Found
	 <%} %>
	</table>
	</div>
</form>
<div class="container" id="monSales">
	  <h2>Monthly Sales Report</h2>         
	<table class="table" type = "hidden">
	<%
	List leg=new ArrayList();
	monSales=(ArrayList)request.getAttribute("legs");
	if(monSales!=null && monSales.size()>0 ){
	%>
	<thead>
	      <tr>
	        <th>AirlineID</th>
	        <th>FlightNo</th>
	        <th>LegNo</th>
	        <th>DepAirportID</th>
	        <th>ArrAirportID</th>
	        <th>ArrTime</th>
	        <th>DepTime</th>
	        <th>CurrArrTime</th>
	        <th>CurrDepTime</th>
	      </tr>
	  </thead>    
	  <tbody> 
	
	  	<%for(int i=0;i<monSales.size();i++){
	  		List sub = (ArrayList)monSales.get(i);%>
	  	<tr>
	      <td> <%= sub.get(0) %> </td>
	      <td> <%= sub.get(1) %>  </td>
	      <td> <%= sub.get(2) %>  </td>
	      <td> <%= sub.get(3) %>  </td>
	      <td> <%= sub.get(4) %>  </td>
	      <td> <%= sub.get(5) %>  </td>
	      <td> <%= sub.get(6) %>  </td>
	      <td> <%= sub.get(7) %>  </td>
	      <td> <%= sub.get(8) %>  </td>
	       </tr>
	   <%} %>
	  </tbody>  
	 <%} else{ %>
	 No Result Found
	 <%} %>
	</table>
	</div>


</body>
</html>