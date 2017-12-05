import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManagerServlet extends HttpServlet{
	public static final String MONTH_SALES = "Select Month(ResrDate) ,SUM(TotalFare) \n" + 
			"	From reservation\n" + 
			"	Where Month(ResrDate) = ?\n" + 
			"	Group By Month(ResrDate);\n";
	public static final String SHOW_LEG = "SELECT *\n" + 
			"	FROM leg\n";
	public static final String CURRENT_BID = "SELECT NYOP, AirlineID, FlightNo FROM Auctions WHERE AccountNo = ?";
	public static final String BID_HISTORY = "Select A.NYOP, R.ResrNo, ResrDate, R.BookingFee, R.TotalFare, R.AccountNo " + 
			" From reservation R, Customer C, Auctions A " + 
			" Where C.AccountNo = R.AccountNo AND R.ResrNo=? AND A.AccountNo = C.AccountNo";
	public static final String CUSTOMER_BID = "SELECT * FROM Reservation WHERE AccountNo = ?";
	public static final String BEST_SELL = "SELECT F.*, T.total " + 
			"FROM flight F, " + 
			"	(SELECT I.AirlineID, I.FlightNo, COUNT(*) AS total " + 
			"	FROM Includes I, Reservation R " + 
			"	WHERE I.ResrNo=R.ResrNo " + 
			"	GROUP BY I.AirlineID, I.FlightNo) AS T " + 
			"where F.AirlineID = T.AirlineId and F.FlightNo = T.flightNo " + 
			"group by F.AirlineID,F.FlightNo " + 
			"order by T.total DESC";
	public static final String FLIGHT_SUGGESTION = "SELECT L.*, F.NoOfSeats, F.DaysOperating, F.MinLengthOfStay, F.MaxLengthOfStay " + 
			"FROM Flight F, Leg L " + 
			"WHERE F.FlightNo=L.FlightNo AND F.AirlineID=L.AirlineID  " + 
			"AND F.AirlineID IN ( " + 
			"	Select Ic.AirlineID " + 
			"FROM Reservation R, Includes Ic " + 
			"WHERE R.AccountNo=( " + 
			"SELECT C.AccountNo FROM Customer C WHERE C.Id = ? " + 
			") " + 
			"AND R.ResrNo=Ic.ResrNo " + 
			"AND NOW() > ( " + 
			"SELECT MAX(L.DepTime) " + 
			"  	FROM Leg L, Includes I " + 
			" WHERE I.ResrNo=R.ResrNo AND I.AirlineID=L.AirlineID AND " + 
			"I.FlightNo=L.FlightNo " + 
			")" + 
			")";
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Connection connection;
		List monSales = new ArrayList();
		List leg = new ArrayList();
		String Month = request.getParameter("Month");
		
		try 
		{
			connection = JDBC.getConnection();
			PreparedStatement stmt = connection.prepareStatement(MONTH_SALES);
			int mon = Integer.parseInt(Month);
			stmt.setInt(1, mon);
			ResultSet reserve = stmt.executeQuery();
			while(reserve!=null && reserve.next()) 
			{
				List subresult = new ArrayList();
				subresult.add(reserve.getLong("Month(ResrDate)"));
				subresult.add(reserve.getLong("SUM(TotalFare)"));
				monSales.add(subresult);
			}
			PreparedStatement stmt2 = connection.prepareStatement(SHOW_LEG);
			reserve = stmt.executeQuery();
			while(reserve!=null && reserve.next()) 
			{
				List subresult = new ArrayList();
				subresult.add(reserve.getString("AirlineID"));
				subresult.add(reserve.getLong("FlightNo"));
				subresult.add(reserve.getLong("LegNo"));
				subresult.add(reserve.getString("DepAirportID"));
				subresult.add(reserve.getString("ArrAirportID"));
				subresult.add(reserve.getString("ArrTime"));
				subresult.add(reserve.getString("DepTime"));
				subresult.add(reserve.getString("CurrArrTime"));
				subresult.add(reserve.getString("CurrDepTime"));
				leg.add(subresult);
			}
			connection.close();
			
		} 
		catch (ClassNotFoundException | SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("monSales",monSales); 
		request.setAttribute("legs", leg);
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Manager.jsp");
	    dispatcher.forward(request, response); 
	    
		  }
}
