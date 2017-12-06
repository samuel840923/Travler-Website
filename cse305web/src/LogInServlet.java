import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogInServlet extends HttpServlet{
	public static final String customerLogIn = "SELECT C.AccountNo, P.FirstName, P.LastName FROM Customer C, Person P WHERE "
			+ "C.Id=P.Id AND C.Email=? AND C.Password=?;";
	public static final String employeeLogIn = "SELECT E.IsManager, E.Id, P.FirstName, P.LastName FROM Employee E, Person P "
			+ "WHERE E.Id=P.Id AND E.Id=?;";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
	    dispatcher.forward(request, response); 
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
				stmt.setString(1, email);
			}
			else {
				stmt.setString(1, email);
				stmt.setString(2, password);
			}
			data = stmt.executeQuery();
			HttpSession session = request.getSession();
			if (data != null && data.next()) {
				if (user.equalsIgnoreCase("customer")) {
					session.setAttribute("accountNo", data.getInt("AccountNo"));
					session.setAttribute("name", data.getString("FirstName") + " " + data.getString("LastName"));
					session.setMaxInactiveInterval(30*60);
					Cookie accountNo = new Cookie("user", data.getInt("AccountNo") + "");
					Cookie name = new Cookie("name", data.getString("FirstName") + " " + data.getString("LastName"));
					name.setPath("/");
					accountNo.setPath("/");
					name.setMaxAge(30*60);
					accountNo.setMaxAge(30*60);
					response.addCookie(name);
					response.addCookie(accountNo);
					response.sendRedirect("/cse305web/CustomerServlet");
				}
				else {
					session.setAttribute("id", data.getInt("Id"));
					session.setAttribute("name", data.getString("FirstName") + " " + data.getString("LastName"));
					session.setAttribute("isManager", data.getBoolean("IsManager") + "");
					session.setMaxInactiveInterval(30*60);
					Cookie id = new Cookie("id", data.getInt("Id") + "");
					Cookie name = new Cookie("name", data.getString("FirstName") + " " + data.getString("LastName"));
					Cookie isManager = new Cookie("isManager", data.getBoolean("IsManager") + "");
					name.setPath("/");
					id.setPath("/");
					id.setPath("/");
					isManager.setMaxAge(30*60);
					name.setMaxAge(30*60);
					isManager.setMaxAge(30*60);
					response.addCookie(id);
					response.addCookie(name);
					response.addCookie(isManager);
					response.sendRedirect("/cse305web/empReserve");
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
