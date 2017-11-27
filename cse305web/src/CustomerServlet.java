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
	public static final String CURRENT_BID = "SELECT NYOP FROM Auctions WHERE AccountNo = ?";
	public static final String BID_HISTORY = "Select A.NYOP, R.ResrNo, ResrDate, R.BookingFee, R.TotalFare" + " R.AccountNo " + 
			"From reservation R, Customer C, Auctions A " + 
			"Where C.AccountNo = R.AccountNo AND R.ResrNo=? AND A.AccountNo = C.AccountNo";
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
			"WHERE F.FlightNo=L.FlightNo AND F.AirlineID=L.AirlineID AND L.CurrArrTime>NOW() AND L.CurrDepTime>NOW() " + 
			"AND F.AirlineID IN ( " + 
			"	Select Ic.AirlineID " + 
			"FROM Reservation R, Includes Ic " + 
			"WHERE R.AccountNo=( " + 
			"SELECT C.AccountNo FROM Customer C WHERE C.Id=? " + 
			") " + 
			"AND R.ResrNo=Ic.ResrNo " + 
			"AND NOW() > ( " + 
			"SELECT MAX(L.DepTime) " + 
			"  	FROM Leg L, Includes I " + 
			"  	WHERE I.ResrNo=R.ResrNo AND I.AirlineID=L.AirlineID AND " + 
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
		
		try {
			connection = JDBC.getConnection();
			
			ResultSet currentbid = null;
			PreparedStatement stmt=connection.prepareStatement(CURRENT_BID);  
			stmt.setInt(1, Account);
			currentbid =  stmt.executeQuery();
			while(currentbid!=null&&currentbid.next()) {
				List subresult = new ArrayList();
				subresult.add(currentbid.getLong("NYOP"));
				current_bid.add(subresult);
			}
			
			
			
			
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
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			}
		
		
	}
}
