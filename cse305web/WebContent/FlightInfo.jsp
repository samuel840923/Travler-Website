<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="navbar.jsp" %>
 <%@include file="Error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Flight Info</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<form action = "FlightSearch" method = "post" id = "profileForm" onsubmit="return checkform()">
<div class="container" id = "con">
  <h2>Flight Info</h2>
  <p>Search for your flight</p>
    <div class="form-group row">
      <div class="col-xs-4">
        <label for="ex1">Flying From</label>
        <input class="form-control" name="from" type="text">
      </div>
      <div class="col-xs-4">
        <label for="ex2">Flying To</label>
        <input class="form-control" name="flyto" type="text">
      </div>
    </div>
    <div class="form-group row">
      <div class="col-xs-4">
        <label for="start_date">Depart Date</label>
    <input type="date" class="form-control" name="start_date" id="start_date" placeholder="mm/dd/yyyy">
      </div>
        <div class="col-xs-4" id ="return" style="display: none;">
        <label for="arrive_date">Return Date</label>
    <input type="date" class="form-control" name="return_date" id="arrive_date" placeholder="mm/dd/yyyy">
      </div>
    </div>
       <div class="form-group row">
      <div class="col-xs-2">
        <label for="nop">Number of Passengers</label>
    <input class="form-control" name="nop" type="text" id = "nop">
      </div>
        <div class="col-xs-4">
        <label for="ftype">Flight Type</label>
       <select class="selectpicker form-control" id = "sp" name = "type" onchange = "func1()">
        <option value = "One">One Way </option>
         <option value = "Round">Round trip</option>
        <option value = "Multi">Multi-City</option>
      </select>
      </div>
      </div>
           
    
    <div class="form-group row" id = "two" style="display: none;">
      <div class="col-xs-4" >
        <label for="ex1" >Flying From</label>
        <input class="form-control" name="from2" type="text">
      </div>
      <div class="col-xs-4">
        <label for="ex2">Flying To</label>
        <input class="form-control" name="flyto2" type="text">
      </div>
    </div>
    <div class="form-group row" id = "2r" style= "display: none;">
      <div class="col-xs-4">
        <label for="start_date">Depart Date</label>
    <input type="date" class="form-control" name="start_date2" id="start_date2" placeholder="mm/dd/yyyy">
      </div>
    </div>
    
      <div class="form-group row">
           <div class="col-xs-4">
          <button type="submit" class="btn btn-primary">Search</button>
          </div>
      </div>
  <script>
 function func1() {
     var x = document.getElementById("sp");

     if(x.value=="Multi"){
     document.getElementById("two").style.display = "block";
     document.getElementById("2r").style.display = "block";
     }
     else {
      document.getElementById("two").style.display = "none";
     document.getElementById("2r").style.display = "none";
     }
      if(x.value=="Round"){
     document.getElementById("return").style.display = "block";
        }
      else {
        document.getElementById("return").style.display = "none";
      }

       }
  </script>
  <script>
$(document).ready(function() {
    $('#profileForm').formValidation({
        framework: 'bootstrap',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            birthday: {
                validators: {
                    date: {
                        format: 'MM/DD/YYYY',
                        message: 'The value is not a valid date'
                    }
                }
            }
        }
    });
});
</script>
<script>
function checkform()
{
	 var x = document.getElementById("sp");
  if($("#nop").val()=="")
  {
    alert("Please specify the number of passenger");
    return false;
  }
  else if($("#start_date").val()=="")
  {
    alert("Please specify the Depart Date");
    return false;
  }
  else if(x.value == "Round" && $("#arrive_date").val()=="")
  {
    alert("Please specify the Round Date");
    return false;
  }
  else if(x.value == "Multi" && $("#start_date2").val()=="")
  {
    alert("Please specify the second start date");
    return false;
  }
  else{
  return true;
}
}
</script>
</div> 
 </form>
</body>
</html>