import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteReservationServlet extends HttpServlet{
	public static final String deleteIncludes = "DELETE FROM Includes WHERE ResrNo=?;";
	public static final String deleteReservationPassenger = "DELETE FROM ReservationPassenger WHERE ResrNo=?;";
	public static final String deleteReservation = "DELETE FROM Reservation WHERE ResrNo=?;";
	public static final String UpdateRating = "Update Customer Set rating = rating - 1 where accountno =? ";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
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
			int accountno= Integer.parseInt(account.getValue());
			 connection = JDBC.getConnection();
			int reserno = Integer.parseInt(request.getParameter("reserveno"));
			PreparedStatement delete = connection.prepareStatement(deleteIncludes);
			delete.setInt(1, reserno);
			int error = delete.executeUpdate();
			if(error ==0) {
				request.setAttribute("error", "Error Delete.");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerServlet");
				 dispatcher.forward(request, response);
				 connection.close();
				return;
			}
			 delete = connection.prepareStatement(deleteReservationPassenger);
			 delete.setInt(1, reserno);
			 error = delete.executeUpdate();
			 if(error ==0) {
				 request.setAttribute("error", "Error Delete.");
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerServlet");
					 dispatcher.forward(request, response);
					 connection.close();
					return;
				}
			 delete = connection.prepareStatement(deleteReservation);
			 delete.setInt(1, reserno);
			 error = delete.executeUpdate();
			 if(error ==0) {
				 request.setAttribute("error", "Error Delete.");
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerServlet");
					 dispatcher.forward(request, response);
					 connection.close();
					return;
				}
			 PreparedStatement updaterating = connection.prepareStatement(UpdateRating);
				updaterating.setInt(1, accountno);
				error = updaterating.executeUpdate();
				if (error == 0) {
					request.setAttribute("error", "Error Delete.");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerServlet");
					 dispatcher.forward(request, response);
					 connection.close();
					return;
				}
			 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ReservationListServlet");
			dispatcher.forward(request, response); 
			connection.close();
			} catch (ClassNotFoundException | SQLException e) {
				 request.setAttribute("error", "Error Delete.");
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerServlet");
					 dispatcher.forward(request, response);
					 try {
						connection.close();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					return;
		}
	}
}
