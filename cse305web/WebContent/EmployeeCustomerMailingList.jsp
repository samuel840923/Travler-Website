<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <title>Employee Customer Mailing List</title>
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
    <div class="container"><br/> 
      <div id="mailingList">
        <h1 class="employee-title">Customer Mailing List</h1>
        <table class="table well">
          <thead>
            <tr>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Address</th>
              <th>City</th>
              <th>State</th>
              <th>Zip Code</th>
            </tr>
          </thead>
          <tbody>
          	<%
				List mailingList = new ArrayList();
          		mailingList = (ArrayList)request.getAttribute("mailingList");
			%>
			<%
				for (Object mail : mailingList) {
					List m = (ArrayList)mail;
				%>
					<tr>
		              <td><%= m.get(0) %></td>
		              <td><%= m.get(1) %></td>
		              <td><%= m.get(2) %></td>
		              <td><%= m.get(3) %></td>
		              <td><%= m.get(4) %></td>
		              <td><%= m.get(5) %></td>
		            </tr>
				<%
				}		
			%>
            
          </tbody>
        </table>
      </div>
    </div>
  </body>
</html>