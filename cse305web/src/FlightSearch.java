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
  public static final String SQL_SINGLE = "Select l1.AirlineID, l1.FlightNo, l1.DepAirportID, l2.ArrAirportID, l1.DepTime, l2.ArrTime " + 
	 		" from leg l1, leg l2 where l1.FlightNo = l2.FlightNo and l1.DepAirportID = ? "
	 		+ " and l1.DepTime >= ? and l2.ArrAirportID = ?";

  protected void doPost(HttpServletRequest request, 
      HttpServletResponse response) throws ServletException, IOException 
  {
    // reading the user input
	List result = new ArrayList();
	List result2 = new ArrayList();
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
    start  = start + addzero;
    int types = 0;
    Timestamp sd = Timestamp.valueOf(start);
    try {
    	
		Connection connection = JDBC.getConnection();
		Statement state = connection.createStatement();
		ResultSet re = null;
		ResultSet re2 = null;
		 PreparedStatement stmt=connection.prepareStatement(SQL_SINGLE);  
		 stmt.setString(1, flyfrom);
		 stmt.setTimestamp(2, sd);
		 stmt.setString(3, flyto);
		 re =  stmt.executeQuery();
		 if (type.equals(ROUND)) {
			 types = 2;
		  PreparedStatement stmt1=connection.prepareStatement(SQL_SINGLE);
		  Timestamp rd = Timestamp.valueOf(return_date+addzero);
		  System.out.println(flyto);
		  System.out.println(rd);
		  System.out.println(flyfrom);
		  stmt1.setString(1, flyto);
		  stmt1.setTimestamp(2, rd);
		  stmt1.setString(3, flyfrom);
		  re2 =  stmt1.executeQuery();
		}
		else if (type.equals(MULTI)) {
			types = 2;
			PreparedStatement stmt1=connection.prepareStatement(SQL_SINGLE);
			Timestamp sd2 = Timestamp.valueOf(start2+addzero);
			System.out.println(flyto2);
			System.out.println(sd2);
			System.out.println(flyfrom2);
			  stmt1.setString(1, flyfrom2);
			  stmt1.setTimestamp(2, sd2);
			  stmt1.setString(3, flyto2);
			  re2 =  stmt1.executeQuery();
		}
		while(re!=null && re.next()) {
			List subresult = new ArrayList();
		    subresult.add(re.getString("AirlineID"));
			subresult.add(re.getInt("FlightNo"));
			subresult.add(re.getString("DepAirportID"));
			subresult.add(re.getString("ArrAirportID"));
			subresult.add(re.getString("DepTime"));
			subresult.add(re.getString("ArrTime"));
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
		result2.add(subresult);
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
		System.out.println(start);
	} catch (SQLException e) {
		e.printStackTrace();
	}
    
  
   request.setAttribute("searchlist",result); 
   request.setAttribute("searchlist2",result2); 
   request.setAttribute("type",types); 
    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/FlightSearchResult.jsp");
   dispatcher.forward(request, response); 
  }  
}
    