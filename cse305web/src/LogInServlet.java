import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogInServlet extends HttpServlet{
	public static final String customerLogIn = "SELECT AccountNo FROM Customer WHERE Email=? AND Password=?;";
	public static final String employeeLogIn = "SELECT IsManager, Id FROM Employee WHERE Email=? AND Password=?;";
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String user = request.getParameter("user");
		try {
			connection = JDBC.getConnection();
			ResultSet data = null;
			PreparedStatement stmt = connection.prepareStatement(customerLogIn);
			if (user.equalsIgnoreCase("employee")) {
				stmt = connection.prepareStatement(employeeLogIn);
			}
			stmt.setString(1, email);
			stmt.setString(2, password);
			data = stmt.executeQuery();
			HttpSession session = request.getSession();
			if (data != null && data.next()) {
				if (user.equalsIgnoreCase("customer")) {
					session.setAttribute("accountNo", data.getInt("AccountNo"));
					session.setMaxInactiveInterval(30*60);
					Cookie userName = new Cookie("user", data.getInt("AccountNo") + "");
					userName.setMaxAge(30*60);
					response.addCookie(userName);
					response.sendRedirect("/cse305web/CustomerServlet");
				}
				else {
					session.setAttribute("id", data.getInt("Id"));
					session.setMaxInactiveInterval(30*60);
					Cookie id = new Cookie("id", data.getInt("Id") + "");
					id.setMaxAge(30*60);
					response.addCookie(id);
					if (data.getBoolean("IsManager")) {
						response.sendRedirect("Employee.jsp");
					}
					else {
						response.sendRedirect("Manager.jsp");
					}
				}
				connection.close();
				return;
			}
			else {
				//Error, invalid log in credentials
			}
			connection.close();
		} 
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/");
	    dispatcher.forward(request, response); 
	}

}
