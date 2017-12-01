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

public class AddPassengerServlet extends HttpServlet{
	public static final String getAccountNumber = "SELECT AccountNo FROM Reservation WHERE ResrNo=?";
	public static final String insertPerson = "INSERT INTO Person values(?, ?, ?, ?, ?, ?, ?);";
	public static final String insertPassenger = "INSERT INTO Passenger values(?, ?);";
	public static final String insertReservationPassenger = "INSERT INTO ReservationPassenger values(?, ?, ?, ?, ?, ?);";
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		Random rand = new Random(System.nanoTime());
		int id = rand.nextInt(Integer.MAX_VALUE);
		int empId = 4; // Need to grab from cookie/session. Check for employee log in
		int reservationNumber = Integer.parseInt(request.getParameter("reservationNumber"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		int zipcode = Integer.parseInt(request.getParameter("zipcode"));
		String seatNumber = request.getParameter("seatNumber");
		String rank = request.getParameter("class");
		String meal = request.getParameter("meal");
		int error = 0;
		int accountNumber = -1;
		
		try {
			connection = JDBC.getConnection();
			ResultSet data = null;
			PreparedStatement stmt = connection.prepareStatement(getAccountNumber);
			stmt.setInt(1, reservationNumber);
			data = stmt.executeQuery();
			if (data != null && data.next()) {
				accountNumber = data.getInt("AccountNo");
			}
			else {
				//Error, no reservation found
			}
			stmt = connection.prepareStatement(insertPerson);
			stmt.setInt(1, id);
			stmt.setString(2, firstName);
			stmt.setString(3, lastName);
			stmt.setString(4, address);
			stmt.setString(5, city);
			stmt.setString(6, state);
			stmt.setInt(7, zipcode);
			error = stmt.executeUpdate();
			stmt = connection.prepareStatement(insertPassenger);
			stmt.setInt(1, id);
			stmt.setInt(2, accountNumber);
			error = stmt.executeUpdate();
			if (error == 0) {
				//handle error by loading error
			}
			stmt = connection.prepareStatement(insertReservationPassenger);
			stmt.setInt(1, reservationNumber);
			stmt.setInt(2,  id);
			stmt.setInt(3, accountNumber);
			stmt.setString(4, seatNumber);
			stmt.setString(5, rank);
			stmt.setString(6, meal);
			error = stmt.executeUpdate();
			if (error == 0) {
				//handle error by loading error
			}
			connection.close();
		} 
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/EmployeeMaster.jsp");
	    dispatcher.forward(request, response); 
	}
}
