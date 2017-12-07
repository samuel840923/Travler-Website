import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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
	public static final String insertPerson = "INSERT INTO Person values(?, ?, ?, ?, ?, ?, ?);";
	public static final String insertPassenger = "INSERT INTO Passenger values(?, ?);";
	public static final String insertReservationPassenger = "INSERT INTO ReservationPassenger values(?, ?, ?, ?, ?, ?);";
	public static final String insertIncludes = "INSERT INTO Includes values(?, ?, ?, ?, ?);";
	public static final String FINDDATE = "Select l1.DepTime, l2.DepTime as D2\n" + 
			"  			 		from leg l1, leg l2 where l1.AirlineID = ? and l2.AirlineID = ? and l2.FlightNo = l1.FlightNo\n" + 
			"                    and l1.legno = ? and l1.FlightNo = ? and l2.FlightNo = ? and l2.legno = ?";
	public static final String findseat = "SELECT SeatNo FROM reservationpassenger r, includes i where r.ResrNo = i.ResrNo and i.AirlineID = ? and i.FlightNo = ? and SeatNo = ?";
	public static final String insertReservation = "INSERT INTO Reservation values(?, NOW(), ?, ?, ?, ?);";
	public static final String UpdateRating = "Update Customer Set rating = rating + 1 where accountno =? ";
	
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
		int DefaultEmployee = 123456789;
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
			if (tooLow == false) {
				int flight = Integer.parseInt(request.getParameter("flight"));
				int leg1 = Integer.parseInt(request.getParameter("leg1"));
				int leg2 = Integer.parseInt(request.getParameter("leg2"));
				String air = request.getParameter("air");
				rank = request.getParameter("class");
				double total = Double.parseDouble(request.getParameter("total"));
				double bookfee = Double.parseDouble(request.getParameter("bookfee"));
				int type = Integer.parseInt(request.getParameter("type"));
				connection = JDBC.getConnection();
				
				Random rand1 = new Random(System.nanoTime());
				int reservationNumber = rand1.nextInt(Integer.MAX_VALUE);
				
				
				
				PreparedStatement finddate = connection.prepareStatement(FINDDATE);
				finddate.setString(1, air);
				finddate.setString(2, air);
				finddate.setInt(3, leg1);
				finddate.setInt(4, flight);
				finddate.setInt(5, flight);
				finddate.setInt(6, leg2);
				ResultSet date = finddate.executeQuery();
				Timestamp depdate = new Timestamp(0);
				Timestamp depdate2 = new Timestamp(0);
				
				if(date!=null && date.next()) {
					depdate = date.getTimestamp("DepTime");	
					depdate2 = date.getTimestamp("D2");	
				}
				
				
				PreparedStatement reservation = connection.prepareStatement(insertReservation);
				
				
				
				reservation.setString(1, air);
				reservation.setInt(1, reservationNumber);
				reservation.setDouble(2, bookfee);
				reservation.setDouble(3, total);
				reservation.setInt(4, DefaultEmployee);
				reservation.setInt(5, accountNo);
				error = reservation.executeUpdate();
				if (error == 0) {
					request.setAttribute("error", "Error Inserting.");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerReserve.jsp");
					 dispatcher.forward(request, response);
					 connection.close();
					return;
				}
				PreparedStatement updaterating = connection.prepareStatement(UpdateRating);
				updaterating.setInt(1, accountNo);
				error = updaterating.executeUpdate();
				if (error == 0) {
					request.setAttribute("error", "Error Inserting.");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerReserve.jsp");
					 dispatcher.forward(request, response);
					 connection.close();
					return;
				}
				
				 reservation = connection.prepareStatement(insertIncludes);
				 reservation.setInt(1, reservationNumber);
				 reservation.setString(2, air);
				 reservation.setDouble(3, flight);
				 reservation.setInt(4, leg1);
				 reservation.setTimestamp(5, depdate);
				error = reservation.executeUpdate();
				if (error == 0) {
					request.setAttribute("error", "Error Inserting.");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerReserve.jsp");
					 dispatcher.forward(request, response);
					 connection.close();
					return;
				}
				if(leg2 != leg1) {
					 reservation = connection.prepareStatement(insertIncludes);
					 reservation.setInt(1, reservationNumber);
					 reservation.setString(2, air);
					 reservation.setDouble(3, flight);
					 reservation.setInt(4, leg2);
					 reservation.setTimestamp(5, depdate2);
					 error = reservation.executeUpdate();
						if (error == 0) {
							request.setAttribute("error", "Error Inserting.");
							RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerReserve.jsp");
							 dispatcher.forward(request, response);
							 connection.close();
							return;
						}
				}
				int reserve2=0;
				if(type==2) {
					reserve2= addReservationFlight2(request, connection, accountNo, DefaultEmployee);
				}
			int nop = Integer.parseInt(request.getParameter("nop"));
			for(int i =0;i<nop;i++) {
				Random rand = new Random(System.nanoTime());
				int id = rand.nextInt(Integer.MAX_VALUE);
				String firstName = request.getParameter("firstName"+i);
				String lastName = request.getParameter("lastName"+i);
				String address = request.getParameter("address"+i);
				String city = request.getParameter("city"+i);
				String state = request.getParameter("state"+i);
				String food = request.getParameter("food"+i);
				String seatno = request.getParameter("seat"+i);
				int zipcode = Integer.parseInt(request.getParameter("zipcode"+i));
				
				
				PreparedStatement check = connection.prepareStatement(findseat);
				check.setString(1, air);
				check.setInt(2, flight);
				check.setString(3, seatno);
				
				ResultSet ch = check.executeQuery();
				if(ch!=null&& ch.next()) {
					seatno = "Ck-in";
				}
				System.out.println(seatno);
				stmt = connection.prepareStatement(insertPerson);
				stmt.setInt(1, id);
				stmt.setString(2, firstName);
				stmt.setString(3, lastName);
				stmt.setString(4, address);
				stmt.setString(5, city);
				stmt.setString(6, state);
				stmt.setInt(7, zipcode);
				error = stmt.executeUpdate();
				if (error == 0) {
					request.setAttribute("error", "Error Inserting.");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerReserve.jsp");
					 dispatcher.forward(request, response);
					 connection.close();
					return;
				}
				PreparedStatement stmt1 = connection.prepareStatement(insertPassenger);
				stmt1.setInt(1, id);
				stmt1.setInt(2, accountNo);
				error = stmt1.executeUpdate();
				if (error == 0) {
					request.setAttribute("error", "Error Inserting.");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerReserve.jsp");
					 dispatcher.forward(request, response);
					 connection.close();
					return;
				}
				stmt = connection.prepareStatement(insertReservationPassenger);
				System.out.println(reservationNumber+ " 1st");
				stmt.setInt(1, reservationNumber);
				stmt.setInt(2,  id);
				stmt.setInt(3, accountNo);
				stmt.setString(4, seatno);
				stmt.setString(5, rank);
				stmt.setString(6, food);
				error = stmt.executeUpdate();
				if (error == 0) {
					request.setAttribute("error", "Error Inserting.");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerReserve.jsp");
					 dispatcher.forward(request, response);
					 connection.close();
					return;
				}
				if (type == 2) {
					int flight2 = Integer.parseInt(request.getParameter("flight2"));
					String air2 = request.getParameter("air2");
					String seatno2 = request.getParameter("seat2"+i);
				    check = connection.prepareStatement(findseat);
					check.setString(1, air2);
					check.setInt(2, flight2);
					check.setString(3, seatno2);
					 ch = check.executeQuery();
					if(ch!=null) {
						seatno2 = "CK-in";
					}
					
					String food2 = request.getParameter("food2"+i);
					String rank2 = request.getParameter("class2");
					System.out.println(reserve2);
					stmt = connection.prepareStatement(insertReservationPassenger);
					stmt.setInt(1, reserve2);
					stmt.setInt(2,  id);
					stmt.setInt(3, accountNo);
					stmt.setString(4, seatno2);
					stmt.setString(5, rank);
					stmt.setString(6, food2);
					error = stmt.executeUpdate();
					if (error == 0) {
						request.setAttribute("error", "Error Inserting.");
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerReserve.jsp");
						 dispatcher.forward(request, response);
						 connection.close();
						return;
					}
				}
			}
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
	
public static int addReservationFlight2(HttpServletRequest request, Connection connection,int customer,int employee) {
		
		Random rand1 = new Random(System.nanoTime());
		int reservationNumber = rand1.nextInt(Integer.MAX_VALUE);
		int flight = Integer.parseInt(request.getParameter("flight2"));
		int leg1 = Integer.parseInt(request.getParameter("leg11"));
		int leg2 = Integer.parseInt(request.getParameter("leg22"));
		String air = request.getParameter("air2");
		String rank = request.getParameter("class2");
		double total2 = Double.parseDouble(request.getParameter("total2"));
		double bookfee2 = Double.parseDouble(request.getParameter("bookfee2"));
		PreparedStatement finddate;
		
		try {
			finddate = connection.prepareStatement(FINDDATE);
			finddate.setString(1, air);
			finddate.setString(2, air);
			finddate.setInt(3, leg1);
			finddate.setInt(4, flight);
			finddate.setInt(5, flight);
			finddate.setInt(6, leg2);
			ResultSet date = finddate.executeQuery();
			Timestamp depdate = new Timestamp(0);
			Timestamp depdate2 = new Timestamp(0);
			
			if(date!=null && date.next()) {
				depdate = date.getTimestamp("DepTime");	
				depdate2 = date.getTimestamp("D2");	
			}
				PreparedStatement reservation = connection.prepareStatement(insertReservation);
			reservation.setString(1, air);
			reservation.setInt(1, reservationNumber);
			reservation.setDouble(2, bookfee2);
			reservation.setDouble(3, total2);
			reservation.setInt(4, employee);
			reservation.setInt(5, customer);
			int error = reservation.executeUpdate();
			if (error == 0) {
				//handle error by loading error
			}
			PreparedStatement updaterating = connection.prepareStatement(UpdateRating);
			updaterating.setInt(1, customer);
			error = updaterating.executeUpdate();
			if (error == 0) {
				//handle error by loading error
			}
			 reservation = connection.prepareStatement(insertIncludes);
			 reservation.setInt(1, reservationNumber);
			 reservation.setString(2, air);
			 reservation.setDouble(3, flight);
			 reservation.setInt(4, leg1);
			 reservation.setTimestamp(5, depdate);
			 error = reservation.executeUpdate();
			if (error == 0) {
				//handle error by loading error
			}
			if(leg2 != leg1) {
				 reservation = connection.prepareStatement(insertIncludes);
				 reservation.setInt(1,  reservationNumber);
				 reservation.setString(2, air);
				 reservation.setDouble(3, flight);
				 reservation.setInt(4, leg2);
				 reservation.setTimestamp(5, depdate2);
				 error = reservation.executeUpdate();
					if (error == 0) {
						//handle error by loading error
					}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
		return reservationNumber;
	}
}
