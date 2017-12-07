<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" style="font-size:2em;">CLW</a>
    </div>
     <%
	      Cookie[] cookies = null;
	      Cookie name = null, accountId = null, employeeId = null, isManager = null;
	      cookies = request.getCookies();
	      if (cookies != null) {
	   		for (int i = 0; i < cookies.length; i++) {
	        	 if (cookies[i].getName().equals("name")) {
	        		 name = cookies[i];
	        	 }
	        	 else if (cookies[i].getName().equals("accountId")) {
	        		 accountId = cookies[i];
	        	 }
	        	 else if (cookies[i].getName().equals("id")) {
	        		 employeeId = cookies[i];
	        	 }
	        	 else if (cookies[i].getName().equals("isManager")) {
	        		 isManager = cookies[i];
	        	 }
	      	}
	      }
   %>
    <ul class="nav navbar-nav">
      <!--<li class="active"><a href="#">Home</a></li>-->
      <li><a href="#">Home</a></li>
      <li><a href="/cse305web/FlightSearch">Flight Search</a></li>
      <%
      	if (employeeId == null) {
      %>
      	<li><a href="/cse305web/auction">Reverse Auction</a></li>
      <% } %>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <%
      	if (accountId == null && employeeId == null) {
      %>
      	<li><a href="/cse305web/register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      	<li><a href="/cse305web/login"><span class="glyphicon glyphicon-log-in"></span> Log In</a></li>
      <%
      	}
      	else {
      %>
      	<li><a href="/cse305web/logout"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
      	<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Hello <%=name.getValue() %><span class="caret"></span></a>
      <%
      	}
      %>
        <ul class="dropdown-menu">
          <%
          	if (accountId != null && employeeId == null) {
          %>
          	<li><a href="/CustomerServlet">Profile</a></li>
          <% } 
          	else if (employeeId != null && isManager.getValue().equalsIgnoreCase("False")) {
          %>
          	  <li><a href="/cse305web/employeeInfo">Profile</a></li>
	          <li><a href="/cse305web/empReserve">Record Reservation</a></li>
	          <li><a href="/cse305web/empAddPassenger">Add Passenger</a></li>
	          <li><a href="/cse305web/empEditPassenger">Edit Passenger</a></li>
	          <li><a href="/cse305web/empDeletePassenger">Delete Passenger</a></li>
	          <li><a href="/cse305web/customerMailingList">Mailing List</a></li>
	          <li><a href="/cse305web/empFlightSuggestions">Flight Suggestion</a></li>
          <% } 
          	else if (employeeId != null && isManager.getValue().equalsIgnoreCase("True")) {
          %>
          	  <li><a href="/cse305web/employeeInfo">Profile</a></li>
          	  <li><a href="/cse305web/empReserve">Record Reservation</a></li>
	          <li><a href="/cse305web/empAddPassenger">Add Passenger</a></li>
	          <li><a href="/cse305web/empEditPassenger">Edit Passenger</a></li>
	          <li><a href="/cse305web/empDeletePassenger">Delete Passenger</a></li>
	          <li><a href="/cse305web/customerMailingList">Mailing List</a></li>
	          <li><a href="/cse305web/empFlightSuggestions">Flight Suggestion</a></li>
	          <li><a href="/cse305web/ManagerServlet">Manager Transaction</a></li>
	          <li><a href="/cse305web/ManagerEditServlet">Add Employee or Customer</a></li>
	          <li><a href="/cse305web/ManagerUpdateServlet">Update Info for Employee or Customer</a></li>
	          <li><a href="/cse305web/ManagerDeleteServlet">Delete Employee or Customer</a></li>
          <% } %>
        </ul>
      </li>
    </ul>
  </div>
</nav>