import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomerServlet extends HttpServlet{
	public static final String CURRENT_BID = "SELECT NYOP FROM Auctions WHERE AccountNo = ?";
	public static final String BID_HISTORY = "Select A.NYOP, R.ResrNo, ResrDate, R.BookingFee, R.TotalFare" + " R.AccountNo " + 
			"From reservation R, Customer C, Auctions A " + 
			"Where C.AccountNo = R.AccountNo AND R.ResrNo=? AND A.AccountNo=C.AccountNo";
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
			"WHERE F.FlightNo=L.FlightNo AND F.AirlineID=L.AirlineID AND L.CurrArrTime>NOW() AND L.CurrDepTime>NOW() " + 
			"AND F.AirlineID IN ( " + 
			"	Select Ic.AirlineID " + 
			"FROM Reservation R, Includes Ic " + 
			"WHERE R.AccountNo=( " + 
			"SELECT C.AccountNo FROM Customer C WHERE C.Id=? " + 
			") " + 
			"AND R.ResrNo=Ic.ResrNo " + 
			"AND NOW() > ( " + 
			"SELECT MAX(L.DepTime) " + 
			"  	FROM Leg L, Includes I " + 
			"  	WHERE I.ResrNo=R.ResrNo AND I.AirlineID=L.AirlineID AND " + 
			"I.FlightNo=L.FlightNo " + 
			")" + 
			")";
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		  {
		Connection connection;
		List current_bid = new ArrayList();
		List bid = new ArrayList();
		List customer_bid = new ArrayList();
		List best_sell = new ArrayList();
		List flight_suggest = new ArrayList();
		try {
			connection = JDBC.getConnection();
			ResultSet re = null;
			Statement state = connection.createStatement();
			
			
			
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("currentbid",current_bid); 
		request.setAttribute("bid",bid); 
		request.setAttribute("customerbid",customer_bid); 
		request.setAttribute("bestsell",best_sell); 
		request.setAttribute("flightsuggest",flight_suggest); 
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerInfo.jsp");
	    dispatcher.forward(request, response); 
		  }
}
