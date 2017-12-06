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

public class EmployeeReservationServlet extends HttpServlet{
	public static final String getSSN = "SELECT SSN FROM Employee WHERE Id=?;";
	public static final String insertReservation = "INSERT INTO Reservation values(?, NOW(), ?, ?, ?, ?);";
	public static final String getLegDate = "SELECT DepTime FROM Leg WHERE AirlineID=? AND FlightNo=? AND LegNo=?;";
	public static final String insertIncludes = "INSERT INTO Includes values(?, ?, ?, ?, ?);";
	public static final String insertPerson = "INSERT INTO Person values(?, ?, ?, ?, ?, ?, ?);";
	public static final String insertPassenger = "INSERT INTO Passenger values(?, ?);";
	public static final String insertReservationPassenger = "INSERT INTO ReservationPassenger values(?, ?, ?, ?, ?, ?);";
	public static final String getCustomers = "SELECT C.AccountNo, P.FirstName, P.LastName FROM Customer C, Person P "
			+ "WHERE C.Id=P.Id";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("id") ==  null) {
			response.sendRedirect("/cse305web/login");
		    return;
		}
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
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/EmployeeReserve.jsp");
		dispatcher.forward(request, response); 
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		Random rand = new Random(System.nanoTime());
		int reservationNumber = rand.nextInt(Integer.MAX_VALUE);
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("id") ==  null) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login");
		    dispatcher.forward(request, response);
		    return;
		}
		int empId = (int)session.getAttribute("id");
		int accountNo = Integer.parseInt(request.getParameter("customer"));
		int repSSN = -1;
		int error = 0;
		
		try {
			Double bookingFee = Double.parseDouble(request.getParameter("bookingFee"));
			Double totalFee = Double.parseDouble(request.getParameter("totalFee"));
			String airlineId = request.getParameter("airlineId");
			int flightNumber = Integer.parseInt(request.getParameter("flightNumber"));
			String[] legs = request.getParameter("legNumbers").split(",");
			String[] firstName = request.getParameterValues("firstName");
			String[] lastName = request.getParameterValues("lastName");
			String[] address = request.getParameterValues("address");
			String[] city = request.getParameterValues("city");
			String[] state = request.getParameterValues("state");
			String[] zipcode = request.getParameterValues("zipcode");
			String[] seatNumber = request.getParameterValues("seatNumber");
			String[] rank = request.getParameterValues("class");
			String[] meal = request.getParameterValues("meal");
			connection = JDBC.getConnection();
			ResultSet data = null;
			PreparedStatement stmt = connection.prepareStatement(getSSN);
			stmt.setInt(1, empId);
			data = stmt.executeQuery();
			if (data != null && data.next()) {
				repSSN = data.getInt("SSN");
			}
			else {
				//Error, employee needs to relog
			}
			stmt = connection.prepareStatement(insertReservation);
			stmt.setInt(1, reservationNumber);
			stmt.setDouble(2, bookingFee);
			stmt.setDouble(3, totalFee);
			stmt.setInt(4, repSSN);
			stmt.setInt(5, accountNo);
			error = stmt.executeUpdate();
			if (error == 0) {
				//handle error by loading error
			}
			PreparedStatement stmt1;
			String date = "";
			for (String l : legs) {
				stmt1 = connection.prepareStatement(getLegDate);
				stmt1.setString(1, airlineId);
				stmt1.setInt(2, flightNumber);
				stmt1.setInt(3, Integer.parseInt(l));
				data = stmt1.executeQuery();
				if (data != null && data.next()) {
					date = data.getString("DepTime").split(" ")[0];
				}
				else {
					//Error, invalid leg number
				}
				stmt = connection.prepareStatement(insertIncludes);
				stmt.setInt(1, reservationNumber);
				stmt.setString(2, airlineId);
				stmt.setDouble(3, flightNumber);
				stmt.setInt(4, Integer.parseInt(l));
				stmt.setString(5, date);
				error = stmt.executeUpdate();
				if (error == 0) {
					//handle error by loading error
				}
			}
			int id;
			if (firstName.length == 0) {
				//handle error since no passenger
			}
			for (int i = 0; i < firstName.length; i++) {
				stmt = connection.prepareStatement(insertPerson);
				id = rand.nextInt(Integer.MAX_VALUE);
				stmt.setInt(1, id);
				stmt.setString(2, firstName[i]);
				stmt.setString(3, lastName[i]);
				stmt.setString(4, address[i]);
				stmt.setString(5, city[i]);
				stmt.setString(6, state[i]);
				stmt.setInt(7, Integer.parseInt(zipcode[i]));
				error = stmt.executeUpdate();
				stmt = connection.prepareStatement(insertPassenger);
				stmt.setInt(1, id);
				stmt.setInt(2, accountNo);
				error = stmt.executeUpdate();
				if (error == 0) {
					//handle error by loading error
				}
				stmt = connection.prepareStatement(insertReservationPassenger);
				stmt.setInt(1, reservationNumber);
				stmt.setInt(2,  id);
				stmt.setInt(3, accountNo);
				stmt.setString(4, seatNumber[i]);
				stmt.setString(5, rank[i]);
				stmt.setString(6, meal[i]);
				error = stmt.executeUpdate();
				if (error == 0) {
					//handle error by loading error
				}
			}
			connection.close();
		} 
		catch (ClassNotFoundException | NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/EmployeeReserve.jsp");
	    dispatcher.forward(request, response); 
	}
}
