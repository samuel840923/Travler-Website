<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Timestamp"%>
<jsp:include page="navbar.jsp" />
<jsp:include page="Error.jsp" />
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
 <h2>Manager</h2>
<%



%>


<form action="ManagerServlet" method="POST" id="form0">
<div class="dropdown">
    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Select
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a onclick = fun1() >Monthly Sales Report</a></li>
      <li><a onclick = fun2()>All Legs</a></li>
      <li><a onclick = fun3()>Reservation By Flight Number</a></li>
      <li><a onclick = fun4()>Reservation By Customer Name</a></li>
      <li><a onclick = fun5()>Revenue by Account Number</a></li>
      <li><a onclick = fun6()>Revenue by Flight</a></li>
      <li><a onclick = fun7()>Revenue by Airport ID</a></li>
      <li><a onclick = fun8()>Representative generates most total Revenue</a></li>
      <li><a onclick = fun9()>Customer generates most total Revenue</a></li>
      <li><a onclick = fun10()>Most active flight</a></li>
      <li><a onclick = fun11()>Customer reserved on flight</a></li>
      <li><a onclick = fun12()>Flights by Airport</a></li>
      <li><a onclick = fun13()>On time / Delay</a></li>
      
    </ul>
  </div>
</form>


<form action="ManagerServlet" method="POST" id="form1" style="display:none">
	  <h2>Monthly Sales Report</h2>         
	<input name = "Month" placeholder="Enter a month from 1-12" required="true"/>
	<button type="submit" formmethod="post" form="form1">Submit Month</button>
	<div class="container" id="monSales">
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
	 
	 <%} %>
	</table>
	</div>
</form>
<div>
</div>
<form action="ManagerServlet" method="POST" id="form2" style="display:none">
	  <h2>All Legs</h2>         
