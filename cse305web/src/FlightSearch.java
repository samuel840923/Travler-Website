import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class FlightSearch extends HttpServlet { 
  public static final String ONE = "One";
  public static final String ROUND = "Round";
  public static final String MULTI = "Multi";
  public static final String addzero = " 00:00:00";
  public static final String SQL_SINGLE = "Select l1.AirlineID, l1.FlightNo, l1.DepAirportID, l2.ArrAirportID, l1.DepTime, l2.ArrTime, f.FareType,f.Fare, f.Class\n" + 
  		"  			 		from leg l1, leg l2 , fare f where l1.DepAirportID = ? and  l1.DepTime >= ?  and l2.ArrAirportID = ? and l2.FlightNo = l1.FlightNo\n" + 
  		"                    and f.FlightNo = l1.FlightNo and f.FareType = 'One Way'";
  public static final String SQL_ROUND = "Select l1.AirlineID, l1.FlightNo, l1.DepAirportID, l2.ArrAirportID, l1.DepTime, l1.ArrTime ,l2.DepTime as DepTime2, l2.ArrTime as ArrTime2,  f.FareType,f.Fare, f.Class\n" + 
  		"  			 		from leg l1, leg l2 , fare f where l1.DepAirportID = ? and  l1.DepTime >= ?   and l2.ArrAirportID = ? and l2.FlightNo = l1.FlightNo " + 
  		"                    and f.FlightNo = l1.FlightNo and f.FareType = 'Round'";
  protected void doPost(HttpServletRequest request, 
      HttpServletResponse response) throws ServletException, IOException 
  {
    // reading the user input
	List result = new ArrayList();
	List result2 = new ArrayList();
	List roundtime = new ArrayList();
    String aid= request.getParameter("AID");    
    String flyfrom=request.getParameter("from");
    String flyto=request.getParameter("flyto");
    String flyfrom2=request.getParameter("from2");
    String flyto2=request.getParameter("flyto2");
    String start=request.getParameter("start_date");
    String start2=request.getParameter("start_date2");
    String return_date=request.getParameter("return_date");
    String nop=request.getParameter("nop");
    String type=request.getParameter("type");
    int types = 0;
   
    try {
    	
		Connection connection = JDBC.getConnection();
		Statement state = connection.createStatement();
		ResultSet re = null;
		ResultSet re2 = null;
		if(type.equals(ONE)) {
		 start  = start + addzero;
		 Timestamp sd = Timestamp.valueOf(start);
		 PreparedStatement stmt=connection.prepareStatement(SQL_SINGLE);  
		 stmt.setString(1, flyfrom);
		 stmt.setTimestamp(2, sd);
		 stmt.setString(3, flyto);
		 re =  stmt.executeQuery();
		}
		else if (type.equals(ROUND)) {
			 types = 1;
		  
		  PreparedStatement stmt1=connection.prepareStatement(SQL_ROUND);
		  PreparedStatement stmt2=connection.prepareStatement(SQL_ROUND);
		  Timestamp rd = Timestamp.valueOf(return_date+addzero);
		  start  = start + addzero;
		  Timestamp sd = Timestamp.valueOf(start);
		  stmt1.setString(1, flyfrom);
		  stmt1.setTimestamp(2, sd);
		  stmt1.setString(3, flyto);
		  
		  stmt2.setString(1, flyto);
		  stmt2.setTimestamp(2, rd);
		  stmt2.setString(3, flyfrom);
		  re2 =  stmt1.executeQuery();
		 ResultSet re3 = stmt2.executeQuery();
		 while(re3!= null && re3.next()) {
			 List sub = new ArrayList();
			 sub.add(re3.getString("DepTime"));
		     sub.add(re3.getString("ArrTime"));
		    roundtime.add(sub);
		 }
		  
		}
		else if (type.equals(MULTI)) {
			start  = start + addzero;
			Timestamp sd = Timestamp.valueOf(start);
			types = 2;
			PreparedStatement stmt1=connection.prepareStatement(SQL_SINGLE);
			stmt1.setString(1, flyfrom);
		    stmt1.setTimestamp(2, sd);
			stmt1.setString(3, flyto);
			re =  stmt1.executeQuery();
			PreparedStatement stmt2=connection.prepareStatement(SQL_SINGLE);
			Timestamp sd2 = Timestamp.valueOf(start2+addzero);
			stmt2.setString(1, flyfrom2);
		    stmt2.setTimestamp(2, sd2);
			stmt2.setString(3, flyto2);
			re2 =  stmt2.executeQuery();
		}
		while(re!=null && re.next()) {
			List subresult = new ArrayList();
		    subresult.add(re.getString("AirlineID"));
			subresult.add(re.getInt("FlightNo"));
			subresult.add(re.getString("DepAirportID"));
			subresult.add(re.getString("ArrAirportID"));
			subresult.add(re.getString("DepTime"));
			subresult.add(re.getString("ArrTime"));
			subresult.add(re.getString("FareType"));
			subresult.add(re.getString("Class"));
			subresult.add(re.getDouble("Fare"));
		result.add(subresult);
		}
		while(re2!=null && re2.next()) {
			List subresult = new ArrayList();
		    subresult.add(re2.getString("AirlineID"));
			subresult.add(re2.getInt("FlightNo"));
			subresult.add(re2.getString("DepAirportID"));
			subresult.add(re2.getString("ArrAirportID"));
			subresult.add(re2.getString("DepTime"));
			subresult.add(re2.getString("ArrTime"));
			subresult.add(re2.getString("FareType"));
			subresult.add(re2.getString("Class"));
			subresult.add(re2.getDouble("Fare"));
		result2.add(subresult);
		}
		connection.close();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
		System.out.println(start);
	} catch (SQLException e) {
		e.printStackTrace();
	}
    
  
   request.setAttribute("searchlist",result); 
   request.setAttribute("searchlist2",result2);
   request.setAttribute("round",roundtime); 
   request.setAttribute("type",types); 
   request.setAttribute("nop",nop); 
    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/FlightSearchResult.jsp");
   dispatcher.forward(request, response); 
  }  
}
    