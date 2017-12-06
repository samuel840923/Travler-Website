<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <title>Employee Record Reservation</title>
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
  	<jsp:include page="Error.jsp" />
    <div class="container"><br/> 
      <div id="recordReservation">
        <h1 class="employee-title">Record Reservation</h1>
        <div class="col-lg-12 well">
          <div class="row">
            <form method="POST" action="/cse305web/empReserve">
              <div class="col-sm-12">
                <div class="row">
                  <div class="col-sm-4 form-group">
                    <label>Customer</label>
                    <select class="form-control selectpicker" name="customer">
                    <%
						List customers = new ArrayList();
						customers = (ArrayList)request.getAttribute("customers");
					%>
					<%
						for (Object customer : customers) {
							List c = (ArrayList)customer;
						%>
							<option value="<%= c.get(0) %>"><%= c.get(0) + " - " + c.get(1) %></option>
						<%
						}		
					%>
                    	
                    </select>
                  </div>
                  <div class="col-sm-4 form-group">
                    <label>Booking Fee</label>
                    <input type="text" placeholder="Enter Booking Fee Here" class="form-control" name="bookingFee" required>
                  </div>
                  <div class="col-sm-4 form-group">
                    <label>Total Fee</label>
                    <input type="text" placeholder="Enter Total Fee Here" class="form-control" name="totalFee" required>
                  </div>
                </div>          
                <div class="row">
                  <div class="col-sm-4 form-group">
                    <label>Airline ID</label>
                    <input type="text" placeholder="Enter Airline ID Here" class="form-control" name="airlineId" required>
                  </div>  
                  <div class="col-sm-4 form-group">
                    <label>Flight Number</label>
                    <input type="text" placeholder="Enter Flight Number Here" class="form-control" name="flightNumber" required>
                  </div>  
                  <div class="col-sm-4 form-group">
                    <label>Leg Numbers (Seperate by comma, no spaces)</label>
                    <input type="text" placeholder="Enter Leg Numbers Here" class="form-control" name="legNumbers" required>
                  </div>    
                </div>
                <div class="row">
                  <div class='col-sm-6 form-group required'>
                      <label class='control-label'>Name on Card</label>
                      <input class='form-control' placeholder="Enter Name Here" type='text' required>
                  </div>
                  <div class='col-sm-6 form-group card required'>
                    <label class='control-label'>Card Number</label>
                    <input class='form-control card-number' placeholder="Enter Card Number Here" type='text' required>
                  </div>
                </div>
                <div class='row'>
                  <div class='col-sm-4 form-group cvc required'>
                    <label class='control-label'>CVC</label>
                    <input class='form-control card-cvc' placeholder='Enter CVC Here' size='4' type='text' required>
                  </div>
                  <div class='col-sm-4 form-group expiration required'>
                    <label class='control-label'>Expiration</label>
                    <input class='form-control card-expiry-month' placeholder='MM' size='2' type='text' required>
                  </div>
                  <div class='col-sm-4 form-group expiration required'>
                    <label class='control-label'> </label>
                    <input class='form-control card-expiry-year' placeholder='YYYY' size='4' type='text' required>
                  </div>
              </div>
                <br/>
                <div id="passengers">
                  <h4>Passenger 1:</h4>
                  <div class="row">
                    <div class="col-sm-6 form-group">
                      <label>First Name</label>
                      <input type="text" placeholder="Enter First Name Here" class="form-control" name="firstName" required>
                    </div>
                    <div class="col-sm-6 form-group">
                      <label>Last Name</label>
                      <input type="text" placeholder="Enter Last Name Here" class="form-control" name="lastName" required>
                    </div>
                  </div>          
                  <div class="form-group">
                    <label>Address</label>
                    <textarea placeholder="Enter Address Here" rows="3" class="form-control" name="address" required></textarea>
                  </div>  
                  <div class="row">
                    <div class="col-sm-4 form-group">
                      <label>City</label>
                      <input type="text" placeholder="Enter City Name Here" class="form-control" name="city" required>
                    </div>  
                    <div class="col-sm-4 form-group">
                      <label>State</label>
                      <input type="text" placeholder="Enter State Name Here" class="form-control" name="state" required>
                    </div>  
                    <div class="col-sm-4 form-group">
                      <label>Zip</label>
                      <input type="text" placeholder="Enter Zip Code Here" class="form-control" name="zipcode" required>
                    </div>    
                  </div>
                  <div class="row">
                    <div class="col-sm-4 form-group">
                      <label>Seat Number</label>
                      <input type="text" placeholder="Enter Seat Number Here" class="form-control" name="seatNumber" required>
                    </div>  
                    <div class="col-sm-4 form-group">
                      <label>Class</label>
                      <select class="form-control selectpicker" name="class">
                        <option value="Economy">Economy</option>
                        <option value="Business">Business</option>
                      </select>
                    </div>  
                    <div class="col-sm-4 form-group">
                      <label>Meal</label>
                      <input type="text" placeholder="Enter Meal Here" class="form-control" name="meal" required>
                    </div>    
                  </div>
                </div>
                <button type="button" class="btn btn-md btn-primary" id="addPassenger">Add Passenger</button><br/><br/>      
                <button type="submit" class="btn btn-lg btn-primary">Reserve</button>          
              </div>
            </form> 
          </div>
        </div>
      </div>
    </div>
    <script>
      var passengerNumber = 1;
      var htmlOne = '<br/><h4>Passenger ';
      var htmlTwo =':</h4><div class="row"><div class="col-sm-6 form-group"><label>First Name</label>' +
                '<input type="text" placeholder="Enter First Name Here" class="form-control" name="firstName" required></div>' + 
                '<div class="col-sm-6 form-group"> <label>Last Name</label>' + 
                '<input type="text" placeholder="Enter Last Name Here" class="form-control" name="lastName" required></div></div>' +   
                '<div class="form-group"> <label>Address</label>' + 
                '<textarea placeholder="Enter Address Here" rows="3" class="form-control" name="address" required></textarea></div>' + 
                '<div class="row"><div class="col-sm-4 form-group"><label>City</label>' + 
                '<input type="text" placeholder="Enter City Name Here" class="form-control" name="city" required></div>' + 
                '<div class="col-sm-4 form-group"><label>State</label>' + 
                '<input type="text" placeholder="Enter State Name Here" class="form-control" name="state" required></div>' + 
                '<div class="col-sm-4 form-group"><label>Zip</label>' + 
                '<input type="text" placeholder="Enter Zip Code Here" class="form-control" name="zipcode" required></div></div>' + 
                '<div class="row"><div class="col-sm-4 form-group"><label>Seat Number</label>' + 
                '<input type="text" placeholder="Enter Seat Number Here" class="form-control" name="seatNumber" required></div>' + 
                '<div class="col-sm-4 form-group"><label>Class</label><select class="form-control selectpicker" name="class">' + 
                '<option value="Economy">Economy</option><option value="Business">Business</option></select></div>' + 
                '<div class="col-sm-4 form-group"><label>Meal</label>' + 
                '<input type="text" placeholder="Enter Meal Here" class="form-control" name="meal" required></div></div>';
      $('#addPassenger').on('click', function() {
        passengerNumber++;
        $('#passengers').append(htmlOne + passengerNumber + htmlTwo);
      });
    </script>
  </body>
</html>