<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
      .container {
        width: 80%;
      }
      .employee-title {
        font-size: 2em;
        display: block;
      }
      .well {
        margin-top: 1%;
        -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
      }
      h4 {
        text-decoration: underline;
      }
    </style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reverse Bid</title>
</head>
<body>
<jsp:include page="navbar.jsp" />
<jsp:include page="Error.jsp" />
<% 
String air=  request.getParameter("air");
String flight =  request.getParameter("flight");
String number =  "1";
String class1 =  request.getParameter("class");
int type = Integer.parseInt(request.getParameter("type"));
int nop = Integer.parseInt(number);
int leg1 =  Integer.parseInt(request.getParameter("leg1"));
int leg2 =  Integer.parseInt(request.getParameter("leg2"));
%>

<div class="container"><br/>
 <div id="passengers">
 <form  action="/cse305web/auction" method="POST">
 <%if(type==2){
	int leg11 =  Integer.parseInt(request.getParameter("leg11"));
	int leg22 =  Integer.parseInt(request.getParameter("leg22"));
	String flight2 =  request.getParameter("flight2");
	String class2 =  request.getParameter("class2");
	String air2 =  request.getParameter("air2");
	String total2 =  request.getParameter("total2");
	String bookfee2 =  request.getParameter("bookfee2");
	
%>
 <input type="hidden" name = "leg11" value= "<%= leg11 %>"/>
 <input type="hidden" name = "leg22"value= "<%= leg22 %>"/>
 <input type="hidden" name = "air2" value= "<%=air2 %>"/>	
 <input type="hidden" name = "flight2" value= "<%=flight2 %>"/>
 <input type="hidden" name = "class2" value= "<%=class2 %>"/>	
<% }  System.out.println(air+"Asdasdsd");%>

<input type="hidden" name = "leg1" value= "<%= leg1 %>"/>
<input type="hidden" name = "class" value= "<%= class1 %>"/>
 <input type="hidden" name = "leg2"value= "<%= leg2 %>"/>
 <input type="hidden" name = "nop" value= "<%=nop %>"/>	
 <input type="hidden" name = "type" value= "<%=type %>"/>	
 <input type="hidden" name = "air" value= "<%=air %>"/>	
 <input type="hidden" name = "flight" value= "<%=flight %>"/>	
 <% for (int i=0;i<nop;i++){ %>
                  <h4>Passenger <%=i+1 %>:</h4>
                  <div class="row">
                    <div class="col-sm-6 form-group">
                      <label>First Name</label>
                      <input type="text" placeholder="Enter First Name Here" class="form-control" name="firstName<%=i %>" required>
                    </div>
                    <div class="col-sm-6 form-group">
                      <label>Last Name</label>
                      <input type="text" placeholder="Enter Last Name Here" class="form-control" name="lastName<%=i %>" required>
                    </div>
                  </div>          
                  <div class="form-group">
                    <label>Address</label>
                    <textarea placeholder="Enter Address Here" rows="3" class="form-control" name="address<%=i %>" required></textarea>
                  </div>  
                  <div class="row">
                    <div class="col-sm-4 form-group">
                      <label>City</label>
                      <input type="text" placeholder="Enter City Name Here" class="form-control" name="city<%=i %>" required>
                    </div>  
                    <div class="col-sm-4 form-group">
                      <label>State</label>
                      <input type="text" placeholder="Enter State Name Here" class="form-control" name="state<%=i %>" required>
                    </div>  
                    <div class="col-sm-4 form-group">
                      <label>Zip</label>
                      <input type="text" placeholder="Enter Zip Code Here" class="form-control" name="zipcode<%=i %>" required>
                    </div>    
                  </div>
                  <div class="row">
                    <div class="col-sm-4 form-group">
                      <label>Food Preference</label>
                      <input type="text" placeholder="Enter Choice Food" class="form-control" name="food<%=i %>" required>
                    </div>  
                    <div class="col-sm-4 form-group">
                      <label>Seat Number Preference</label>
                      <input type="text" placeholder="Enter seat" class="form-control" name="seat<%=i %>" required>
                    </div>
                    <div class="col-sm-4 form-group">
                      <label>NYOP</label>
                      <input type="text" placeholder="NYOP" class="form-control" name="nyop" required/>
                  </div> 
                  </div>
                  <%if (type==2){ %>
                  <div class="row">
                    <div class="col-sm-4 form-group">
                      <label>Food Preference for flight2</label>
                      <input type="text" placeholder="Enter Choice Food" class="form-control" name="food2<%=i %>" required>
                    </div>  
                    <div class="col-sm-4 form-group">
                      <label>Seat Number Preference for flight 2</label>
                      <input type="text" placeholder="Enter seat" class="form-control" name="seat2<%=i %>" required>
                    </div>
                  </div>
                  <%} %>
  <%} %>
  <div class='row'>
 
               <div class='col-md-6 form-group'>
                <button class='form-control btn btn-info submit-button' type='submit'>Book this flight</button>
              </div>
                 <div class='col-md-6 form-group'>
             
                <button class='form-control btn btn-info submit-button' type='button' onclick="location.href = 'FlightInfo.html'">Go Back to Search</button>
               
              </div>
  </div>
  </form>
  </div>
</body>
</html>