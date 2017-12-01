import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet{
	public static final String insertPerson = "INSERT INTO PERSON values(?, ?, ?, ?, ?, ?, ?);";
	public static final String insertCustomer = "INSERT INTO CUSTOMER values(?, ?, null, ?, NOW(), 0, ?);";
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		Random rand = new Random(System.nanoTime());
		int id = rand.nextInt(Integer.MAX_VALUE);
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		int zipcode = Integer.parseInt(request.getParameter("zipcode"));
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		int error = 0;
		
		try {
			connection = JDBC.getConnection();
			PreparedStatement stmt = connection.prepareStatement(insertPerson);
			stmt.setInt(1, id);
			stmt.setString(2, firstName);
			stmt.setString(3, lastName);
			stmt.setString(4, address);
			stmt.setString(5, city);
			stmt.setString(6, state);
			stmt.setInt(7, zipcode);
			error = stmt.executeUpdate();
			if (error == 0) {
				//handle error by loading error
			}
			stmt = connection.prepareStatement(insertCustomer);
			stmt.setInt(1, id);
			stmt.setInt(2, rand.nextInt(Integer.MAX_VALUE));
			stmt.setString(3, email);
			stmt.setString(4,  password);
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
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.html");
	    dispatcher.forward(request, response); 
	}
}