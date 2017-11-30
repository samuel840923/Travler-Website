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
							<option value="<%= c.get(0) %>"><%= c.get(1) %></option>
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
            <form method="POST" action="/cse305/addPassenger">
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
              <button type="submit" class="btn btn-lg btn-primary">Add Passenger</button>          
            </form> 
          </div>
        </div>
      </div>
      <div id="deletePassenger">
        <h1 class="employee-title">Delete Passenger</h1>
        <div class="col-lg-12 well">
          <div class="row">
            <form method="POST" action="/cse305/deletePassenger">
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
                <div class="row">
                  <div class="col-sm-6 form-group">
                    <label>Reservation Number</label>
                    <input type="text" placeholder="Enter City Name Here" class="form-control" name="reservationNumber" required>
                  </div>  
                  <div class="col-sm-6 form-group">
                    <label>Account Number</label>
                    <input type="text" placeholder="Enter State Name Here" class="form-control" name="accountNumber" required>
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
            <form method="POST" action="/cse305/updatePassenger">
                <div class="row">
                  <div class="col-sm-6 form-group">
                    <label>Reservation Number</label>
                    <input type="text" placeholder="Enter City Name Here" class="form-control" name="reservationNumber" required>
                  </div>  
                  <div class="col-sm-6 form-group">
                    <label>Account Number</label>
                    <input type="text" placeholder="Enter State Name Here" class="form-control" name="accountNumber" required>
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
            <tr>
              <td>Jane</td>
              <td>Smith</td>
              <td>100 Nicolls Rd</td>
              <td>Stony Brook</td>
              <td>New York</td>
              <td>17790</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div id="flightSuggestion">
        <h1 class="employee-title">Flight Suggestions</h1>
        <div class="col-lg-12 well">
          <div class="row">
            <form method="POST" action="/cse305/flightSuggestion">     
              <div class="form-group">
                <label>Customer</label>
                <select class="form-control selectpicker" name="customer">
                  <option value="id1">Customer 1</option>
                  <option value="id2">Customer 2</option>
                </select>
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