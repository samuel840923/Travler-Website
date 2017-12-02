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

public class CustomerServlet extends HttpServlet{
	public static Customer cust; 
	public static final String PERSON_INFO = "SELECT * From person where Id = ?";
	public static final String CUSTOMER_INFO = "SELECT Id, CreditCardNo, Email, CreationDate, Rating FROM customer Where AccountNo = ?";
	public static final String CURRENT_BID = "SELECT NYOP, AirlineID, FlightNo FROM Auctions WHERE AccountNo = ?";
	public static final String BID_HISTORY = "Select A.NYOP, R.ResrNo, ResrDate, R.BookingFee, R.TotalFare, R.AccountNo " + 
			" From reservation R, Customer C, Auctions A " + 
			" Where C.AccountNo = R.AccountNo AND R.ResrNo=? AND A.AccountNo = C.AccountNo";
	public static final String CUSTOMER_BID = "SELECT * FROM Reservation WHERE AccountNo = ?";
	public static final String BEST_SELL = "SELECT F.*, T.total " + 
			"FROM flight F, " + 
			"	(SELECT I.AirlineID, I.FlightNo, COUNT(*) AS total " + 
			"	FROM Includes I, Reservation R " + 
			"	WHERE I.ResrNo=R.ResrNo " + 
			"	GROUP BY I.AirlineID, I.FlightNo) AS T " + 
			"where F.AirlineID = T.AirlineId and F.FlightNo = T.flightNo " + 
			"group by F.AirlineID,F.FlightNo " + 
			"order by T.total DESC";
	public static final String FLIGHT_SUGGESTION = "SELECT L.*, F.NoOfSeats, F.DaysOperating, F.MinLengthOfStay, F.MaxLengthOfStay " + 
			"FROM Flight F, Leg L " + 
			"WHERE F.FlightNo=L.FlightNo AND F.AirlineID=L.AirlineID  " + 
			"AND F.AirlineID IN ( " + 
			"	Select Ic.AirlineID " + 
			"FROM Reservation R, Includes Ic " + 
			"WHERE R.AccountNo=( " + 
			"SELECT C.AccountNo FROM Customer C WHERE C.Id = ? " + 
			") " + 
			"AND R.ResrNo=Ic.ResrNo " + 
			"AND NOW() > ( " + 
			"SELECT MAX(L.DepTime) " + 
			"  	FROM Leg L, Includes I " + 
			" WHERE I.ResrNo=R.ResrNo AND I.AirlineID=L.AirlineID AND " + 
			"I.FlightNo=L.FlightNo " + 
			")" + 
			")";
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		  {
		Connection connection;
		int Account = 102;
		SetCustomer(Account);
		List current_bid = new ArrayList();
		List bid = new ArrayList();
		List customer_bid = new ArrayList();
		List best_sell = new ArrayList();
		List flight_suggest = new ArrayList();
		String resrno = request.getParameter("resrno");
		
		try {
			connection = JDBC.getConnection();
			ResultSet currentbid = null;
			PreparedStatement stmt=connection.prepareStatement(CURRENT_BID);  
			stmt.setInt(1, Account);
			currentbid =  stmt.executeQuery();
			while(currentbid!=null&&currentbid.next()) {
				List subresult = new ArrayList();
				subresult.add(currentbid.getDouble("NYOP"));
				subresult.add(currentbid.getString("AirlineID"));
				subresult.add(currentbid.getString("FlightNo"));
				current_bid.add(subresult);
			}
			if(resrno!=null) {
				PreparedStatement stmt1=connection.prepareStatement(BID_HISTORY);  
				int rno = Integer.parseInt(resrno);
				stmt1.setInt(1,rno);
				ResultSet reserve = stmt1.executeQuery();
				while(reserve!=null && reserve.next()) {
					List subresult = new ArrayList();
					subresult.add(reserve.getLong("NYOP"));
					subresult.add(reserve.getLong("ResrNo"));
					subresult.add(reserve.getTimestamp("ResrDate"));
					subresult.add(reserve.getLong("BookingFee"));
					subresult.add(reserve.getLong("TotalFare"));
				bid.add(subresult);
				}
			}
			PreparedStatement stmt2=connection.prepareStatement(CUSTOMER_BID);  
			stmt2.setInt(1, Account);
			ResultSet cust_bid = stmt2.executeQuery();
			while(cust_bid!= null && cust_bid.next()) {
				List subresult = new ArrayList();
				subresult.add(cust_bid.getLong("ResrNo"));
				subresult.add(cust_bid.getTimestamp("ResrDate"));
				subresult.add(cust_bid.getLong("BookingFee"));
				subresult.add(cust_bid.getLong("TotalFare"));
				
			customer_bid.add(subresult);
			}
			Statement stmt3 = connection.createStatement();
			ResultSet best = stmt3.executeQuery(BEST_SELL);
			while(best!= null && best.next()) {
				List subresult = new ArrayList();
				subresult.add(best.getString("AirlineID"));
				subresult.add(best.getInt("FlightNo"));
				subresult.add(best.getInt("NoOfSeats"));
				subresult.add(best.getString("DaysOperating"));
				subresult.add(best.getInt("total"));
			best_sell.add(subresult);
			}
			PreparedStatement stmt4=connection.prepareStatement(FLIGHT_SUGGESTION);  
			stmt4.setInt(1, cust.getId());
			ResultSet suggest = stmt4.executeQuery();
			while(suggest!= null && suggest.next()) {
				List subresult = new ArrayList();
				subresult.add(suggest.getString("AirlineID"));
				subresult.add(suggest.getInt("FlightNo"));
				subresult.add(suggest.getString("DepAirportID"));
				subresult.add(suggest.getString("ArrAirportID"));
				subresult.add(suggest.getInt("NoOfSeats"));
				subresult.add(suggest.getString("DaysOperating"));
				
			flight_suggest.add(subresult);
			}
			connection.close();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(cust!=null) {
		request.setAttribute("fname",cust.getFirstName()); 
		request.setAttribute("lname",cust.getLastName()); 
		request.setAttribute("address",cust.getAddress()); 
		request.setAttribute("city",cust.getCity());
		request.setAttribute("state",cust.getState()); 
		request.setAttribute("zip", cust.getZipCode());
		request.setAttribute("credit",cust.getCreditCardNo()); 
		request.setAttribute("email",cust.getEmail()); 
		request.setAttribute("create",cust.getCreationDate()); 
		request.setAttribute("rating",cust.getRating());
		}
		request.setAttribute("currentbid",current_bid); 
		request.setAttribute("bid",bid); 
		request.setAttribute("customerbid",customer_bid); 
		request.setAttribute("bestsell",best_sell); 
		request.setAttribute("flightsuggest",flight_suggest); 
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerInfo.jsp");
	    dispatcher.forward(request, response); 
	    
		  }
	public static void SetCustomer(int AccountNumber) {
		Connection connection;
		try {
			connection = JDBC.getConnection();
			PreparedStatement stmt=connection.prepareStatement(CUSTOMER_INFO);  
			stmt.setInt(1, AccountNumber);
			int personid = 0;
			String creditcard = null;
			String email = null;
			Timestamp create = new Timestamp(0);
			int rating = 0;
			ResultSet customer = stmt.executeQuery();
			if(customer!=null && customer.next()) {
				personid = customer.getInt("Id");
				creditcard = customer.getString("CreditCardNo");
				email = customer.getString("Email");
				 create = customer.getTimestamp("CreationDate");
				rating = customer.getInt("Rating");				
			}
			PreparedStatement stmt1=connection.prepareStatement(PERSON_INFO); 
			stmt1.setInt(1, personid);
			ResultSet persons = stmt1.executeQuery();
			if(persons!= null && persons.next()) {
				String fname = persons.getString("FirstName");
				String lname = persons.getString("LastName");
				String address = persons.getString("Address");
				String city = persons.getString("City");
				String state = persons.getString("State");
				int zip = persons.getInt("ZipCode");
				cust = new Customer(personid, fname, lname, address, city, state, zip,creditcard,email,create,AccountNumber,rating);
			}
			connection.close();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			}
		
		
	}
}
