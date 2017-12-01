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

public class DeletePassengerServlet extends HttpServlet{
	public static final String getPassengerId = "SELECT R.Id FROM ReservationPassenger R, Person P WHERE ResrNo=? AND AccountNo=? "
			+ "P.Id=R.ID AND P.FirstName=? AND P.LastName=?";
	public static final String deleteReservationPassenger = "DELETE FROM ReservationPassenger WHERE AccountNo=? AND ResrNo=? AND Id=?;";
	public static final String deletePassenger = "DELETE FROM Passenger WHERE AccountNo=? AND Id=?;";
	public static final String deletePerson = "DELETE FROM Person WHERE Id=?;";
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		int empId = 4; // Need to grab from cookie/session. Check for employee log in
		int reservationNumber = Integer.parseInt(request.getParameter("reservationNumber"));
		int accountNumber = Integer.parseInt(request.getParameter("accountNumber"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		int error = 0;
		int passengerId = -1;	
		
		try {
			connection = JDBC.getConnection();
			ResultSet data = null;
			PreparedStatement stmt = connection.prepareStatement(getPassengerId);
			stmt.setInt(1, reservationNumber);
			stmt.setInt(2, accountNumber);
			stmt.setString(3, firstName);
			stmt.setString(4, lastName);
			data = stmt.executeQuery();
			if (data != null && data.next()) {
				passengerId = data.getInt("Id");
			}
			else {
				//Error, no reservation found
			}
			stmt = connection.prepareStatement(deleteReservationPassenger);
			stmt.setInt(1, accountNumber);
			stmt.setInt(2, reservationNumber);
			stmt.setInt(3, passengerId);
			error = stmt.executeUpdate();
			if (error == 0) {
				//handle error by loading error
			}
			stmt = connection.prepareStatement(deletePassenger);
			stmt.setInt(1, accountNumber);
			stmt.setInt(2, passengerId);
			error = stmt.executeUpdate();
			if (error == 0) {
				//handle error by loading error
			}
			stmt = connection.prepareStatement(deletePerson);
			stmt.setInt(1, passengerId);
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
