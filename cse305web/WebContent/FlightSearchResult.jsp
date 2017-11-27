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
List round=new ArrayList();
resultlist=(ArrayList)request.getAttribute("searchlist");
round=(ArrayList)request.getAttribute("searchlist2");
int type=(int)request.getAttribute("type");
if(resultlist!=null && resultlist.size()>0 ){
%>
 <thead>
      <tr>
        <th>Airline ID</th>
        <th>Flight Number</th>
        <th>DepAirportID</th>
        <th>ArrAirportID</th>
        <th>DepTime</th>
        <th>ArrTime </th>
        <%  if(round != null && round.size()>0){
	 	%>
 		<th>Airline ID</th>
        <th>Flight Number</th>
        <th>DepAirportID</th>
        <th>ArrAirportID</th>
        <th>DepTime</th>
        <th>ArrTime </th>
 		<%} %>
      </tr>
    </thead>
 <tbody>
<%}if(type == 0){
for(int i=0;i<resultlist.size();i++){
List sub=(List)resultlist.get(i);%>
<form action = "TEST" method = "post">
 <tr>
        <td><label for="ex1" name = "air"  value = "<%= sub.get(0) %>"> <%= sub.get(0) %> </label></td>
        <td><label for="ex1" name = "flight" value = "<%= sub.get(1) %>"> <%= sub.get(1) %> </label></td>
        <td><label for="ex1" name = "depair" value = "<%= sub.get(2) %>"> <%= sub.get(2) %> </label></td>
        <td><label for="ex1" name = "arrair" value = "<%= sub.get(3) %>"> <%= sub.get(3) %> </label></td>
        <td><label for="ex1" name = "deptime" value = "<%= sub.get(4) %>"> <%= sub.get(4) %> </label></td>
        <td><label for="ex1" name = "arrtime" value = "<%= sub.get(5) %>"> <%= sub.get(5) %> </label></td>
        <input type="hidden" name = "air" value= "<%= sub.get(0) %>"/>
        <input type="hidden" name = "flight" value= "<%= sub.get(1) %>"/>
         <input type="hidden" name = "depair" value= "<%= sub.get(2) %>"/>
        <input type="hidden" name = "arrair" value= "<%= sub.get(3) %>"/>
         <input type="hidden" name = "deptime" value= "<%= sub.get(4) %>"/>
        <input type="hidden" name = "arrtime" value= "<%= sub.get(5) %>"/>
         <td> <button type="submit" class="btn btn-primary">Reserve</button></td>
  </tr>
  </form>

<%}}
if(type == 2){
for(int i=0;i<resultlist.size();i++){
List sub=(List)resultlist.get(i);
List sub1 = null;
for(int j = 0 ;j<round.size();j++){
 	sub1=(List)round.get(j);

%>
<form action = "TEST" method = "post">
      <tr>
        <td><label for="ex1" name = "air" value = "<%= sub.get(0) %>"> <%= sub.get(0) %> </label></td>
        <td><label for="ex1" name = "flight" value = "<%= sub.get(1) %>"> <%= sub.get(1) %> </label></td>
        <td><label for="ex1" name = "depair" value = "<%= sub.get(2) %>"> <%= sub.get(2) %> </label></td>
        <td><label for="ex1" name = "arrair" value = "<%= sub.get(3) %>"> <%= sub.get(3) %> </label></td>
        <td><label for="ex1" name = "deptime" value = "<%= sub.get(4) %>"> <%= sub.get(4) %> </label></td>
        <td><label for="ex1" name = "arrtime" value = "<%= sub.get(5) %>"> <%= sub.get(5) %> </label></td>
        <input type="hidden" name = "air" value= "<%= sub.get(0) %>"/>
        <input type="hidden" name = "flight" value= "<%= sub.get(1) %>"/>
         <input type="hidden" name = "depair" value= "<%= sub.get(2) %>"/>
        <input type="hidden" name = "arrair" value= "<%= sub.get(3) %>"/>
         <input type="hidden" name = "deptime" value= "<%= sub.get(4) %>"/>
        <input type="hidden" name = "arrtime" value= "<%= sub.get(5) %>"/>
        <% 
       	if(sub1!= null){
        %>
        <td><label for="ex1" name = "air2" value = "<%= sub1.get(0) %>"> <%= sub1.get(0) %> </label></td>
        <td><label for="ex1" name = "flight2" value = "<%= sub1.get(1) %>"> <%= sub1.get(1) %> </label></td>
        <td><label for="ex1" name = "depair2" value = "<%= sub1.get(2) %>"> <%= sub1.get(2) %> </label></td>
        <td><label for="ex1" name = "arrair2" value = "<%= sub1.get(3) %>"> <%= sub1.get(3) %> </label></td>
        <td><label for="ex1" name = "deptime2" value = "<%= sub1.get(4) %>"> <%= sub1.get(4) %> </label></td>
        <td><label for="ex1" name = "arrtime2" value = "<%= sub1.get(5) %>"> <%= sub1.get(5) %> </label></td>
        <input type="hidden" name = "air2" value= "<%= sub.get(0) %>"/>
        <input type="hidden" name = "flight2" value= "<%= sub.get(1) %>"/>
         <input type="hidden" name = "depair2" value= "<%= sub.get(2) %>"/>
        <input type="hidden" name = "arrair2" value= "<%= sub.get(3) %>"/>
         <input type="hidden" name = "deptime2" value= "<%= sub.get(4) %>"/>
        <input type="hidden" name = "arrtime2" value= "<%= sub.get(5) %>"/>
        <%} %>

        <td> <button type="submit" class="btn btn-primary">Reserve</button></td>
      </tr>
 </form>

<%
}
}
}
%>
    </tbody>
</table>
</div>
</body>
</html>