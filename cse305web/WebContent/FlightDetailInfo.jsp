<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<head>
<div class="page-header">
 <center> <h1>Flight Info</h1></center>
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
					<label><u>Airline</u></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><u>FlightNo.</u></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><u>Dept. Airport</u></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><u>Ar. Airport</u></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><u>Dept. Time</u></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><u>Ar. Time</u></label>
				</div>
				
<%
List bookfare = (ArrayList)request.getAttribute("bookfare"); 

List discount = (ArrayList)request.getAttribute("discount"); 

String nop = (String)request.getAttribute("nop"); 
String flight = (String)request.getAttribute("flight");
String air  = (String)request.getAttribute("air");
String depname = (String)request.getAttribute("depair");
String arrname= (String)request.getAttribute("arrair");
String deptime = (String)request.getAttribute("deptime");
String arrtime = (String)request.getAttribute("arrtime");
String faretype = (String)request.getAttribute("faret");
String fare=  (String)request.getAttribute("fare");
String type  = (String) request.getAttribute("type");
String classtype = (String)request.getAttribute("class");
double fares = Double.parseDouble(fare);
int nop1 = Integer.parseInt(nop);
double bookfee = 0;
if(bookfare.size()!=0)
bookfee = (double)bookfare.get(0);
int day = 0;
double rate = 0;
if (discount.size()!= 0){
	 day = (int)discount.get(0);
	 rate = (double)discount.get(1);
}
double total = fares*(1-rate)*nop1 + bookfee;
%>
				
			</div>
			<div class="row">
				<div class="col-xs-2 form-group">
					<label><%=air %></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><%=flight %>.</label>
				</div>
				<div class="col-xs-2 form-group">
					<label><%=depname %></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><%=arrname %></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><%=deptime %></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><%=arrtime %></label>
				</div>				
			</div>

		  <div class="row">
				<div class="col-xs-2 form-group">
					<label><u>Price</u></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><u>Booking Fee</u></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><u>Number of People</u></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><u>Early Bird Rate</u></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><u>Time Left For Discount!</u></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><u>Total Price</u></label>
				</div>

			</div>
			 <div class="row">
				<div class="col-xs-2 form-group">
					<label><%=fares %></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><%=bookfee %></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><%=nop1 %></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><%=rate %></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><%=day + " Days"%></label>
				</div>
				<div class="col-xs-2 form-group">
					<label><%=total %></label>
				</div>

			</div>
			 <div class='form-row'>
              <div class='col-md-6 form-group'>
                <button class='form-control btn btn-info submit-button' type='submit'>Back To Flight List</button>
              </div>
			  <div class='col-md-6 form-group'>
                <button class='form-control btn btn-success submit-button' type='submit'>Book this flight!</button>
              </div>
            </div>
          </form>
        </div>
        <div class='col-md-4'></div>
    </div>
</div>
</body>