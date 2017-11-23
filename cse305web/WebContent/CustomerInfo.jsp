<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
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

   <div class="form-group row">
           <div class="col-xs-4">
          <label for="ex1">Name: </label>
          <label for="ex1">Bob Smith </label>
          </div>
  </div>
  <div class="form-group row">
           <div class="col-xs-4">
          <label for="ex1">Address:</label>
          <label for="ex1">123 beach st, Stony Brook, NY 11790 </label>
          </div>
  </div>
  <div class="form-group row">
           <div class="col-xs-4">
          <label for="ex1">Phone Number:</label>
          <label for="ex1">1234567890</label>
          </div>
  </div>
   <div class="form-group row">
           <div class="col-xs-4">
          <label for="ex1">Email:</label>
          <label for="ex1">sbcs@stonybrook.edu</label>
          </div>
  </div>
  <div class="form-group row">
           <div class="col-xs-4">
          <label for="ex1">Creation Date</label>
          <label for="ex1">01/01/2017:10:12</label>
          </div>
  </div>
  <div class="form-group row">
           <div class="col-xs-4">
          <label for="ex1">Credit Card:</label>
          <label for="ex1">0000000000000001</label>
          </div>
  </div>
  <div class="form-group row">
           <div class="col-xs-4">
          <label for="ex1">Rating:</label>
          <label for="ex1">1</label>
          </div>
  </div>
  <div class="form-group row">
           <div class="col-xs-4">
          <label for="ex1">Preference:</label>
          <label for="ex1">Fish</label>
          </div>
  </div>
  <div class="form-group row">
           <div class="col-xs-4">
         <button type="button" class="btn btn-primary">See Reservation</button>
          </div>
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
        <th>NYOP</th>
      </tr>
  </thead> 
   
  <tbody> 
  
  <%for(int i=0;i<current.size();i++){ %>
  		<tr>
      <td> <%= current.get(0) %> </td>
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
        <th>Reserve Number</th>
        <th>Reserve Date</th>
        <th>Booking Fee</th>
        <th>Total Fee</th>
      </tr>
  </thead>    
  <tbody> 
  
  	<%for(int i=0;i<bid.size();i++){ %>
  	<tr>
      <td> <%= bid.get(1) %> </td>
      <td> <%= bid.get(2) %> </td>
      <td> <%= bid.get(3) %> </td>
      <td> <%= bid.get(4) %> </td>
      <td> <%= bid.get(5) %></td>
       </tr>
      <%} %>
      
  </tbody>     
<%} else{%>
No Result
<%} %>
</table>
</div>
<div class="container">
  <h2>Your BID History</h2>         
<table class="table">
<%
List customerbid=new ArrayList();
customerbid=(ArrayList)request.getAttribute("customebid");
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

  	<%for(int i=0;i<customerbid.size();i++){ %>
  	<tr>
      <td> <%= customerbid.get(0) %> </td>
      <td> <%= customerbid.get(1) %>  </td>
      <td> <%= customerbid.get(2) %> </td>
      <td> <%= customerbid.get(3) %>  </td>
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
      </tr>
  </thead>    
  <tbody> 
  <%for(int i=0;i<bestsell.size();i++){ %>
  <tr>
      <td><%= bestsell.get(0) %> </td>
      <td> <%= bestsell.get(1) %></td>
      <td> <%= bestsell.get(2) %> </td>
      <td> <%= bestsell.get(3) %> </td>
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
   <%for(int i=0;i<fs.size();i++){ %>
  <tr>
      <td> <%= fs.get(0) %> </td>
      <td> <%= fs.get(1) %> </td>
      <td> <%= fs.get(2) %> </td>
      <td> <%= fs.get(3) %> </td>
      <td> <%= fs.get(4) %></td>
      <td> <%= fs.get(5) %> </td>
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