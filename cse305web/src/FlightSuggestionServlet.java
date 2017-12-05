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
import javax.servlet.http.HttpSession;

public class FlightSuggestionServlet extends HttpServlet{
	public static final String getFlightSuggestions = "SELECT * FROM FlightReservation FR WHERE NOT EXISTS (" +
			"SELECT * FROM Reservation R, Includes I WHERE R.ResrNo = I.ResrNo AND FR.AirlineID = I.AirlineID " +
			"AND FR.FlightNo = I.FlightNo AND R.AccountNo = ?) ORDER BY FR.ResrCount DESC;";
	public static final String getCustomers = "SELECT C.AccountNo, P.FirstName, P.LastName FROM Customer C, Person P "
			+ "WHERE C.Id=P.Id";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("id") ==  null) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login");
		    dispatcher.forward(request, response);
		    return;
		}
		int empId = (int)session.getAttribute("id");
		Connection connection;
		List customers = new ArrayList();
		try {
			connection = JDBC.getConnection();
			PreparedStatement stmt = connection.prepareStatement(getCustomers);
			ResultSet data = stmt.executeQuery();
			while(data!=null && data.next()) {
				List customer = new ArrayList();
				customer.add(data.getInt("AccountNo") + "");
				customer.add(data.getString("FirstName") + " " + data.getString("LastName"));
			    customers.add(customer);
			}
			connection.close();
		}
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("customers", customers);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/EmployeeFlightSuggestion.jsp");
		dispatcher.forward(request, response); 
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("id") ==  null) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login");
		    dispatcher.forward(request, response);
		    return;
		}
		int empId = (int)session.getAttribute("id");
		Connection connection;
		List flightSuggestions = new ArrayList();
		int accountNo = Integer.parseInt(request.getParameter("customer"));
		try {
			connection = JDBC.getConnection();
			PreparedStatement stmt = connection.prepareStatement(getFlightSuggestions);
			stmt.setInt(1, accountNo);
			ResultSet data = stmt.executeQuery();
			while(data!=null && data.next()) {
				List flight = new ArrayList();
				flight.add(data.getString("AirlineID"));
				flight.add(data.getInt("FlightNo"));
				flight.add(data.getInt("ResrCount"));
				flightSuggestions.add(flight);
			}
			connection.close();
		}
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("flightSuggestions", flightSuggestions);
		request.setAttribute("accountNo", accountNo);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/EmployeeFlightSuggestion.jsp");
		dispatcher.forward(request, response); 
	}
}
