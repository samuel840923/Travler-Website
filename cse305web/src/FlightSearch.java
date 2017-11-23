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

public class FlightSearch extends HttpServlet { 
  public static final String ONE = "one";
  public static final String ROUND = "return";
  public static final String MULTI = "multi";
  public static final String addzero = " 00:00:00";
  public static final String SQL_SINGLE = "Select l1.AirlineID, l1.FlightNo, l1.DepAirportID, l2.ArrAirportID, l1.DepTime, l2.ArrTime " + 
	 		"from leg l1, leg l2 where l1.FlightNo = l2.FlightNo and l1.ArrAirportID = l2.DepAirportID and l1.DepAirportID = ? "
	 		+ "and l1.DepTime >= ? and l2.ArrAirportID = ?";
  public static final String SQL_ROUND = "Select l1.AirlineID, l1.FlightNo, l1.DepAirportID, l2.ArrAirportID, l1.DepTime, l2.ArrTime "  + 
  			 		"from leg l1, leg l2 where l1.FlightNo = l2.FlightNo and l1.ArrAirportID = l2.DepAirportID and l1.DepAirportID = ? " + 
  			 		"and l1.DepTime >= ? and l2.ArrAirportID = ?";
  protected void doPost(HttpServletRequest request, 
      HttpServletResponse response) throws ServletException, IOException 
  {
    // reading the user input
	List result = new ArrayList();
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
    
    try {
    	
		Connection connection = JDBC.getConnection();
		Statement state = connection.createStatement();
		ResultSet re = null;
		if (type.equals(ONE)) {
		 PreparedStatement stmt=connection.prepareStatement(SQL_SINGLE);  
		 stmt.setString(1, flyfrom);
		 stmt.setString(2, start);
		 stmt.setString(3, flyto);
		 re =  stmt.executeQuery();
		}
		else if (type.equals(ROUND)) {
		  PreparedStatement stmt=connection.prepareStatement(SQL_ROUND);
		  stmt.setString(1, flyto);
		  stmt.setString(2, return_date);
		  stmt.setString(3, flyfrom);
		  re =  stmt.executeQuery();
		}
		else if (type.equals(MULTI)) {
			PreparedStatement stmt=connection.prepareStatement(SQL_ROUND);
			  stmt.setString(1, flyto2);
			  stmt.setString(2, start2);
			  stmt.setString(3, flyfrom2);
			  re =  stmt.executeQuery();
		}
		while(re.next()) {
			List subresult = new ArrayList();
		    subresult.add(re.getString("AirlineID"));
			subresult.add(re.getInt("FlightNo"));
			subresult.add(re.getString("DepAirportID"));
			subresult.add(re.getString("ArrAirportID"));
			subresult.add(re.getString("DepTime"));
			subresult.add(re.getString("ArrTime"));
		result.add(subresult);
		}
	} catch (ClassNotFoundException e) {
		System.out.println(start);
	} catch (SQLException e) {
		e.printStackTrace();
	}
    
    
   request.setAttribute("searchlist",result); 
    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/FlightSearchResult.jsp");
   dispatcher.forward(request, response); 
  }  
}
    