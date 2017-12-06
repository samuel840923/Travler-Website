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
 <h2>Profile</h2>
<%
String fname = (String)request.getAttribute("fname"); 
String lname = (String)request.getAttribute("lname"); 
String address = (String)request.getAttribute("address"); 
String city = (String)request.getAttribute("city");
String state = (String)request.getAttribute("state"); 
int zip = (int)request.getAttribute("zip");
String credit= (String)request.getAttribute("credit"); 
String email = (String)request.getAttribute("email"); 
Timestamp create = (Timestamp)request.getAttribute("create"); 
int rate = (int)request.getAttribute("rating");
List pref = (ArrayList)request.getAttribute("pref"); 


%>

   <div class="form-group row">
           <div class="col-xs-4">
          <label for="ex1">Name: </label>
          <label for="ex1"><%= fname + " " + lname%>  </label>
          </div>
  </div>
  <div class="form-group row">
           <div class="col-xs-4">
          <label for="ex1">Address:</label>
          <label for="ex1"><%=address+" "+city+" "+state+" "+zip  %> </label>
          </div>
  </div>
  
   <div class="form-group row">
           <div class="col-xs-4">
          <label for="ex1">Email:</label>
          <label for="ex1"><%=email %></label>
          </div>
  </div>
  <div class="form-group row">
           <div class="col-xs-4">
          <label for="ex1">Creation Date</label>
          <label for="ex1"><%= create %></label>
          </div>
  </div>
  <div class="form-group row">
           <div class="col-xs-4">
          <label for="ex1">Credit Card:</label>
          <label for="ex1"><%= credit %></label>
          </div>
  </div>
  <div class="form-group row">
           <div class="col-xs-4">
          <label for="ex1">Rating:</label>
          <label for="ex1"><%= rate %></label>
          </div>
  </div>
  <div class="form-group row">
           <div class="col-xs-4">
          <label for="ex1">Preference:</label>
          <% for (int i=0;i<pref.size();i++){ %>
          <label for="ex1"><%= pref.get(i) %></label>
          <%} %>
          </div>
  </div>
  
  <form action = "CustomerUpdatejsp.jsp"  method = "post">
           <div class="col-xs-4">
         <button type="submit" class="btn btn-primary">Edit</button>
          </div>
  </form>
  
  
  <div class="form-group row">
  <form action = "ReservationListServlet"  method = "post">
           <div class="col-xs-4">
         <button type="submit" class="btn btn-primary">See Reservation</button>
          </div>
  </form>
  </div>
</div>
<div class="container">
 <h2>Current BID</h2>
<table class="table">
<%
/*
request.setAttribute("currentbid",current_bid); 
	request.setAttribute("bid",bid); 
	request.setAttribute("customerbid",customer_bid); 
	request.setAttribute("bestsell",best_sell); 
	request.setAttribute("flightsuggest",flight_suggest); 
*/
List current=new ArrayList();
 current=(ArrayList)request.getAttribute("currentbid");
if(current!=null && current.size()>0 ){
%>
  <thead>
      <tr>
        <th>The Price You Named</th>
         <th>AirLine ID</th>
          <th>Flight Number</th>
      </tr>
  </thead> 
   
  <tbody> 
  
  <%for(int i=0;i<current.size();i++){ 
  	List sub = (ArrayList)current.get(i);%>
  		<tr>
      <td> <%= sub.get(0) %> </td>
      <td> <%= sub.get(1) %> </td>
      <td> <%= sub.get(2) %> </td>
      </tr>
      <% }%>
       
  </tbody>     
<%} else{ %>
No Search Found
<%} %>
</table>
</div>
<div class="container">
  <h2>BID History</h2>         
<table class="table">
<% 
List bid=new ArrayList();
 bid=(ArrayList)request.getAttribute("bid");
if(bid!=null && bid.size()>0 ){
	
%>
<thead>
      <tr>
        <th>NYOP</th>
        <th>Airline ID</th>
        <th>Flight Number</th>
        <th>Class</th>
        <th>Date</th>
      </tr>
  </thead>    
  <tbody> 
  
  	<%for(int i=0;i<bid.size();i++){
  		List sub = (ArrayList)bid.get(i);%>
  	
  	<tr>
      <td> <%= sub.get(0) %> </td>
      <td> <%= sub.get(1) %> </td>
      <td> <%= sub.get(2) %> </td>
      <td> <%= sub.get(3) %> </td>
      <td> <%= sub.get(4) %></td>
       </tr>
      <%} %>
      
  </tbody>     
<%} %>
<form action = "CustomerServlet" >
<div class="form-group row">
      <div class="col-xs-4">
        <label for="ex1">Search For BID with Flight ID and Airline ID</label>
        <br>
         <label for="ex1">Airline ID</label>
        <input class="form-control" name="airid" type="text" required>
         <label for="ex1">Flight Number</label>
        <input class="form-control" name="flightid" type="text" required>
      </div>  
