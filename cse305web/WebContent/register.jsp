<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>
			Sign Up
		</title>
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  		<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  		<style>
  			.register-title {
			    font-size: 3em;
			    display: block;
			}
  			.well {
  				margin-top: 1%;
  				-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  			}
  		</style>
	</head>
	<body>
		<jsp:include page="navbar.jsp" />
		<div class="container">
		    <h1 class="register-title">Customer Sign Up</h1>
			<div class="col-lg-12 well">
				<div class="row">
					<form action="/cse305web/register" method="POST">
						<div class="col-sm-12">
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
							<div class="form-group">
								<label>Email Address</label>
								<input type="text" placeholder="Enter Email Address Here.." class="form-control" name="email" required>
							</div>
							<div class="form-group">
								<label>Password</label>
								<input type="password" placeholder="Enter Password Here.." class="form-control" name="password" required>
							</div>
							<button type="submit" class="btn btn-lg btn-primary">Register</button>					
						</div>
					</form> 
				</div>
			</div>
		</div>
	</body>
</html>