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


public class ReservationListServlet extends HttpServlet{
	public static final String getreservation= "select * from reservation where AccountNo = ?";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession(false);
			if (session == null || session.getAttribute("accountNo") ==  null) {
				response.sendRedirect("/cse305web/login");
			    return;
			}
			int accountNo = (int)session.getAttribute("accountNo");
			Connection connection = JDBC.getConnection();
			int accountno = accountNo;
			PreparedStatement find = connection.prepareStatement(getreservation);
			find.setInt(1, accountno);
			ResultSet re = find.executeQuery();
			List result = new ArrayList();
			while(re!=null && re.next()) {
				List sub = new ArrayList();
				sub.add(re.getInt("ResrNo"));
				sub.add(re.getTimestamp("ResrDate"));
				sub.add(re.getDouble("BookingFee"));
				sub.add(re.getDouble("TotalFare"));
				sub.add(re.getInt("RepSSN"));
			result.add(sub);
			}
			request.setAttribute("reservation", result);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerReservationDetail.jsp");
			dispatcher.forward(request, response); 
			connection.close();
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
		
	}
}
