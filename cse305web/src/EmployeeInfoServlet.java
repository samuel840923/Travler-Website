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
import javax.servlet.http.HttpSession;

public class EmployeeInfoServlet extends HttpServlet{
	public static final String getPerson = "SELECT * FROM Person where Id = ?";
	public static final String getEmployee = "SELECT * FROM Employee Where Id = ?";
	public static final String updatePerson = "UPDATE Person SET FirstName=?, LastName=?, Address=?, City=?, "
			+ "State=?, Zipcode=? WHERE Id=?;";
	public static final String updateEmployee = "UPDATE Employee SET SSN=? WHERE Id=?";
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("id") ==  null) {
			response.sendRedirect("/cse305web/login");
		    return;
		}
		Connection connection;
		int id = (int)session.getAttribute("id");
		Employee employee = null;
		try {
			connection = JDBC.getConnection();
			ResultSet data = null;
			PreparedStatement stmt = connection.prepareStatement(getPerson);
			stmt.setInt(1, id);
			data = stmt.executeQuery();
			String firstName = "", lastName = "", address = "", city = "", state = "";
			int zipcode = 0;
			while(data != null && data.next()) {
				firstName = data.getString("FirstName");
				lastName = data.getString("LastName");
				address = data.getString("Address");
				city = data.getString("City");
				state = data.getString("State");
				zipcode = data.getInt("ZipCode");
			}
			stmt = connection.prepareStatement(getEmployee);
			stmt.setInt(1, id);
			data = stmt.executeQuery();
			while(data != null && data.next()) {
				int ssn = data.getInt("SSN");
				boolean isManager = data.getBoolean("IsManager");
				String startDate = data.getString("StartDate");
				Double hourlyRate = data.getDouble("HourlyRate");
				employee = new Employee(id, firstName, lastName, address, city, state, zipcode, ssn, isManager, startDate, hourlyRate);
			}
			connection.close();
		}
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("employee", employee); 
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/EmployeeInfo.jsp");
		dispatcher.forward(request, response); 
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("id") ==  null) {
			response.sendRedirect("/cse305web/login");
		    return;
		}
		Connection connection;
		int id = (int)session.getAttribute("id");
		Employee employee = null;
		int error = 0;
		try {
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			int zipcode = Integer.parseInt(request.getParameter("zipcode"));
			int ssn = Integer.parseInt(request.getParameter("ssn"));
			connection = JDBC.getConnection();
			PreparedStatement stmt = connection.prepareStatement(updatePerson);
			stmt.setString(1, firstName);
			stmt.setString(2, lastName);
			stmt.setString(3, address);
			stmt.setString(4, city);
			stmt.setString(5, state);
			stmt.setInt(6, zipcode);
			stmt.setInt(7, id);
			error = stmt.executeUpdate();
			if (error == 0) {
				//handle error by loading error
			}
			stmt = connection.prepareStatement(updateEmployee);
			stmt.setInt(1, ssn);
			stmt.setInt(2, id);
			if (error == 0) {
				//handle error by loading error
			}
			connection.close();
		}
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("/cse305web/employeeInfo");
		//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/EmployeeInfo.jsp");
		//dispatcher.forward(request, response);
	}
}
