<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <title>Employee Add Passenger</title>
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
      <div id="newPassenger">
        <h1 class="employee-title">Add Passenger</h1>
        <div class="col-lg-12 well">
          <div class="row">
            <form method="POST" action="/cse305web/empAddPassenger">
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
    </div>
  </body>
</html>