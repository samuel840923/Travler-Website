import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuctionServlet extends HttpServlet{
	public static final String getHiddenFare = "SELECT F.HiddenFare FROM Fare F, Leg L, Flight Fl "
			+ "WHERE F.AirlineID=? AND F.FlightNo=? AND L.AirlineID=F.AirlineID AND L.FlightNo=F.FlightNo AND F.Class=? "
			//+ "AND Fl.AirlineID=F.AirlineID AND Fl.FlightNo=F.FlightNo AND Fl.NoOfSeats > 0;";
			+ "AND L.DepTime > NOW() AND Fl.AirlineID=F.AirlineID AND Fl.FlightNo=F.FlightNo AND Fl.NoOfSeats > 0;";
	public static final String insertAuction = "INSERT INTO AUCTIONS values(?, ?, ?, ?, NOW(), ?, ?);";
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("accountNo") ==  null) {
			response.sendRedirect("/cse305web/login");
		    return;
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Auction.jsp");
	    dispatcher.forward(request, response); 
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("accountNo") ==  null) {
			response.sendRedirect("/cse305web/login");
		    return;
		}
		int accountNo = (int)session.getAttribute("accountNo");
		int error = 0;
		List fares = new ArrayList();
		boolean tooLow = true;
		
		try {
			String airlineId = request.getParameter("airlineId");
			int flightNumber = Integer.parseInt(request.getParameter("flightNumber"));
			String rank = request.getParameter("class");
			double nyop = Double.parseDouble(request.getParameter("nyop"));
			connection = JDBC.getConnection();
			PreparedStatement stmt = connection.prepareStatement(getHiddenFare);
			ResultSet data = null;
			stmt.setString(1, airlineId);
			stmt.setInt(2, flightNumber);
			stmt.setString(3, rank);
			data = stmt.executeQuery();
			while(data !=null && data.next()) {
				List fare = new ArrayList();
				if (data.getDouble("HiddenFare") >= nyop) {
					fare.add(data.getDouble("HiddenFare"));
					fares.add(fare);
					tooLow = false;
				}
			}
			if (fares.size() == 0) {
				//handle error by loading error
				//Flight does not exist
				request.setAttribute("error", "Flight does not exist.");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Auction.jsp");
			    dispatcher.forward(request, response);
			    return;
			}
			stmt = connection.prepareStatement(insertAuction);
			stmt.setInt(1, accountNo);
			stmt.setString(2, airlineId);
			stmt.setInt(3,  flightNumber);
			stmt.setString(4, rank);
			stmt.setDouble(5, nyop);
			stmt.setBoolean(6, tooLow);
			error = stmt.executeUpdate();
			if (error == 0) {
				//handle error by loading error
				request.setAttribute("error", "Auction already exists.");
			}
			connection.close();
		} 
		catch (ClassNotFoundException | NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Auction.jsp");
		    dispatcher.forward(request, response);
		    return;
		}
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Auction.jsp");
	    dispatcher.forward(request, response); 
	}
}
