import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FlightSuggestionServlet extends HttpServlet{
	public static final String getFlightSuggestions = "SELECT L.*, F.NoOfSeats, F.DaysOperating, F.MinLengthOfStay, F.MaxLengthOfStay "
			+ "FROM Flight F, Leg L WHERE F.FlightNo=L.FlightNo AND F.AirlineID=L.AirlineID AND L.CurrArrTime>NOW()"
			+ "AND L.CurrDepTime>NOW() AND F.AirlineID IN (Select Ic.AirlineID FROM Reservation R, Includes Ic "
			+ "WHERE R.AccountNo=? AND R.ResrNo=Ic.ResrNo AND NOW() > (SELECT MAX(L.DepTime) FROM Leg L, Includes I "
			+ "WHERE I.ResrNo=R.ResrNo AND I.AirlineID=L.AirlineID AND I.FlightNo=L.FlightNo));";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection;
		List flightSuggestions = new ArrayList();
		int accountNo = 102; // Need to grab from cookie/session
		try {
			connection = JDBC.getConnection();
			PreparedStatement stmt = connection.prepareStatement(getFlightSuggestions);
			ResultSet data = stmt.executeQuery();
			while(data!=null && data.next()) {
				List flight = new ArrayList();
				flight.add(data.getString(1));
				flight.add(data.getString(2));
				flight.add(data.getInt(3));
				flight.add(data.getString(4));
				flight.add(data.getString(5));
				flight.add(data.getString(6));
				flight.add(data.getString(7));
				flight.add(data.getString(8));
				flight.add(data.getString(9));
				flight.add(data.getInt(10));
				flight.add(data.getInt(11));
				flight.add(data.getInt(12));
				flight.add(data.getInt(13));
				flightSuggestions.add(flight);
			}
			connection.close();
		}
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("flightSuggestions", flightSuggestions);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/EmployeeMaster.jsp");
		dispatcher.forward(request, response); 
	}
}