</div>
<div class="form-group row">
 <div class="col-xs-4">
          <button type="submit" class="btn btn-primary">Search</button>
     </div>
</div>
</form>

</table>
</div>
<div class="container">
  <h2>Your Reservation History</h2>         
<table class="table">
<%
List customerbid=new ArrayList();
customerbid=(ArrayList)request.getAttribute("customerbid");
if(customerbid!=null && customerbid.size()>0 ){
%>
<thead>
      <tr>
        <th>Reserve Number</th>
        <th>Reserve Date</th>
        <th>Booking Fee</th>
        <th>Total Fee</th>
      </tr>
  </thead>    
  <tbody> 

  	<%for(int i=0;i<customerbid.size();i++){
  		List sub = (ArrayList)customerbid.get(i);%>
  	<tr>
      <td> <%= sub.get(0) %> </td>
      <td> <%= sub.get(1) %>  </td>
      <td> <%= sub.get(2) %> </td>
      <td> <%= sub.get(3) %>  </td>
       </tr>
   <%} %>
  </tbody>  
 <%} else{ %>
 No Result Found
 <%} %>
</table>
</div>
<div class="container">
  <h2>Best Sell</h2>         
<table class="table">
<%
List bestsell=new ArrayList();
bestsell=(ArrayList)request.getAttribute("bestsell");
if(bestsell!=null && bestsell.size()>0 ){ 
%>
<thead>
      <tr>
        <th>Airline ID</th>
        <th>Flight Number</th>
        <th>Number Of Seats</th>
        <th>Days Operating</th>
        <th>Total sell</th>
      </tr>
  </thead>    
  <tbody> 
  <%for(int i=0;i<bestsell.size();i++){ 
  List sub = (ArrayList)bestsell.get(i);%>
  <tr>
      <td><%= sub.get(0) %> </td>
      <td> <%= sub.get(1) %></td>
      <td> <%= sub.get(2) %> </td>
      <%if(sub.get(3)!= null){
    	  char[] d = ((String)sub.get(3)).toCharArray();
          String dop = "";
          if(d[0]=='1')
        	  	dop+="M ";
          if(d[1]=='1')
      	  	dop+=" TU ";
          if(d[2]=='1')
      	  	dop+=" W ";
          if(d[3]=='1')
      	  	dop+=" TH ";
          if(d[4]=='1')
      	  	dop+=" F ";
          if(d[5]=='1')
      	  	dop+=" SAT ";
          if(d[6]=='1')
      	  	dop+="SUN";
     
      %>
      <td> <%= dop %> </td>
      <%} else{ %>
      <td> None </td>
      <%} %>
       <td> <%= sub.get(4) %> </td>
  </tr>
  <%} %>
  </tbody> 
 <%} else{ %>
 No result found
 <%} %> 
</table>
</div>
<div class="container">
  <h2>Flight Suggestion</h2>         
<table class="table">
<% 
List fs=new ArrayList();
fs=(ArrayList)request.getAttribute("flightsuggest");
if(fs!=null && fs.size()>0 ){ 
%>
<thead>
      <tr>
        <th>Airline ID</th>
        <th>Flight Number</th>
        <th>Depart Airport</th>
        <th>Arriving Airport</th>
        <th>Number of Seats</th>
        <th>Days Operating</th>
      </tr>
  </thead>    
  <tbody> 
   <%for(int i=0;i<fs.size();i++){
	   List sub = (ArrayList)fs.get(i);%>
  <tr>
      <td> <%= sub.get(0) %> </td>
      <td> <%= sub.get(1) %> </td>
      <td> <%= sub.get(2) %> </td>
      <td> <%= sub.get(3) %> </td>
      <td> <%= sub.get(4) %> </td>
      <%if(sub.get(5)!=null){ 
      char[] d = ((String)sub.get(5)).toCharArray();
      String dop = "";
      if(d[0]=='1')
    	  	dop+="M ";
      if(d[1]=='1')
  	  	dop+=" TU ";
      if(d[2]=='1')
  	  	dop+=" W ";
      if(d[3]=='1')
  	  	dop+=" TH ";
      if(d[4]=='1')
  	  	dop+=" F ";
      if(d[5]=='1')
  	  	dop+=" SAT ";
      if(d[6]=='1')
  	  	dop+="SUN";
      %>
      <td> <%= dop %></td>
      <%} else{%>
      <td> None</td>
      <%} %>
       </tr>
  </tbody>  
  <%} %>
  <%} else{ %>
  No result found
  <%} %>
</table>
</div>

</body>
</html>