<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <title>Employee Flight Suggestions</title>
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
  </head>
  <body>
  	<jsp:include page="navbar.jsp" />
    <div class="container"><br/> 
      <div id="flightSuggestion">
        <h1 class="employee-title">Flight Suggestions</h1>
        <div class="col-lg-12 well">
          <div class="row">
                  <%
						List customers = new ArrayList();
		                if (request.getAttribute("customers") == null) {
		              		customers = null;
		              	}
		                else {
		                	customers = (ArrayList)request.getAttribute("customers");
		                %>
		                	<form method="POST" action="/cse305web/empFlightSuggestions">     
				              <div class="form-group">
				                <label>Customer</label>
				                <select class="form-control selectpicker" name="customer">
		                <%
		              	}
				  %>
				  <%
				  		if (customers != null) {
							for (Object customer : customers) {
								List c = (ArrayList)customer;
							%>
								<option value="<%= c.get(0) %>"><%= c.get(0) + " - " + c.get(1) %></option>
							<%
							}
				  		}
				  		if (request.getAttribute("customers") != null) {
	              		%>
	              			</select>
	              				</div>
				              	<button type="submit" class="btn btn-lg btn-primary">Produce List</button>          
				            </form> 
	              		<%}
				  %>
                
                <%
					List flightSuggestions = new ArrayList();
                	int accountNo = -1;
                	if (request.getAttribute("flightSuggestions") == null) {
                		flightSuggestions = null;
                	}
                	else { 
                		flightSuggestions = (ArrayList)request.getAttribute("flightSuggestions");
                		accountNo = (int)request.getAttribute("accountNo");
                	}
		          	if (flightSuggestions != null && flightSuggestions.size() > 0) {
		          	%>
		          		<h4>Account# <%= accountNo %></h4>
		          		<table class="table well">
				          <thead>
				            <tr>
				              <th>Airline Id</th>
				              <th>Flight Number</th>
				              <th>Number of Reservations Made</th>
				            </tr>
				          </thead>
				          <tbody>
		          	<%}
				%>
              	
		          	
					<%
						if (flightSuggestions != null && flightSuggestions.size() > 0) {
							for (Object flight : flightSuggestions) {
								List f = (ArrayList)flight;
							%>
								<tr>
					              <td><%= f.get(0) %></td>
					              <td><%= f.get(1) %></td>
					              <td><%= f.get(2) %></td>
					            </tr>
							<%
							}}
						if (flightSuggestions != null && flightSuggestions.size() > 0) {
				        %>
				        </tbody>
	        			</table>
	        			<%}
					%>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>