<button type="submit" formmethod="post" form="form2">Refresh Legs</button>

	<table class="table" type = "hidden">
	<%
	List leg=new ArrayList();
	leg=(ArrayList)request.getAttribute("legs");
	if(leg!=null && leg.size()>0 ){
	%>
	<thead id ="thead2" >
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
	  <tbody id="form2R"> 
	
	  	<%for(int i=0;i<leg.size();i++){
	  		List sub = (ArrayList)leg.get(i);%>
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
	 Refresh to get legs.
	 <%} %>
	</table>
</form>


<form action="ManagerServlet" method="POST" id="form3" style="display:none">
	  <h2>Reservation By Flight Number</h2>         
	<input name = "FlightNo" placeholder="Enter a flight number (All digits)" required="true"/>
	<button type="submit" formmethod="post" form="form3">Submit Flight Number</button>
	<div class="container" id="flightNumber">
	<table class="table" type = "hidden">
	<%
	List FN=new ArrayList();
	FN=(ArrayList)request.getAttribute("flightNo");
	if(FN!=null && FN.size()>0 ){
	%>
	<thead>
	      <tr>
	        <th>FlightNo</th>
	        <th>ResrNo</th>
	        <th>ResrDate</th>
	        <th>BookingFee</th>
	        <th>TotalFare</th>
	        <th>RepSSN</th>
	        <th>AccountNo</th>
	      </tr>
	  </thead>    
	  <tbody> 
	
	  	<%for(int i=0;i<FN.size();i++){
	  		List sub = (ArrayList)FN.get(i);%>
	  	<tr>
	      <td> <%= sub.get(0) %> </td>
	      <td> <%= sub.get(1) %>  </td>
	      <td> <%= sub.get(2) %>  </td>
	      <td> <%= sub.get(3) %>  </td>
	      <td> <%= sub.get(4) %>  </td>
	      <td> <%= sub.get(5) %>  </td>
	      <td> <%= sub.get(6) %>  </td>
	       </tr>
	   <%} %>
	  </tbody>  
	 <%} else{ %>
	 
	 <%} %>
	</table>
	</div>
</form>


<form action="ManagerServlet" method="POST" id="form4" style="display:none">
	  <h2>Reservation By Customer Name</h2>  
	<input name = "firstN" placeholder="Enter First Name" required="true"/>
	<input name = "lastN" placeholder="Enter Last Name" required="true"/>
	<button type="submit" formmethod="post" form="form4">Submit Customer Name</button>       
	<table class="table" type = "hidden">
	<%
	List N=new ArrayList();
	N=(ArrayList)request.getAttribute("names");
	if(N!=null && N.size()>0 ){
	%>
	<thead>
	      <tr>
	        <th>First Name</th>
	        <th>Last Name</th>
	        <th>ResrNo</th>
	        <th>ResrDate</th>
	        <th>BookingFee</th>
	        <th>TotalFare</th>
	        <th>RepSSN</th>
	        <th>AccountNo</th>
	      </tr>
	  </thead>    
	  <tbody> 
	
	  	<%for(int i=0;i<N.size();i++){
	  		List sub = (ArrayList)N.get(i);%>
	  	<tr>
	      <td> <%= sub.get(0) %> </td>
	      <td> <%= sub.get(1) %>  </td>
	      <td> <%= sub.get(2) %>  </td>
	      <td> <%= sub.get(3) %>  </td>
	      <td> <%= sub.get(4) %>  </td>
	      <td> <%= sub.get(5) %>  </td>
	      <td> <%= sub.get(6) %>  </td>
	      <td> <%= sub.get(7) %>  </td>
	       </tr>
	   <%} %>
	  </tbody>  
	 <%} else{ %>
	 
	 <%} %>
	</table>
</form>


<form action="ManagerServlet" method="POST" id="form5"style="display:none">
	  <h2>Revenue by Account Number</h2>  
	<input name = "accN" placeholder="Enter Account Number" required="true"/>
	<button type="submit" formmethod="post" form="form5">Submit Account Number</button>       
	<table class="table" type = "hidden">
	<%
	List revC=new ArrayList();
	revC=(ArrayList)request.getAttribute("revC");
	if(revC!=null && revC.size()>0 ){
	%>
	<thead>
	      <tr>
	        <th>AccountNo</th>
	        <th>SUM(TotalFare)</th>
	      </tr>
	  </thead>    
	  <tbody> 
	
	  	<%for(int i=0;i<revC.size();i++){
	  		List sub = (ArrayList)revC.get(i);%>
	  	<tr>
	      <td> <%= sub.get(0) %> </td>
	      <td> <%= sub.get(1) %>  </td>
	       </tr>
	   <%} %>
	  </tbody>  
	 <%} else{ %>
	 
	 <%} %>
	</table>
</form>

<form action="ManagerServlet" method="POST" id="form6"style="display:none">
	  <h2>Revenue by Flight</h2>  
	<input name = "airline" placeholder="Enter Airline ID" required="true"/>
	<input name = "FlightNoR" placeholder="Enter Flight Number" required="true"/>
	<button type="submit" formmethod="post" form="form6">Submit Flight</button>       
	<table class="table" type = "hidden">
	<%
	List revF=new ArrayList();
	revF=(ArrayList)request.getAttribute("revF");
	if(revF!=null && revF.size()>0 ){
	%>
	<thead>
	      <tr>
	        <th>AirlineID</th>
	        <th>FlightNo</th>
	        <th>SUM(R.TotalFare)</th>
	      </tr>
	  </thead>    
	  <tbody> 
	
	  	<%for(int i=0;i<revF.size();i++){
	  		List sub = (ArrayList)revF.get(i);%>
	  	<tr>
	      <td> <%= sub.get(0) %> </td>
	      <td> <%= sub.get(1) %>  </td>
	      <td> <%= sub.get(2) %>  </td>
	       </tr>
	   <%} %>
	  </tbody>  
	 <%} else{ %>
	 
	 <%} %>
	</table>
</form>

<form action="ManagerServlet" method="POST" id="form7"style="display:none">
	  <h2>Revenue by Airport ID</h2>  
	<input name = "arrCity" placeholder="Enter Arrival Airport ID" required="true"/>
	<button type="submit" formmethod="post" form="form7">Submit Airport ID</button>       
	<table class="table" type = "hidden">
	<%
	List revA=new ArrayList();
	revA=(ArrayList)request.getAttribute("revA");
	if(revA!=null && revA.size()>0 ){
	%>
	<thead>
	      <tr>
	        <th>Name</th>
	        <th>SUM(R.TotalFare)</th>
	      </tr>
	  </thead>    
	  <tbody> 
	
	  	<%for(int i=0;i<revA.size();i++){
	  		List sub = (ArrayList)revA.get(i);%>
	  	<tr>
	      <td> <%= sub.get(0) %> </td>
	      <td> <%= sub.get(1) %>  </td>
	       </tr>
	   <%} %>
	  </tbody>  
	 <%} else{ %>
	 
	 <%} %>
	</table>
</form>


<form action="ManagerServlet" method="POST" id="form8"style="display:none">
	  <h2>Representative generates most total Revenue </h2>       
	<table class="table" type = "hidden">
	<%
	List mostRep=new ArrayList();
	mostRep=(ArrayList)request.getAttribute("mostRep");
	if(mostRep!=null && mostRep.size()>0 ){
	%>
	<thead>
	      <tr>
	        <th>Customer Representative</th>
	        <th>Most Total Revenue</th>
	      </tr>
	  </thead>    
	  <tbody> 
	
	  	<%for(int i=0;i<mostRep.size();i++){
	  		List sub = (ArrayList)mostRep.get(i);%>
	  	<tr>
	      <td> <%= sub.get(0) %> </td>
	      <td> <%= sub.get(1) %>  </td>
	       </tr>
	   <%} %>
	  </tbody>  
	 <%} else{ %>
	 
	 <%} %>
	</table>
</form>

<form action="ManagerServlet" method="POST" id="form9"style="display:none">
	  <h2>Customer generates most total Revenue </h2>  
	<table class="table" type = "hidden">
	<%
	List mostCus=new ArrayList();
	mostCus=(ArrayList)request.getAttribute("mostCus");
	if(mostCus!=null && mostCus.size()>0 ){
	%>
	<thead>
	      <tr>
	        <th>First Name</th>
	        <th>Last Name</th>
	      </tr>
	  </thead>    
	  <tbody> 
	
	  	<%for(int i=0;i<mostCus.size();i++){
	  		List sub = (ArrayList)mostCus.get(i);%>
	  	<tr>
	      <td> <%= sub.get(0) %> </td>
	      <td> <%= sub.get(1) %>  </td>
	       </tr>
	   <%} %>
	  </tbody>  
	 <%} else{ %>
	 
	 <%} %>
	</table>
</form>


<form action="ManagerServlet" method="POST" id="form10"style="display:none">
	  <h2>Most active flight</h2>  
	<table class="table" type = "hidden">
	<%
	List mostFl=new ArrayList();
	mostFl=(ArrayList)request.getAttribute("mostFl");
	if(mostFl!=null && mostFl.size()>0 ){
	%>
	<thead>
	      <tr>
	        <th>AirlineID</th>
	        <th>FlightNo</th>
	        <th>Number Of Flights</th>
	      </tr>
	  </thead>    
	  <tbody> 
	
	  	<%for(int i=0;i<mostFl.size();i++){
	  		List sub = (ArrayList)mostFl.get(i);%>
	  	<tr>
	      <td> <%= sub.get(0) %> </td>
	      <td> <%= sub.get(1) %>  </td>
	      <td> <%= sub.get(2) %> </td>
	       </tr>
	   <%} %>
	  </tbody>  
	 <%} else{ %>
	 
	 <%} %>
	</table>
</form>

<form action="ManagerServlet" method="POST" id="form11"style="display:none">
	  <h2>Customer reserved on flight</h2>  
	<input name = "airlineidC" placeholder="Enter Airline ID" required="true"/>
	<input name = "flightnoC" placeholder="Enter Flight Number" required="true"/>
	<button type="submit" formmethod="post" form="form11">Submit Flight</button>       
	<table class="table" type = "hidden">
	<%
	List cusSeat=new ArrayList();
	cusSeat=(ArrayList)request.getAttribute("cusSeat");
	if(cusSeat!=null && cusSeat.size()>0 ){
	%>
	<thead>
	      <tr>
	        <th>AccountNo</th>
	        <th>FlightNo</th>
	        <th>AirlineID</th>
	      </tr>
	  </thead>    
	  <tbody> 
	
	  	<%for(int i=0;i<cusSeat.size();i++){
	  		List sub = (ArrayList)cusSeat.get(i);%>
	  	<tr>
	      <td> <%= sub.get(0) %> </td>
	      <td> <%= sub.get(1) %>  </td>
	      <td> <%= sub.get(2) %>  </td>
	       </tr>
	   <%} %>
	  </tbody>  
	 <%} else{ %>
	 
	 <%} %>
	</table>
</form>

<form action="ManagerServlet" method="POST" id="form12"style="display:none">
	  <h2>Flights by Airport</h2>  
	<input name = "airportN" placeholder="Enter Airport Name" required="true"/>
	<button type="submit" formmethod="post" form="form12">Submit Airport Name</button>       
	<table class="table" type = "hidden">
	<%
	List airport=new ArrayList();
	airport=(ArrayList)request.getAttribute("airport");
	if(airport!=null && airport.size()>0 ){
	%>
	<thead>
	      <tr>
	        <th>Airport</th>
	        <th>AirlineID</th>
	        <th>NaFlightNome</th>
	        <th>LegNo</th>
	        <th>DepAirportID</th>
	        <th>ArrAirportID</th>
	        <th>ArrTime</th>
	        <th>DepTime</th>
	        <th>NoOfSeats</th>
	        <th>DaysOperating</th>
	        <th>MinLengthOfStay</th>
	        <th>MaxLengthOfStay</th>
	      </tr>
	  </thead>    
	  <tbody> 
	
	  	<%for(int i=0;i<airport.size();i++){
	  		List sub = (ArrayList)airport.get(i);%>
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
	      <td> <%= sub.get(9) %>  </td>
	      <td> <%= sub.get(10) %>  </td>
	      <td> <%= sub.get(11) %>  </td>
	       </tr>
	   <%} %>
	  </tbody>  
	 <%} else{ %>
	 
	 <%} %>
	</table>
</form>

<form action="ManagerServlet" method="POST" id="form13"style="display:none">
	  <h2>On time / Delay</h2>     
	<table class="table" type = "hidden">
	<%
	List ontime=new ArrayList();
	ontime=(ArrayList)request.getAttribute("ontime");
	if(ontime!=null && ontime.size()>0 ){
	%>
	<thead>
	      <tr>
	        <th>AirlineID</th>
	        <th>NaFlightNome</th>
	        <th>LegNo</th>
	        <th>DepAirportID</th>
	        <th>ArrAirportID</th>
	        <th>ArrTime</th>
	        <th>DepTime</th>
	        <th>CurrArrTime</th>
	        <th>CurrDepTime</th>
	        <th>NoOfSeats</th>
	        <th>DaysOperating</th>
	        <th>MinLengthOfStay</th>
	        <th>MaxLengthOfStay</th>
	      </tr>
	  </thead>    
	  <tbody> 
	
	  	<%for(int i=0;i<ontime.size();i++){
	  		List sub = (ArrayList)ontime.get(i);%>
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
	      <td> <%= sub.get(9) %>  </td>
	      <td> <%= sub.get(10) %>  </td>
	      <td> <%= sub.get(11) %>  </td>
	      <td> <%= sub.get(12) %>  </td>
	       </tr>
	   <%} %>
	  </tbody>  
	 <%} else{ %>
	 
	 <%} %>
	</table>
</form>

<script>
function fun1()
{

	var x = document.getElementById("form1");
    		x.style.display = "block";
    		document.getElementById("form2").style.display = "none";
    		document.getElementById("form3").style.display = "none";
    		document.getElementById("form4").style.display = "none";
    		document.getElementById("form5").style.display = "none";
    		document.getElementById("form6").style.display = "none";
    		document.getElementById("form7").style.display = "none";
    		document.getElementById("form8").style.display = "none";
    		document.getElementById("form9").style.display = "none";
    		document.getElementById("form10").style.display = "none";
    		document.getElementById("form11").style.display = "none";
    		document.getElementById("form12").style.display = "none";
    		document.getElementById("form13").style.display = "none";
    		
    	
}
function fun2()
{

	var x = document.getElementById("form2");
    
    		x.style.display = "block";
    		document.getElementById("form1").style.display = "none";
    		document.getElementById("form3").style.display = "none";
    		document.getElementById("form4").style.display = "none";
    		document.getElementById("form5").style.display = "none";
    		document.getElementById("form6").style.display = "none";
    		document.getElementById("form7").style.display = "none";
    		document.getElementById("form8").style.display = "none";
    		document.getElementById("form9").style.display = "none";
    		document.getElementById("form10").style.display = "none";
    		document.getElementById("form11").style.display = "none";
    		document.getElementById("form12").style.display = "none";
    		document.getElementById("form13").style.display = "none";
    		
    	
}

function fun3()
{

	var x = document.getElementById("form3");
    
    		x.style.display = "block";
    		document.getElementById("form2").style.display = "none";
    		document.getElementById("form1").style.display = "none";
    		document.getElementById("form4").style.display = "none";
    		document.getElementById("form5").style.display = "none";
    		document.getElementById("form6").style.display = "none";
    		document.getElementById("form7").style.display = "none";
    		document.getElementById("form8").style.display = "none";
    		document.getElementById("form9").style.display = "none";
    		document.getElementById("form10").style.display = "none";
    		document.getElementById("form11").style.display = "none";
    		document.getElementById("form12").style.display = "none";
    		document.getElementById("form13").style.display = "none";
    		
    
}function fun4()
{

	var x = document.getElementById("form4");
    
    		x.style.display = "block";
    		document.getElementById("form2").style.display = "none";
    		document.getElementById("form3").style.display = "none";
    		document.getElementById("form1").style.display = "none";
    		document.getElementById("form5").style.display = "none";
    		document.getElementById("form6").style.display = "none";
    		document.getElementById("form7").style.display = "none";
    		document.getElementById("form8").style.display = "none";
    		document.getElementById("form9").style.display = "none";
    		document.getElementById("form10").style.display = "none";
    		document.getElementById("form11").style.display = "none";
    		document.getElementById("form12").style.display = "none";
    		document.getElementById("form13").style.display = "none";
    		
    
}function fun5()
{

	var x = document.getElementById("form5");
    
    		x.style.display = "block";
    		document.getElementById("form2").style.display = "none";
    		document.getElementById("form3").style.display = "none";
    		document.getElementById("form4").style.display = "none";
    		document.getElementById("form1").style.display = "none";
    		document.getElementById("form6").style.display = "none";
    		document.getElementById("form7").style.display = "none";
    		document.getElementById("form8").style.display = "none";
    		document.getElementById("form9").style.display = "none";
    		document.getElementById("form10").style.display = "none";
    		document.getElementById("form11").style.display = "none";
    		document.getElementById("form12").style.display = "none";
    		document.getElementById("form13").style.display = "none";
    		
    
}function fun6()
{

	var x = document.getElementById("form6");
    
    		x.style.display = "block";
    		document.getElementById("form2").style.display = "none";
    		document.getElementById("form3").style.display = "none";
    		document.getElementById("form4").style.display = "none";
    		document.getElementById("form5").style.display = "none";
    		document.getElementById("form1").style.display = "none";
    		document.getElementById("form7").style.display = "none";
    		document.getElementById("form8").style.display = "none";
    		document.getElementById("form9").style.display = "none";
    		document.getElementById("form10").style.display = "none";
    		document.getElementById("form11").style.display = "none";
    		document.getElementById("form12").style.display = "none";
    		document.getElementById("form13").style.display = "none";
    		
    
}function fun7()
{

	var x = document.getElementById("form7");
   
    		x.style.display = "block";
    		document.getElementById("form2").style.display = "none";
    		document.getElementById("form3").style.display = "none";
    		document.getElementById("form4").style.display = "none";
    		document.getElementById("form5").style.display = "none";
    		document.getElementById("form6").style.display = "none";
    		document.getElementById("form1").style.display = "none";
    		document.getElementById("form8").style.display = "none";
    		document.getElementById("form9").style.display = "none";
    		document.getElementById("form10").style.display = "none";
    		document.getElementById("form11").style.display = "none";
    		document.getElementById("form12").style.display = "none";
    		document.getElementById("form13").style.display = "none";
    		
    
}function fun8()
{

	var x = document.getElementById("form8");
    
    		x.style.display = "block";
    		document.getElementById("form2").style.display = "none";
    		document.getElementById("form3").style.display = "none";
    		document.getElementById("form4").style.display = "none";
    		document.getElementById("form5").style.display = "none";
    		document.getElementById("form6").style.display = "none";
    		document.getElementById("form7").style.display = "none";
    		document.getElementById("form1").style.display = "none";
    		document.getElementById("form9").style.display = "none";
    		document.getElementById("form10").style.display = "none";
    		document.getElementById("form11").style.display = "none";
    		document.getElementById("form12").style.display = "none";
    		document.getElementById("form13").style.display = "none";
    		
    
}function fun9()
{

	var x = document.getElementById("form9");
    
    		x.style.display = "block";
    		document.getElementById("form2").style.display = "none";
    		document.getElementById("form3").style.display = "none";
    		document.getElementById("form4").style.display = "none";
    		document.getElementById("form5").style.display = "none";
    		document.getElementById("form6").style.display = "none";
    		document.getElementById("form7").style.display = "none";
    		document.getElementById("form8").style.display = "none";
    		document.getElementById("form1").style.display = "none";
    		document.getElementById("form10").style.display = "none";
    		document.getElementById("form11").style.display = "none";
    		document.getElementById("form12").style.display = "none";
    		document.getElementById("form13").style.display = "none";
    		
    	
}function fun10()
{

	var x = document.getElementById("form10");
    
    		x.style.display = "block";
    		document.getElementById("form2").style.display = "none";
    		document.getElementById("form3").style.display = "none";
    		document.getElementById("form4").style.display = "none";
    		document.getElementById("form5").style.display = "none";
    		document.getElementById("form6").style.display = "none";
    		document.getElementById("form7").style.display = "none";
    		document.getElementById("form8").style.display = "none";
    		document.getElementById("form9").style.display = "none";
    		document.getElementById("form1").style.display = "none";
    		document.getElementById("form11").style.display = "none";
    		document.getElementById("form12").style.display = "none";
    		document.getElementById("form13").style.display = "none";
    	
}function fun11()
{

	var x = document.getElementById("form11");
   
    		x.style.display = "block";
    		document.getElementById("form2").style.display = "none";
    		document.getElementById("form3").style.display = "none";
    		document.getElementById("form4").style.display = "none";
    		document.getElementById("form5").style.display = "none";
    		document.getElementById("form6").style.display = "none";
    		document.getElementById("form7").style.display = "none";
    		document.getElementById("form8").style.display = "none";
    		document.getElementById("form9").style.display = "none";
    		document.getElementById("form10").style.display = "none";
    		document.getElementById("form1").style.display = "none";
    		document.getElementById("form12").style.display = "none";
    		document.getElementById("form13").style.display = "none";
    	
}function fun12()
{

	var x = document.getElementById("form12");
    
    		x.style.display = "block";
    		document.getElementById("form2").style.display = "none";
    		document.getElementById("form3").style.display = "none";
    		document.getElementById("form4").style.display = "none";
    		document.getElementById("form5").style.display = "none";
    		document.getElementById("form6").style.display = "none";
    		document.getElementById("form7").style.display = "none";
    		document.getElementById("form8").style.display = "none";
    		document.getElementById("form9").style.display = "none";
    		document.getElementById("form10").style.display = "none";
    		document.getElementById("form11").style.display = "none";
    		document.getElementById("form1").style.display = "none";
    		document.getElementById("form13").style.display = "none";
    		
    	
}function fun13()
{

	var x = document.getElementById("form13");
    
    		x.style.display = "block";
    		document.getElementById("form2").style.display = "none";
    		document.getElementById("form3").style.display = "none";
    		document.getElementById("form4").style.display = "none";
    		document.getElementById("form5").style.display = "none";
    		document.getElementById("form6").style.display = "none";
    		document.getElementById("form7").style.display = "none";
    		document.getElementById("form8").style.display = "none";
    		document.getElementById("form9").style.display = "none";
    		document.getElementById("form10").style.display = "none";
    		document.getElementById("form11").style.display = "none";
    		document.getElementById("form12").style.display = "none";
    		document.getElementById("form1").style.display = "none";
    	
}


</script>
</div>
</body>
</html>