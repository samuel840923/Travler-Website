<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<head>
<div class="page-header">
 <center> <h1>Reservation</h1></center>
</div>
</head>
<body>
<div class="container">
    <div class='row'>
        <div class='col-md-12'>
          <script src='https://js.stripe.com/v2/' type='text/javascript'></script>
          <form accept-charset="UTF-8" action="/" class="require-validation" data-cc-on-file="false" data-stripe-publishable-key="pk_bQQaTxnaZlzv4FnnuZ28LFHccVSaj" id="payment-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="?" /><input name="_method" type="hidden" value="PUT" /><input name="authenticity_token" type="hidden" value="qLZ9cScer7ZxqulsUWazw4x3cSEzv899SP/7ThPCOV8=" /></div>
            <div class="row">
				<div class="col-xs-2 form-group">
					<label>Reservation No.</label>
				</div>
				<div class="col-xs-2 form-group">
					<label>Reservation Date</label>
				</div>
				<div class="col-xs-2 form-group">
					<label>Booking Fee</label>
				</div>
				<div class="col-xs-2 form-group">
					<label>Total Fare</label>
				</div>
				<div class="col-xs-2 form-group">
					<label>Rep SSN</label>
				</div>
				
				
			</div>
<%List result = (ArrayList)request.getAttribute("reservation");
for (int i=0;i<result.size();i++){
List sub = (ArrayList)result.get(i);
%>
			<div class="row">
			<form action = "DeleteReservationServlet" method = "post">
				<div class="col-xs-2 form-group">
					<label><%=sub.get(0) %></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><%=sub.get(1) %></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><%=sub.get(2) %></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><%=sub.get(3) %></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><%=sub.get(4) %></label>
				</div>
				<div class="col-xs-2 form-group">
					<button class='form-control btn btn-info submit-button' type='submit'>Cancel Reservation</button>
				</div>	
				<input type="hidden" name = "reserveno" value= "<%= sub.get(0) %>"/>
				</form>				
			</div>
	<%} %>		
			
				<div class='form-row'>
					<div class='col-md-6 form-group'>
						<button class='form-control btn btn-success submit-button' type='submit'>Search More Flights</button>
					</div>
					<div class='col-md-2 form-group'>
						<button class='form-control btn btn-danger submit-button' type='submit'>Log Out</button>
					</div>
            </div>
          </form>
        </div>
        <div class='col-md-4'></div>
    </div>
</div>
</body>
</html>