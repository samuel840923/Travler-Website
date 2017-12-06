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
 <h2>Manager</h2>
<%



%>
</div>



<form action="ManagerServlet" method="POST" id="form1">
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
	 No Result Found
	 <%} %>
	</table>
	</div>
</form>
<div>
</div>
<form action="ManagerServlet" method="POST" id="form2">
	  <h2>All Legs</h2>         
<button type="submit" formmethod="post" form="form2">Refresh Legs</button>
	<table class="table" type = "hidden">
	<%
	List leg=new ArrayList();
	leg=(ArrayList)request.getAttribute("legs");
	if(leg!=null && leg.size()>0 ){
	%>
	<thead id ="thead2" style="display:none">
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
	  <tbody id="form2R" style="display:none"> 
	
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

<button onclick="myFunctionLeg()">Show/Hide Legs</button>
<script>
function myFunctionLeg() {
    var x = document.getElementById("form2R");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
    x = document.getElementById("thead2");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}
</script>


<form action="ManagerServlet" method="POST" id="form3">
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
	 No Result Found
	 <%} %>
	</table>
	</div>
</form>


<form action="ManagerServlet" method="POST" id="form4">
	  <h2>Reservation By Customer Name</h2>  
	<input name = "firstN" placeholder="Enter First Name" required="true"/>
	<input name = "lastN" placeholder="Enter Last Name" required="true"/>
	<button type="submit" formmethod="post" form="form4">Submit Flight Number</button>       
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
	 No Result Found
	 <%} %>
	</table>
</form>


<form action="ManagerServlet" method="POST" id="form5">
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
	 No Result Found
	 <%} %>
	</table>
</form>

<form action="ManagerServlet" method="POST" id="form6">
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
	 No Result Found
	 <%} %>
	</table>
</form>

<form action="ManagerServlet" method="POST" id="form7">
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
	 No Result Found
	 <%} %>
	</table>
</form>


<form action="ManagerServlet" method="POST" id="form8">
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
	 No Result Found
	 <%} %>
	</table>
</form>

<form action="ManagerServlet" method="POST" id="form9">
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
	 No Result Found
	 <%} %>
	</table>
</form>


<form action="ManagerServlet" method="POST" id="form10">
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
	 No Result Found
	 <%} %>
	</table>
</form>

<form action="ManagerServlet" method="POST" id="form11">
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
	 No Result Found
	 <%} %>
	</table>
</form>

<form action="ManagerServlet" method="POST" id="form12">
	  <h2>Flights by Aiport</h2>  
	<input name = "airportN" placeholder="Enter Airport Name" required="true"/>
	<button type="submit" formmethod="post" form="form12">Submit Airport ID</button>       
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
	 No Result Found
	 <%} %>
	</table>
</form>

<form action="ManagerServlet" method="POST" id="form13">
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
	 No Result Found
	 <%} %>
	</table>
</form>


</body>
</html>