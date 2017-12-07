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

public class EditPassengerServlet extends HttpServlet{
	//public static final String getPassengerId = "SELECT R.Id FROM ReservationPassenger R, Person P WHERE ResrNo=? AND AccountNo=? "
			//+ "P.Id=R.ID AND P.FirstName=? AND P.LastName=?";
	public static final String updatePerson = "UPDATE Person SET FirstName=?, LastName=?, Address=?, City=?, "
			+ "State=?, Zipcode=? WHERE Id=?;";
	public static final String updatePassenger = "UPDATE ReservationPassenger SET SeatNo=?, Class=?, Meal=? "
			+ "WHERE AccountNo=? AND ResrNo=? AND Id=?;";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("id") ==  null) {
			response.sendRedirect("/cse305web/login");
		    return;
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/EmployeeEditPassenger.jsp");
	    dispatcher.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("id") ==  null) {
			response.sendRedirect("/cse305web/login");
		    return;
		}
		int empId = (int)session.getAttribute("id"); // Need to grab from cookie/session. Check for employee log in
		int error = 0;
		//int passengerId = -1;
		
		try {
			int reservationNumber = Integer.parseInt(request.getParameter("reservationNumber"));
			int accountNumber = Integer.parseInt(request.getParameter("accountNumber"));
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			int zipcode = Integer.parseInt(request.getParameter("zipcode"));
			String seatNumber = request.getParameter("seatNumber");
			String rank = request.getParameter("class");
			String meal = request.getParameter("meal");
			int passengerId = Integer.parseInt(request.getParameter("passengerId"));
			connection = JDBC.getConnection();
			ResultSet data = null;
			/*PreparedStatement stmt = connection.prepareStatement(getPassengerId);
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
			}*/
			PreparedStatement stmt = connection.prepareStatement(updatePerson);
			stmt.setString(1, firstName);
			stmt.setString(2, lastName);
			stmt.setString(3, address);
			stmt.setString(4, city);
			stmt.setString(5, state);
			stmt.setInt(6, zipcode);
			stmt.setInt(7, passengerId);
			error = stmt.executeUpdate();
			if (error == 0) {
				//handle error by loading error
				connection.close();
				request.setAttribute("error", "Unable to update passenger.");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/EmployeeEditPassenger.jsp");
			    dispatcher.forward(request, response);
			    return;
			}
			stmt = connection.prepareStatement(updatePassenger);
			stmt.setString(1, seatNumber);
			stmt.setString(2, rank);
			stmt.setString(3, meal);
			stmt.setInt(4, accountNumber);
			stmt.setInt(5,  reservationNumber);
			stmt.setInt(6, passengerId);
			error = stmt.executeUpdate();
			if (error == 0) {
				connection.close();
				request.setAttribute("error", "Unable to update passenger.");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/EmployeeEditPassenger.jsp");
			    dispatcher.forward(request, response);
			    return;
			}
			connection.close();
		} 
		catch (ClassNotFoundException | NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/EmployeeEditPassenger.jsp");
	    dispatcher.forward(request, response); 
	}
}
