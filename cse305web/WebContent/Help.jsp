<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="navbar.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

/* Style the tab */


/* Style the buttons inside the tab */
div.tab button {
    display: block;
    background-color: inherit;
    color: black;
    padding: 22px 16px;
    width: 100%;
    border: none;
    outline: none;
    text-align: left;
    cursor: pointer;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
div.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current "tab button" class */
div.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    float: left;
    padding: 0px 12px;
    border: 1px solid #ccc;
    width: 70%;
    border-left: none;
    height: 300px;
}
</style>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    
    <div class="tab">
  <button class="tablinks" onclick="openCity(event, 'customer')" id="defaultOpen">Customer</button>
  <button class="tablinks" onclick="openCity(event, 'employee')">Employee</button>
  <button class="tablinks" onclick="openCity(event, 'manager')">Manager</button>
</div>
 
  <h2>Help Info</h2>
  <p><strong>Note:</strong> To view help tap on the questions below.</p>
<div id="customer" class="tabcontent">
  <div class="panel-group" id="accordion" >
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Search Flight</a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse in">
        <div class="panel-body">Start your reservation by starting to search for a flight! You can choose the flight type you want, and the time you want for your travel. 
            <p>
            <br>1) Go to the flight search page on the navigator bar on the top.
           <br>2) Start typing the info inside the textfield. <strong>Note:</strong> for the name of the airport please specific the 3 Letter Airport ID that is used by the airport
        
        <br>3) Enter the Date that you would like to travel, and the returning date if you are planning on a round trip for you travel. 
                <br> 4) For Multi Flight, The website will only support at most two multi fly. When searching for multi flight please specify the date of first and second trip, and of course the traveling destination. 
                <br> 5) Lastly, Please specific the number of passenger that will be going on with trip
                <br> 
                <br>
                After you fill out all the necessary information, hit search to search your flight!
      </p>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Making Reservation</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body"><strong>Make reservation after you search for your flight:</strong>
          <br> 
            <br> After you hit "Search" on the search page a list of flight will appear with information of the flight, and the class that each airline company is offering on the flight. <strong> Note: </strong> all the price list on the lists is the original price. there might be a chance for a airline to offer early bird  ticket. 
            <br> Once you decided on your ticket hit "More Info" for more information of the flight incluing the "Booking Fees", <strong>Booking fee is cacluated by the total price times 10% per person</strong>
            <br>
            <br> Once you decide on the ticket you wanted to buy, click on "Book this flight" to make reservation of the flight.
            <br>
            <br> After making sure you wanted to reserve for a flight, start entering the 
            information of the passenger that will be on the travel. 
            <br> <strong>If the seat that the passenger perfer is taken, then the customer can get their seat when they check-in at the airport</strong>
            
            <br>
            <br> Click "Reserve" after when you are done.
            <br>
            <br> You can see your Reservation under customer reservation tab.
 
              </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Cancel Reservation</a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">If you feel like you are not satisfy with the fly that you reserve, you can always cancel the reservation you make <strong>72 Hour</strong> before the flight. 
        <br> 
        <br> 1) Go to customer profile.
        <br> 2) Click on Reservation tab to see all the reservation that you make.
        <br> 3) Now, you will see a list of reservation that you made before, next to each reservation there is a cancel reservation tab.
            <br> 4) Click on "Cancel Reservation" to cancel your reservation.
            <br> <strong>Note: </strong> Reservation cannot be undo.
        </div>
      </div>
    </div>
      <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">Customer Information</a>
        </h4>
      </div>
      <div id="collapse4" class="panel-collapse collapse">
        <div class="panel-body">
            <p>Customer can view there profilo on the Customer tab in the nav bar.
            <br>
            <br> <strong>Information Customer can view under the tab:</strong>
            <br>
            <br> <strong>Current Bid:</strong> Reverse auction that the player made currenly
            <br> <strong> Bid History:</strong> User can search for a bid history if they know the number of the reservation of a particular reservation.
            <br> <strong>Best Sell:</strong> List of best flight that is trending right now
            <br> <strong>Flight Suggestion: </strong> Flight Suggestion based on the purchase that the customer made. 
            </p>
        </div>
      </div>
    </div>
      <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">Reverse Auction</a>
        </h4>
      </div>
      <div id="collapse5" class="panel-collapse collapse">
        <div class="panel-body">
            <p>Customer Can Bid The flight ticket to potentially get a better price on a flight
            <br>
            <br> Go to the bid option to make auction price
            <br> After going to bid auction user can start bidding the flight
            <br> User need to indicate which flight they are bidding for. 
            <br> they need to fill out:
            <br> - Airline ID
            <br> - Flight Number
            <br> - Class
            <br> - And the price they want to bid
            <br> 
                <br> If the Price they enter are lower than the current highest bid then the price will not be accepted. This can be seen in the customer profile under current bid tab. 
            
            </p>
        </div>
      </div>
    </div>
  </div> 
   
