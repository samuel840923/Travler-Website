<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <title>Employee Master Page</title>
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
      #newPassenger{
        display: None;
      }
      #deletePassenger{
        display: None;
      }
      #updatePassenger{
        display: None;
      }
      #mailingList{
        display: None;
      }
      #flightSuggestion{
        display: None;
      }
    </style>
  </head>
  <body>
    <div class="container"><br/>
    <form>
      <label>Action:</label>
      <select class="form-control selectpicker" id="action">
        <option value="reserve">Record Reservation</option>
        <option value="add">Add Passenger</option>
        <option value="delete">Delete Passenger</option>
        <option value="update">Update Passenger</option>
        <option value="mailing">Customer Mailing List</option>
        <option value="flight">Flight Suggestions</option>
      </select>
    </form> 
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
      <div id="newPassenger">
        <h1 class="employee-title">Add Passenger</h1>
        <div class="col-lg-12 well">
          <div class="row">
            <form method="POST" action="/cse305web/addPassenger">
                <div class="row">
	              <div class="col-sm-4 form-group">
	                <label>Reservation Number</label>
	              	<input type="text" placeholder="Enter Reservation Number Here" class="form-control" name="reservationNumber" required>
	              </div> 
                  <div class="col-sm-4 form-group">
                    <label>First Name</label>
                    <input type="text" placeholder="Enter First Name Here" class="form-control" name="firstName" required>
                  </div>
                  <div class="col-sm-4 form-group">
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
              <button type="submit" class="btn btn-lg btn-primary">Add Passenger</button>          
            </form> 
          </div>
        </div>
      </div>
      <div id="deletePassenger">
        <h1 class="employee-title">Delete Passenger</h1>
        <div class="col-lg-12 well">
          <div class="row">
            <form method="POST" action="/cse305web/deletePassenger">
            	<div class="row">
                  <div class="col-sm-6 form-group">
                    <label>Reservation Number</label>
                    <input type="text" placeholder="Enter Reservation Number Here" class="form-control" name="reservationNumber" required>
                  </div>  
                  <div class="col-sm-6 form-group">
                    <label>Account Number</label>
                    <input type="text" placeholder="Enter Account Number Here" class="form-control" name="accountNumber" required>
                  </div>   
                </div>
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
              <button type="submit" class="btn btn-lg btn-primary">Delete Passenger</button>          
            </form> 
          </div>
        </div>
      </div>
      <div id="updatePassenger">
        <h1 class="employee-title">Update Passenger</h1>
        <div class="col-lg-12 well">
          <div class="row">
            <form method="POST" action="/cse305web/updatePassenger">
                <div class="row">
                  <div class="col-sm-6 form-group">
                    <label>Reservation Number</label>
                    <input type="text" placeholder="Enter Reservation Number Here" class="form-control" name="reservationNumber" required>
                  </div>  
                  <div class="col-sm-6 form-group">
                    <label>Account Number</label>
                    <input type="text" placeholder="Enter Account Number Here" class="form-control" name="accountNumber" required>
                  </div>   
                </div>
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
              <button type="submit" class="btn btn-lg btn-primary">Update Passenger</button>          
            </form> 
          </div>
        </div>
      </div>
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
      <div id="flightSuggestion">
        <h1 class="employee-title">Flight Suggestions</h1>
        <div class="col-lg-12 well">
          <div class="row">
            <form method="POST" action="/cse305web/flightSuggestion">     
              <div class="form-group">
                <label>Customer</label>
                <select class="form-control selectpicker" name="customer">
                  <%
						//List customers = new ArrayList();
						//customers = (ArrayList)request.getAttribute("customers");
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
                <%
					List flightSuggestions = new ArrayList();
		          	flightSuggestions = (ArrayList)request.getAttribute("flightSuggestions");
		          	if (flightSuggestions.size() > 0) {
		          	%>
		          		<table class="table well">
				          <thead>
				            <tr>
				              <th>Airline Id</th>
				              <th>Flight #</th>
				              <th>Leg #</th>
				              <th>Dept. Airport</th>
				              <th>Arr. Airport</th>
				              <th>Arr. Time</th>
				              <th>Dept. Time</th>
				              <th>Curr Arr. Time</th>
				              <th>Curr Dept. Time</th>
				              <th># Seats</th>
				              <th>Days Operating</th>
				              <th>Min Length of Stay</th>
				              <th>Max Length of Stay</th>
				            </tr>
				          </thead>
				          <tbody>
		          	<%}
				%>
              	
		          	
					<%
						for (Object flight : flightSuggestions) {
							List f = (ArrayList)flight;
						%>
							<tr>
				              <td><%= f.get(0) %></td>
				              <td><%= f.get(1) %></td>
				              <td><%= f.get(2) %></td>
				              <td><%= f.get(3) %></td>
				              <td><%= f.get(4) %></td>
				              <td><%= f.get(5) %></td>
				              <td><%= f.get(6) %></td>
				              <td><%= f.get(7) %></td>
				              <td><%= f.get(8) %></td>
				              <td><%= f.get(9) %></td>
				              <td><%= f.get(10) %></td>
				              <td><%= f.get(11) %></td>
				              <td><%= f.get(12) %></td>
				            </tr>
						<%
						}
						if (flightSuggestions.size() > 0) {
				        %>
				        </tbody>
	        			</table>
	        			<%}
					%>
		            
		          
              </div>
              <button type="submit" class="btn btn-lg btn-primary">Produce List</button>          
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
      $('#action').on('change', function() {
        if ($('#action').val() === 'reserve') {
          $('#recordReservation').css('display', 'inline');
          $('#newPassenger').css('display', 'none');
          $('#updatePassenger').css('display', 'none');
          $('#deletePassenger').css('display', 'none');
          $('#mailingList').css('display', 'none');
          $('#flightSuggestion').css('display', 'none');
        }
        else if ($('#action').val() === 'add') {
          $('#recordReservation').css('display', 'none');
          $('#newPassenger').css('display', 'inline');
          $('#updatePassenger').css('display', 'none');
          $('#deletePassenger').css('display', 'none');
          $('#mailingList').css('display', 'none');
          $('#flightSuggestion').css('display', 'none');
        }
        else if ($('#action').val() === 'delete') {
          $('#recordReservation').css('display', 'none');
          $('#newPassenger').css('display', 'none');
          $('#updatePassenger').css('display', 'none');
          $('#deletePassenger').css('display', 'inline');
          $('#mailingList').css('display', 'none');
          $('#flightSuggestion').css('display', 'none');
        }
        else if ($('#action').val() === 'update') {
          $('#recordReservation').css('display', 'none');
          $('#newPassenger').css('display', 'none');
          $('#updatePassenger').css('display', 'inline');
          $('#deletePassenger').css('display', 'none');
          $('#mailingList').css('display', 'none');
          $('#flightSuggestion').css('display', 'none');
        }
        else if ($('#action').val() === 'mailing') {
          $('#recordReservation').css('display', 'none');
          $('#newPassenger').css('display', 'none');
          $('#updatePassenger').css('display', 'none');
          $('#deletePassenger').css('display', 'none');
          $('#mailingList').css('display', 'inline');
          $('#flightSuggestion').css('display', 'none');
        }
        else if ($('#action').val() === 'flight') {
          $('#recordReservation').css('display', 'none');
          $('#newPassenger').css('display', 'none');
          $('#updatePassenger').css('display', 'none');
          $('#deletePassenger').css('display', 'none');
          $('#mailingList').css('display', 'none');
          $('#flightSuggestion').css('display', 'inline');
        }
        else {
          $('#recordReservation').css('display', 'none');
          $('#newPassenger').css('display', 'none');
          $('#updatePassenger').css('display', 'none');
          $('#deletePassenger').css('display', 'none');
          $('#mailingList').css('display', 'none');
          $('#flightSuggestion').css('display', 'none');
        }
      });
    </script>
  </body>
</html>