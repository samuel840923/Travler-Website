import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddReservationPassenger extends HttpServlet{
	public static final String insertPerson = "INSERT INTO Person values(?, ?, ?, ?, ?, ?, ?);";
	public static final String insertPassenger = "INSERT INTO Passenger values(?, ?);";
	public static final String insertReservationPassenger = "INSERT INTO ReservationPassenger values(?, ?, ?, ?, ?, ?);";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		
		try {
			Random rand1 = new Random(System.nanoTime());
			int resrvationNumber = rand1.nextInt(Integer.MAX_VALUE);
			connection = JDBC.getConnection();
		
		int nop = Integer.parseInt(request.getParameter("nop"));
		for(int i =0;i<nop;i++) {
			Random rand = new Random(System.nanoTime());
			int id = rand.nextInt(Integer.MAX_VALUE);
			String firstName = request.getParameter("firstName"+i);
			String lastName = request.getParameter("lastName"+i);
			String address = request.getParameter("address"+i);
			String city = request.getParameter("city"+i);
			String state = request.getParameter("state"+i);
			int zipcode = Integer.parseInt(request.getParameter("zipcode"+i));
			
			PreparedStatement stmt = connection.prepareStatement(insertPerson);
			stmt.setInt(1, id);
			stmt.setString(2, firstName);
			stmt.setString(3, lastName);
			stmt.setString(4, address);
			stmt.setString(5, city);
			stmt.setString(6, state);
			stmt.setInt(7, zipcode);
			int error = stmt.executeUpdate();
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
			
			
			
			
			
		}	
		}
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
