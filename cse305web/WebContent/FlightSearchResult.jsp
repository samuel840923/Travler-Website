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
String nop=(String)request.getAttribute("nop");
%>
 <thead>
      <tr>
        <th>Airline ID</th>
        <th>Flight Number</th>
        <th>DepAirportID</th>
        <th>ArrAirportID</th>
        <th>DepTime</th>
        <th>ArrTime </th>
        <%if(type == 1){ %>
         <th>DepTime2</th>
        <th>ArrTime2 </th>
        <%} %>
        <th>Fare Type</th>
        <th>Class</th>
        <th>Fare </th>
        <th>Transfer </th>
      </tr>
    </thead>
 <tbody>
<%if(type == 0){
for(int i=0;i<resultlist.size();i++){
List sub=(List)resultlist.get(i);
int legno1 = (int)sub.get(9);
int legno2 = (int)sub.get(10);
String transfer = (String)sub.get(11);%>

<form action = "MoreInfoServlet" method = "post">
 <tr>
        <td><label for="ex1" name = "air"  value = "<%= sub.get(0) %>"> <%= sub.get(0) %> </label></td>
        <td><label for="ex1" name = "flight" value = "<%= sub.get(1) %>"> <%= sub.get(1) %> </label></td>
        <td><label for="ex1" name = "depair" value = "<%= sub.get(2) %>"> <%= sub.get(2) %> </label></td>
        <td><label for="ex1" name = "arrair" value = "<%= sub.get(3) %>"> <%= sub.get(3) %> </label></td>
        <td><label for="ex1" name = "deptime" value = "<%= sub.get(4) %>"> <%= sub.get(4) %> </label></td>
        <td><label for="ex1" name = "arrtime" value = "<%= sub.get(5) %>"> <%= sub.get(5) %> </label></td>
        <td><label for="ex1" name = "ft" value = "<%= sub.get(6) %>"> <%= sub.get(6) %> </label></td>
        <td><label for="ex1" name = "cl" value = "<%= sub.get(7) %>"> <%= sub.get(7) %> </label></td>
        <td><label for="ex1" name = "fa" value = "<%= sub.get(8) %>"> <%= sub.get(8) %> </label></td>
        <%if(legno1 != legno2) {%>
        <td><label for="ex1" name = "fa" value = "<%= transfer %>"> <%= transfer %> </label></td>
        <%}else{ %>
        <td><label for="ex1" name = "fa" value = "<%= sub.get(8) %>"> None </label></td>
        <%} %>
        <input type="hidden" name = "air" value= "<%= sub.get(0) %>"/>
        <input type="hidden" name = "flight" value= "<%= sub.get(1) %>"/>
         <input type="hidden" name = "depair" value= "<%= sub.get(2) %>"/>
        <input type="hidden" name = "arrair" value= "<%= sub.get(3) %>"/>
         <input type="hidden" name = "deptime" value= "<%= sub.get(4) %>"/>
        <input type="hidden" name = "arrtime" value= "<%= sub.get(5) %>"/>
        <input type="hidden" name = "faret" value= "<%= sub.get(6) %>"/>
         <input type="hidden" name = "class" value= "<%= sub.get(7) %>"/>
        <input type="hidden" name = "fare" value= "<%= sub.get(8) %>"/>
        <input type="hidden" name = "type" value= "<%= type %>"/>
        <input type="hidden" name = "nop" value= "<%= nop %>"/>
         <input type="hidden" name = "leg1" value= "<%= legno1 %>"/>
        <input type="hidden" name = "leg2" value= "<%= legno2 %>"/>
         <td> <button type="submit" class="btn btn-primary">More Info</button></td>
  </tr>
  </form>

<%}}
if(type == 1){
	List roundtime=(ArrayList)request.getAttribute("round");
for(int i=0;i<round.size();i++){
List sub=(List)round.get(i);
List sub1=(List)roundtime.get(i);
int legno1 = (int)sub.get(9);
int legno2 = (int)sub.get(10);
String transfer = (String)sub.get(11);
%>
<form action = "MoreInfoServlet" method = "post">
      <tr>
       <td><label for="ex1" name = "air"  value = "<%= sub.get(0) %>"> <%= sub.get(0) %> </label></td>
        <td><label for="ex1" name = "flight" value = "<%= sub.get(1) %>"> <%= sub.get(1) %> </label></td>
        <td><label for="ex1" name = "depair" value = "<%= sub.get(2) %>"> <%= sub.get(2) %> </label></td>
        <td><label for="ex1" name = "arrair" value = "<%= sub.get(3) %>"> <%= sub.get(3) %> </label></td>
        <td><label for="ex1" name = "deptime" value = "<%= sub.get(4) %>"> <%= sub.get(4) %> </label></td>
        <td><label for="ex1" name = "arrtime" value = "<%= sub.get(5) %>"> <%= sub.get(5) %> </label></td>
         <td><label for="ex1" name = "ft" value = "<%= sub1.get(0) %>"> <%= sub1.get(0) %> </label></td>
        <td><label for="ex1" name = "cl" value = "<%= sub1.get(1) %>"> <%= sub1.get(1) %> </label></td>
        <td><label for="ex1" name = "ft" value = "<%= sub.get(6) %>"> <%= sub.get(6) %> </label></td>
        <td><label for="ex1" name = "cl" value = "<%= sub.get(7) %>"> <%= sub.get(7) %> </label></td>
        <td><label for="ex1" name = "fa" value = "<%= sub.get(8) %>"> <%= sub.get(8) %> </label></td>
       
         <%if(legno1 != legno2) {%>
        <td><label for="ex1" name = "fa" value = "<%= transfer %>"> <%= transfer %> </label></td>
        <%}else{ %>
        <td><label for="ex1" name = "fa" value = "<%= sub.get(8) %>"> None </label></td>
        <%} %>
        
        <input type="hidden" name = "air" value= "<%= sub.get(0) %>"/>
        <input type="hidden" name = "flight" value= "<%= sub.get(1) %>"/>
         <input type="hidden" name = "depair" value= "<%= sub.get(2) %>"/>
        <input type="hidden" name = "arrair" value= "<%= sub.get(3) %>"/>
         <input type="hidden" name = "deptime" value= "<%= sub.get(4) %>"/>
        <input type="hidden" name = "arrtime" value= "<%= sub.get(5) %>"/>
        <input type="hidden" name = "faret" value= "<%= sub.get(6) %>"/>
         <input type="hidden" name = "class" value= "<%= sub.get(7) %>"/>
        <input type="hidden" name = "fare" value= "<%= sub.get(8) %>"/>
         <input type="hidden" name = "dtime2" value= "<%= sub1.get(0) %>"/>
        <input type="hidden" name = "atime2" value= "<%= sub1.get(1) %>"/>
        <input type="hidden" name = "type" value= "<%= type %>"/>
 		 <input type="hidden" name = "nop" value= "<%= nop %>"/>
 		   <input type="hidden" name = "leg1" value= "<%= legno1 %>"/>
        <input type="hidden" name = "leg2" value= "<%= legno2 %>"/>

        <td> <button type="submit" class="btn btn-primary">More Info</button></td>
      </tr>
 </form>

<%
}
}
if(type == 2){
	if(round.size()!=0){
	for(int i=0;i<resultlist.size();i++){
		List sub=(ArrayList)resultlist.get(i);
		int legno1 = (int)sub.get(9);
		int legno2 = (int)sub.get(10);
		String transfer = (String)sub.get(11);
		for(int j = 0;j<round.size();j++){
			List sub1=(ArrayList)round.get(j);
			int legno11 = (int)sub1.get(9);
			int legno22 = (int)sub1.get(10);
			String transfer2 = (String)sub1.get(11);
		
%>
	<form action = "MoreInfoServlet" method = "post">
      <tr>
       <td><label for="ex1" name = "air"  value = "<%= sub.get(0) %>"> <%= sub.get(0) %> </label></td>
        <td><label for="ex1" name = "flight" value = "<%= sub.get(1) %>"> <%= sub.get(1) %> </label></td>
        <td><label for="ex1" name = "depair" value = "<%= sub.get(2) %>"> <%= sub.get(2) %> </label></td>
        <td><label for="ex1" name = "arrair" value = "<%= sub.get(3) %>"> <%= sub.get(3) %> </label></td>
        <td><label for="ex1" name = "deptime" value = "<%= sub.get(4) %>"> <%= sub.get(4) %> </label></td>
        <td><label for="ex1" name = "arrtime" value = "<%= sub.get(5) %>"> <%= sub.get(5) %> </label></td>
        <td><label for="ex1" name = "ft" value = "<%= sub.get(6) %>"> <%= sub.get(6) %> </label></td>
        <td><label for="ex1" name = "cl" value = "<%= sub.get(7) %>"> <%= sub.get(7) %> </label></td>
        <td><label for="ex1" name = "fa" value = "<%= sub.get(8) %>"> <%= sub.get(8) %> </label></td>
        
         <%if(legno1 != legno2) {%>
        <td><label for="ex1" name = "fa" value = "<%= transfer %>"> <%= transfer %> </label></td>
        <%}else{ %>
        <td><label for="ex1" name = "fa" value = "<%= sub.get(8) %>"> None </label></td>
        <%} %>
        
        <input type="hidden" name = "air" value= "<%= sub.get(0) %>"/>
        <input type="hidden" name = "flight" value= "<%= sub.get(1) %>"/>
         <input type="hidden" name = "depair" value= "<%= sub.get(2) %>"/>
        <input type="hidden" name = "arrair" value= "<%= sub.get(3) %>"/>
         <input type="hidden" name = "deptime" value= "<%= sub.get(4) %>"/>
        <input type="hidden" name = "arrtime" value= "<%= sub.get(5) %>"/>
        <input type="hidden" name = "faret" value= "<%= sub.get(6) %>"/>
         <input type="hidden" name = "class" value= "<%= sub.get(7) %>"/>
        <input type="hidden" name = "fare" value= "<%= sub.get(8) %>"/>
        
         <input type="hidden" name = "leg1" value= "<%= legno1 %>"/>
        <input type="hidden" name = "leg2"value= "<%= legno2 %>"/>
      </tr>
      <tr>
       <td><label for="ex1" name = "air1"  value = "<%= sub1.get(0) %>"> <%= sub1.get(0) %> </label></td>
        <td><label for="ex1" name = "flight1" value = "<%= sub1.get(1) %>"> <%= sub1.get(1) %> </label></td>
        <td><label for="ex1" name = "depair1" value = "<%= sub1.get(2) %>"> <%= sub1.get(2) %> </label></td>
        <td><label for="ex1" name = "arrair1" value = "<%= sub1.get(3) %>"> <%= sub1.get(3) %> </label></td>
        <td><label for="ex1" name = "deptime1" value = "<%= sub1.get(4) %>"> <%= sub1.get(4) %> </label></td>
        <td><label for="ex1" name = "arrtime1" value = "<%= sub1.get(5) %>"> <%= sub1.get(5) %> </label></td>
        <td><label for="ex1" name = "ft1" value = "<%= sub1.get(6) %>"> <%= sub1.get(6) %> </label></td>
        <td><label for="ex1" name = "cl1" value = "<%= sub1.get(7) %>"> <%= sub1.get(7) %> </label></td>
        <td><label for="ex1" name = "fa1" value = "<%= sub1.get(8) %>"> <%= sub1.get(8) %> </label></td>
        <input type="hidden" name = "air1" value= "<%= sub1.get(0) %>"/>
         <%if(legno11 != legno22) {%>
        <td><label for="ex1" name = "fa" value = "<%= transfer2 %>"> <%= transfer2 %> </label></td>
        <%}else{ %>
        <td><label for="ex1" name = "fa" value = "none"> None </label></td>
        <%} %>
        <input type="hidden" name = "flight1" value= "<%= sub1.get(1) %>"/>
         <input type="hidden" name = "depair1" value= "<%= sub1.get(2) %>"/>
        <input type="hidden" name = "arrair1" value= "<%= sub1.get(3) %>"/>
         <input type="hidden" name = "deptime1" value= "<%= sub1.get(4) %>"/>
        <input type="hidden" name = "arrtime1" value= "<%= sub1.get(5) %>"/>
        <input type="hidden" name = "faret1" value= "<%= sub1.get(6) %>"/>
         <input type="hidden" name = "class1" value= "<%= sub1.get(7) %>"/>
        <input type="hidden" name = "fare1" value= "<%= sub1.get(8) %>"/>
        <input type="hidden" name = "type" value= "<%= type %>"/>
         <input type="hidden" name = "nop" value= "<%= nop %>"/>
         
          <input type="hidden" name = "leg11" value= "<%= legno11 %>"/>
        <input type="hidden" name = "leg22"value= "<%= legno22 %>"/>
        <td> <button type="submit" class="btn btn-primary">More Info</button></td>
      </tr>
 </form>
<%}}}} %>
    </tbody>
</table>
</div>
</body>
</html>