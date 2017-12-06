import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateCustomerServlet extends HttpServlet{
	public static final String getPersonID = "Select Id from Customer where AccountNo = ?";
	public static final String UpdatePerson = "Update Person Set FirstName = ?,LastName = ?, Address = ?, City = ?, State = ?, ZipCode = ? where Id = ?";
	public static final String UpdateCustomer = "Update Customer Set Email = ?, CreditCardNo = ? where AccountNo = ?";
	public static final String UpdatePreference = "Insert into CustomerPreferences values (?,?)";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Cookie[] cookies = null;
			Cookie account = null;
			cookies = request.getCookies();
			if (cookies != null) {
		 		for (int i = 0; i < cookies.length; i++) {
		 			if (cookies[i].getName().equals("accountId")) {
		      		 account = cookies[i];
		      	 }
		 		
		 		}}
			Connection connection = JDBC.getConnection();
			int accountno = Integer.parseInt(account.getValue());
			String fname = request.getParameter("firstName");
			String lname = request.getParameter("lastName");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			int zipcode = Integer.parseInt(request.getParameter("zipcode"));
			String email = request.getParameter("email");
			String creditcard = request.getParameter("creditcard");
			String preference = request.getParameter("preference");
			
			PreparedStatement statement = connection.prepareStatement(getPersonID);
			statement.setInt(1,accountno);
			ResultSet getid = statement.executeQuery();
			int personid = 0;
			if(getid != null && getid.next()) {
				personid = getid.getInt("Id");
			}
			statement = connection.prepareStatement(UpdatePerson);
			statement.setString(1, fname);
			statement.setString(2, lname);
			statement.setString(3, address);
			statement.setString(4, city);
			statement.setString(5, state);
			statement.setInt(6, zipcode);
			statement.setInt(7, personid);
			int error = statement.executeUpdate();
			if(error == 0) {
				
			}
			statement = connection.prepareStatement(UpdateCustomer);
			statement.setString(1, email);
			statement.setString(2, creditcard);
			statement.setInt(3, accountno);
			error = statement.executeUpdate();
			
			statement = connection.prepareStatement(UpdatePreference);
			statement.setInt(1, accountno);
			statement.setString(2, preference);
			
			error = statement.executeUpdate();
			if(error == 0) {
				
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerServlet");
			dispatcher.forward(request, response); 
			
			connection.close();
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
	}
}
