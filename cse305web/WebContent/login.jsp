<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>
			Log In
		</title>
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  		<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  		<style>
  			.account-wall {
			    margin-top: 3%;
			    padding: 10% 0% 0.5% 0%;
			    background-color: #f7f7f7;
			    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			}
			.login-title {
			    font-size: 3em;
			    display: block;
			}
			img {
				width: 100%;
				margin-top: -20%;
				margin-bottom: -7%;
			}
			.form-control {
				width: 95%;
				margin: auto;
				margin-bottom: 3%;
			}
			.sign-in {
				width: 95%;
				margin: auto;
			}
  		</style>
	</head>
	<body>
		<jsp:include page="navbar.jsp" />
		<div class="container">
		    <div class="row">
		        <div class="col-sm-6 col-md-4 col-md-offset-4 ">
		            <h1 class="text-center login-title">Sign In</h1>
		            <div class="account-wall">
		            	<img src="http://1cl7my3ojidr1w3dre2xexmr.wpengine.netdna-cdn.com/wp-content/uploads/2015/02/Individual-Membership.png"/>
		                <form class="form-signin" method="POST" action="/cse305web/login">
			                <input type="text" class="form-control" placeholder="Customer Email/Employee ID" name="email" required autofocus>
			                <input type="password" class="form-control" placeholder="Password" name="password" required>
			                <select class="form-control selectpicker" name="user">
							  <option>Customer</option>
							  <option>Employee</option>
							</select>
			                <button class="btn btn-lg btn-primary btn-block sign-in" type="submit">Sign in</button>
		                </form>
		            </div>
		        </div>
		    </div>
		</div>
	</body>
</html>