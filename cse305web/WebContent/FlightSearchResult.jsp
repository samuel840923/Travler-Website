<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <h2>Search Result</h2>         
<table class="table">
<%
List resultlist=new ArrayList();
resultlist=(ArrayList)request.getAttribute("searchlist");
if(resultlist!=null && resultlist.size()>0 ){
%>
 <thead>
      <tr>
        <th>Airline ID</th>
        <th>Flight Number</th>
        <th>Seats</th>
        <th>Price</th>
        <th>Depart</th>
        <th>Arrive </th>
        <th>Class</th>
      </tr>
    </thead>
    <tbody>
<%
for(int i=0;i<resultlist.size();i++){
List sub=(List)resultlist.get(i);
%>
      <tr>
        <td><%= sub.get(0) %></td>
        <td><%= sub.get(1) %></td>
        <td><%= sub.get(2) %></td>
        <td><%= sub.get(3) %></td>
        <td><%= sub.get(4) %></td>
        <td><%= sub.get(5) %></td>
        <td><%= sub.get(6) %></td>
         <td> <button type="button" class="btn btn-primary">Reserve</button></td>
      </tr>
      
     
    </tbody>
<%
}
}else{
%>
Not  Available  Any Book Details
<%}%>
</table>
</div>

</body>
</html>