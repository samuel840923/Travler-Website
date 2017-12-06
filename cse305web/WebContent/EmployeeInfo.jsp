<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Employee Info</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<jsp:include page="Error.jsp" />
	<div class="container">
	 <h2>Employee Profile</h2>
	 <form action="/cse305web/employeeInfo" method="POST">
		  <div class="form-group row">
		           <div class="col-xs-4">
		          <label for="id">Id: </label>
		          <input type="text" name="id" value="${employee.getId()}" disabled/>
		          </div>
		  </div>
		  <div class="form-group row">
		           <div class="col-xs-4">
		          <label for="firstName">First Name: </label>
		          <input type="text" name="firstName" value="${employee.getFirstName()}"/>
		          </div>
		  </div>
		   <div class="form-group row">
		           <div class="col-xs-4">
		          <label for="lastName">Last Name: </label>
		          <input type="text" name="lastName" value="${employee.getLastName()}"/>
		          </div>
		  </div>
		  <div class="form-group row">
		           <div class="col-xs-4">
		          <label for="ssn">SSN: </label>
		          <input type="text" name="ssn" value="${employee.getSSN()}"/>
		          </div>
		  </div>
		  <div class="form-group row">
		           <div class="col-xs-4">
		          <label for="address">Address:</label>
		          <textarea type="text" name="address">${employee.getAddress()}</textarea>
		          </div>
		  </div>
		   <div class="form-group row">
		           <div class="col-xs-4">
		          <label for="city">City:</label>
		          <input type="text" name="city" value="${employee.getCity()}"/>
		          </div>
		  </div>
		   <div class="form-group row">
		           <div class="col-xs-4">
		          <label for=""state"">State:</label>
		          <input type="text" name="state" value="${employee.getState()}"/>
		          </div>
		  </div>
		   <div class="form-group row">
		           <div class="col-xs-4">
		          <label for="zipcode">Zip Code:</label>
		          <input type="text" name="zipcode" value="${employee.getZipCode()}"/>
		          </div>
		  </div>
		  <div class="form-group row">
		           <div class="col-xs-4">
		          <label for="manager">Manager:</label>
		          <input type="text" name="manager" value="${employee.getIsManager()}" disabled/>
		          </div>
		  </div>
		  <div class="form-group row">
		           <div class="col-xs-4">
		          <label for="startDate">Start Date:</label>
		          <input type="text" name="startDate" value="${employee.getStartDate()}" disabled/>
		          </div>
		  </div>
		  <button type="submit" class="btn btn-primary">Update Profile</button>
	 </form>
	</div>
</body>
</html>