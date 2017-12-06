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

public class CustomerMailingListServlet extends HttpServlet{
	public static final String getMailingList = "SELECT P.FIrstName, P.LastName, P.Address, P.City, P.State, "
			+ "P.ZipCode FROM Customer C, Person P WHERE P.Id=C.Id;";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("id") ==  null) {
			response.sendRedirect("/cse305web/login");
		    return;
		}
		int empId = (int)session.getAttribute("id");
		Connection connection;
		List mailingList = new ArrayList();
		try {
			connection = JDBC.getConnection();
			PreparedStatement stmt = connection.prepareStatement(getMailingList);
			ResultSet data = stmt.executeQuery();
			while(data!=null && data.next()) {
				List customer = new ArrayList();
				customer.add(data.getString("FirstName"));
				customer.add(data.getString("LastName"));
				customer.add(data.getString("Address"));
				customer.add(data.getString("City"));
				customer.add(data.getString("State"));
				customer.add(data.getInt("ZipCode") + "");
				mailingList.add(customer);
			}
			connection.close();
		}
		catch (ClassNotFoundException | NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("mailingList", mailingList);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/EmployeeCustomerMailingList.jsp");
		dispatcher.forward(request, response); 
	}
}
