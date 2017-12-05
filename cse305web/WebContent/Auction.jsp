<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <title>Reverse Auction</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
      .container {
        width: 80%;
      }
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
      <h1 class="auction-title">Reverse Auctions</h1>         
      <table class="table well">
        <thead>
          <tr>
            <th>Airline ID</th>
            <th>Flight Number</th>
            <th>Class</th>
            <th>NYOP</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <form action="/cse305web/auction" method="POST">
            <tr>
              <td><input type="text" placeholder="Airline ID" class="form-control" name="airlineId" required/></td>
              <td><input type="text" placeholder="Flight Number" class="form-control" name="flightNumber" required/></td>
              <td><input type="text" placeholder="Class" class="form-control" name="class" required/></td>
              <td><input type="text" placeholder="NYOP" class="form-control" name="nyop" required/></td>
              <td><button type="submit" class="btn btn-primary">Reverse Bid</button></td>
            </tr>
          </form>
        </tbody>
      </table>
    </div>
  </body>
</html>