</div>
 
    
<div id="employee" class="tabcontent">
  <div class="panel-group" id="accordion" >
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">Recording Reservation </a>
        </h4>
      </div>
      <div id="collapse6" class="panel-collapse collapse in">
        <div class="panel-body"><p>
            Employeer Can Reserve Flight for customer
        <br> 
        <br> Go to the Flight Search to look for flight that customer want to take.
        <br> After You are done searching for the flight you want you can follow the guidance to make reservation
        <br> And After that everything works the same way that the customer reserve for their flight. 
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse7">Edit Customer</a>
        </h4>
      </div>
      <div id="collapse7" class="panel-collapse collapse">
        <div class="panel-body">
            <p>If you want to edit the customer information, you can do so by selecting the edit customer tab provided to make edit for the customer. 
            <br> Under the Customer info editor you can provide all the neccesary infomation that is needed to edit the customer profile. 
            <br> You can choose to Add or Delete information for a customer. 
            <br> And after you are done filling out the information for the customer just hit the button and it will be save!
            
            </p>
              </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse8">Producing Customer Mailing List </a>
        </h4>
      </div>
      <div id="collapse8" class="panel-collapse collapse">
        <div class="panel-body"> You can also produce all the mailing list for all the customer in the database. 
            <br> To do this you can just go to mailing list tab
            <br> And After you click on the tab you will now see all the address of each customer for you to mail. 
        </div>
      </div>
    </div>
      <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse9">Suggest Flight For a given customer</a>
        </h4>
      </div>
      <div id="collapse9" class="panel-collapse collapse">
        <div class="panel-body">
            <p> If you want to produce suggestion list for a particular customer, you can do so by selecting the Flight Suggestion list tab 
            <br> After you tap the tab, it will take you to a page where you can enter customer information
            <br> When you are done entering the information needed for the customer, it will go to database and grab the data based on user activity.
        
            </p>
        </div>
      </div>
    </div>
     
  </div> 
   
</div>
        
 <div id="manager" class="tabcontent">
  <div class="panel-group" id="accordion" >
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse10">Manager Transaction </a>
        </h4>
      </div>
      <div id="collapse10" class="panel-collapse collapse in">
          <div class="panel-body">
           Manager have the ability to view the transaction that is in the datebase
           
          <br>
          <br> <strong> Produce a summary listing of revenue generated by a particular flight, destination city, or customer
          </strong>
          <br> This can do this by entering either the flight number and airline id, or the customer id
          <br> After you are done you should be able to see the revenue generated by the given data
          <br> 
		  <br> <strong>Produce a comprehensive listing of all flights</strong>
		  <br> This tab will list all the flight in the leg table
		  <br> 
		  <br> <strong>Obtain a sales report for a particular month </strong>
		  <br> This option gives you the chance to get the sales report for a particular month. 
		  <br> You can enter the particular month in numerical value. 
		  <br> After that you will see the result in the table
		  <br>
		  <br> <strong>Produce a summary listing of revenue generated by a particular flight, destination city, or customer
		   </strong>
		  <br> You generate and see the city, customer ,flight, or destination city that generate the most profit in your system.
		  <br> You can enter the information you want to see in the box provided 
		  <br> After you are done it will produce the information for you.
		  <br>
		  <br> <strong>Determine which customer representative generated most total revenue
		   </strong>
		   <br> You can generate which employee produce the most profit. by choosing this option in the drop down. 
		   <br> 
		   <br> <strong>Determine which customer generated most total revenue
		    </strong>
		<br> like Employee you can see which customer will generated the most profit in the drop down menu.
		<br>
		<br> <strong>Produce a list of most active flights
		 </strong>
		 <br> With this option you can generate the flight that is most active.
		 <br> 
		 <br> <strong>Produce a list of all customers who have seats reserved on a given flight
		  </strong>
		  <br> This option will give a list of all customer that will be on the flight that you wish to search for
		  <br> just put down the airline id and flight number to search for the result. 
		  <br> 
		  <br><strong>Produce a list of all flights for a given airport
		   </strong>
		   <br> You can produce all the flight that is in a given airport. 
		   <br> Enter the name of the airport that you wish to search, and hit the button to search.
		   <br> 
		   <br> <strong> Produce a list of all flights whose arrival and departure times are on-time/delayed
		   </strong>
		   <br> You Can see all the flight that are on time, or delayed by this option. 
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse11">Add Customer/Employee </a>
        </h4>
      </div>
      <div id="collapse11" class="panel-collapse collapse">
        <div class="panel-body">
            <p> This function gives you the option to add employee or customer in the database. 
            <br> You can choose whether you want to add employee or customer in the option 
            <br> After you choose enter the information for the option you choose and click on the button 
            when you are done with adding the information for the customer/employee.
      
            </p>
              </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse12">Update Customer/Employee</a>
        </h4>
      </div>
      <div id="collapse12" class="panel-collapse collapse">
        <div class="panel-body"> To Update Customer or Employee you can go to the update page to execute the update
        <br> select whether you are editing Customer or Employee
        <br> After that provide the id of the option you are updating. 
        <br> When you finish click the button to update the save info.
        </div>
      </div>
    </div>
      <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse13">Delete Customer/Employee </a>
        </h4>
      </div>
      <div id="collapse13" class="panel-collapse collapse">
        <div class="panel-body">
            <p> If you want to delete certain customer or employee you can use this function to do your task.
            <br> Just select the customer or employee you wish to delete.
            <br> enter the id that is corresponding to the user that you want to delete.
            <br> after you are done you can hit the button to delete the user. 
        
            </p>
        </div>
      </div>
    </div>
       
     
     
  </div> 
   
</div>   
    
    
    
</body>
    
    <script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
</html>