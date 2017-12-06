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

public class ManagerServlet extends HttpServlet{
	public static final String MONTH_SALES = "Select Month(ResrDate) ,SUM(TotalFare) \n" + 
			"	From reservation\n" + 
			"	Where Month(ResrDate) = ?\n" + 
			"	Group By Month(ResrDate);\n";
	public static final String SHOW_LEG = "SELECT *\n" + 
			"	FROM leg\n";
	public static final String RESR_FLIGHTNO = "SELECT I.FlightNo, R.ResrNo,R.ResrDate,R.BookingFee,R.TotalFare,  \n" + 
			"R.RepSSN,R.AccountNo\n" + 
			"From includes I , reservation R\n" + 
			"Where I.ResrNo = R.ResrNo AND I.FlightNo=?\n" + 
			"Group by R.ResrNo\n";
	public static final String RESR_NAME = "Select P.FirstName, P. LastName, R.ResrNo,R.ResrDate,R.BookingFee,R.TotalFare,  \n" + 
			"R.RepSSN,R.AccountNo \n" + 
			"From Person P, reservation R, customer C\n" + 
			"Where C.Id = P.Id And C.AccountNo = R.AccountNo AND P.FirstName=? AND P.LastName=?\n";
	public static final String REV_CUS = "Select AccountNo, SUM(TotalFare)\n" + 
			"From reservation\n" + 
			"Where AccountNo = ?\n" + 
			"Group By(AccountNo)\n";
	
	public static final String REV_FL = "Select  I.AirlineID, I.FlightNo, SUM(R.TotalFare)\n" + 
			"from includes I, reservation R\n" + 
			"where R.ResrNo = I.ResrNo and I.LegNo = 1 AND I.AirlineID=? AND I.FlightNo=?\n" + 
			"Group by I.AirlineID, I.FlightNo\n";
	
	public static final String REV_ARR = "SELECT A.Name, SUM(R.TotalFare)\n" + 
			"	FROM Airport A, Reservation R, Includes I, Leg L\n" + 
			"WHERE L.ArrAirportId = A.Id and L.AirlineId = I.AirlineId and L.FlightNo = I.FlightNo and R.ResrNo = I.ResrNo and L.ArrAirportId = ? and L.legNo = I.LegNo\n";
	
	public static final String MOST_REP = "SELECT CONCAT(P.FirstName, ' ', P.LastName) AS 'Customer Representative', Revenue.MaxTotalRevenue AS 'Most Total Revenue'\n" + 
			"FROM ( \n" + 
			"	SELECT Rev.RepSSN AS RepSSN, MAX(Rev.TotalRevenue) AS \n" + 
			"MaxTotalRevenue\n" + 
			"      	FROM (\n" + 
			"		SELECT R.RepSSN,  SUM(R.TotalFare) As TotalRevenue\n" + 
			"		FROM Reservation R\n" + 
			"		GROUP BY R.RepSSN\n" + 
			"		) Rev\n" + 
			"	GROUP BY Rev.RepSSN\n" + 
			"	) Revenue, Person P, Employee E\n" + 
			"WHERE P.Id=E.Id AND E.SSN=Revenue.RepSSN;\n";
	
	public static final String MOST_CUS = "SELECT P.FirstName, P.LastName, C.AccountNo, MAX(TR.BookingFee)\n" + 
			"FROM Customer C, Person P, TotalRevenue TR\n" + 
			"WHERE C.AccountNo = (\n" + 
			"SELECT AccountNo FROM TotalRevenue\n" + 
			"  WHERE BookingFee IN (\n" + 
			"    SELECT MAX(BookingFee)\n" + 
			"    FROM TotalRevenue\n" + 
			"  )\n" + 
			")\n" + 
			"and P.Id = C.Id;";
	public static final String MOST_FL = "Select AirlineID, FlightNo , count(*) AS 'Number Of Flights'\n" + 
			"from leg\n" + 
			"group by AirlineID, FlightNo\n" + 
			"having count(*) = \n" + 
			"(Select  max(total)\n" + 
			"From (select count(*) as total\n" + 
			"from leg\n" + 
			"group by AirlineID, FlightNo\n" + 
			") as t)\n";
	
	public static final String CUS_RESR = "Select R.AccountNo, I.FlightNo, I.AirlineID\n" + 
			"From  includes I, Leg L , reservation R\n" + 
			"Where I.ResrNo = R.ResrNo and I.FlightNo = L.FlightNo and\n" + 
			"I.AirlineID  = L.AirlineID and I.AirlineID =? and I.FlightNo=?\n" + 
			"Group by R.AccountNo\n" + 
			"	Order BY L.AirlineID , L.FlightNo\n";
	
	public static final String FL_AIR = "SELECT A.Name AS 'Airport', L.*, F.NoOfSeats, F.DaysOperating, F.MinLengthOfStay, F.MaxLengthOfStay\n" + 
			"FROM Flight F, Leg L, Airport A\n" + 
			"WHERE F.FlightNo=L.FlightNo AND F.AirlineID=L.AirlineID \n" + 
			"AND (L.DepAirportID=A.Id OR L.ArrAirportID=A.Id)\n" + 
			"AND A.Name=?;\n";
	
	public static final String ON_TIME="(SELECT L.*, F.NoOfSeats, F.DaysOperating, F.MinLengthOfStay, F.MaxLengthOfStay\n" + 
			"	FROM Flight F, Leg L, Airport A\n" + 
			"	WHERE F.FlightNo=L.FlightNo AND F.AirlineID=L.AirlineID \n" + 
			"	AND L.CurrArrTime>=L.ArrTime)\n" + 
			"	UNION\n" + 
			"(SELECT L.*, F.NoOfSeats, F.DaysOperating, F.MinLengthOfStay, F.MaxLengthOfStay\n" + 
			"	FROM Flight F, Leg L, Airport A\n" + 
			"	WHERE F.FlightNo=L.FlightNo AND F.AirlineID=L.AirlineID \n" + 
			"	AND L.CurrDepTime>=L.DepTime);\n";

	
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Connection connection;
		List monSales = new ArrayList();
		List leg = new ArrayList();
		List FN = new ArrayList();
		List N = new ArrayList();
		List revC = new ArrayList();
		List revF = new ArrayList();
		List revA = new ArrayList();
		List mostRep = new ArrayList();
		List mostCus = new ArrayList();
		List mostFl = new ArrayList();
		String Month = request.getParameter("Month");
		String flightno = request.getParameter("FlightNo");
		String firstN = request.getParameter("firstN");
		String lastN = request.getParameter("lastN");
		String accN = request.getParameter("accN");
		String airlineid = request.getParameter("airline");
		String flightnoR = request.getParameter("FlightNoR");
		String arrCity = request.getParameter("arrCity");
		
		List cusSeat = new ArrayList();
		String airlineidC = request.getParameter("airlineidC");
		String flightnoC = request.getParameter("flightnoC");
		
		List airport = new ArrayList();
		String airportName = request.getParameter("airportN");
		
		List ontime = new ArrayList();
		
		try 
		{
			connection = JDBC.getConnection();
			PreparedStatement stmt = connection.prepareStatement(MONTH_SALES);
			int mon = 0;
			if (Month==null)
			{
				mon = 13;
			}
			else
				mon = Integer.parseInt(Month);
			
			stmt.setInt(1, mon);
			ResultSet reserve = stmt.executeQuery();
			while(reserve!=null && reserve.next()) 
			{
				List subresult = new ArrayList();
				subresult.add(reserve.getLong("Month(ResrDate)"));
				subresult.add(reserve.getLong("SUM(TotalFare)"));
				monSales.add(subresult);
			}
			PreparedStatement stmt2 = connection.prepareStatement(SHOW_LEG);
			reserve = stmt2.executeQuery();
			while(reserve!=null && reserve.next()) 
			{
				List subresult = new ArrayList();
				subresult.add(reserve.getString("AirlineID"));
				subresult.add(reserve.getLong("FlightNo"));
				subresult.add(reserve.getLong("LegNo"));
				subresult.add(reserve.getString("DepAirportID"));
				subresult.add(reserve.getString("ArrAirportID"));
				subresult.add(reserve.getString("ArrTime"));
				subresult.add(reserve.getString("DepTime"));
				subresult.add(reserve.getString("CurrArrTime"));
				subresult.add(reserve.getString("CurrDepTime"));
				leg.add(subresult);
			}
			int flightNo = 0;
			if (flightno==null)
			{
				flightNo = 0;
			}
			else
				flightNo = Integer.parseInt(flightno);
			
			PreparedStatement stmt3 = connection.prepareStatement(RESR_FLIGHTNO);
			stmt3.setInt(1, flightNo);
			reserve = stmt3.executeQuery();
			while(reserve!=null && reserve.next()) 
			{
				List subresult = new ArrayList();
				subresult.add(reserve.getLong("FlightNo"));
				subresult.add(reserve.getLong("ResrNo"));
				subresult.add(reserve.getString("ResrDate"));
				subresult.add(reserve.getLong("BookingFee"));
				subresult.add(reserve.getLong("TotalFare"));
				subresult.add(reserve.getString("RepSSN"));
				subresult.add(reserve.getString("AccountNo"));
				FN.add(subresult);
			}
			
			PreparedStatement stmt4 = connection.prepareStatement(RESR_NAME);
			if (firstN==null)
				firstN = "";
			if (lastN==null)
				lastN = "";
			stmt4.setString(1, firstN);
			stmt4.setString(2, lastN);
			reserve = stmt4.executeQuery();
			while(reserve!=null && reserve.next()) 
			{
				List subresult = new ArrayList();
				subresult.add(reserve.getString("FirstName"));
				subresult.add(reserve.getString("LastName"));
				subresult.add(reserve.getString("ResrNo"));
				subresult.add(reserve.getString("ResrDate"));
				subresult.add(reserve.getString("BookingFee"));
				subresult.add(reserve.getString("TotalFare"));
				subresult.add(reserve.getString("RepSSN"));
				subresult.add(reserve.getString("AccountNo"));
				N.add(subresult);
			}
			
			PreparedStatement stmt5 = connection.prepareStatement(REV_CUS);
			int acc = 0;
			if (accN!=null)
				acc = Integer.parseInt(accN);
				
			stmt5.setInt(1, acc);
			reserve = stmt5.executeQuery();
			while(reserve!=null && reserve.next()) 
			{
				List subresult = new ArrayList();
				subresult.add(reserve.getString("AccountNo"));
				subresult.add(reserve.getString("SUM(TotalFare)"));
				revC.add(subresult);
			}
			
			PreparedStatement stmt6 = connection.prepareStatement(REV_FL);
			int fnr = 0;
			if (flightnoR!=null)
				fnr = Integer.parseInt(flightnoR);
			if (airlineid==null)
				airlineid = "";
				
			stmt6.setString(1, airlineid);
			stmt6.setInt(2, fnr);
			reserve = stmt6.executeQuery();
			while(reserve!=null && reserve.next()) 
			{
				List subresult = new ArrayList();
				subresult.add(reserve.getString("AirlineID"));
				subresult.add(reserve.getString("FlightNo"));
				subresult.add(reserve.getString("SUM(R.TotalFare)"));
				revF.add(subresult);
			}
			
			//revenue by aiport
			PreparedStatement stmt7 = connection.prepareStatement(REV_ARR);
			
			if (arrCity==null)
				arrCity = "";
				
			stmt7.setString(1, arrCity);
			reserve = stmt7.executeQuery();
			while(reserve!=null && reserve.next()) 
			{
				List subresult = new ArrayList();
				subresult.add(reserve.getString("Name"));
				subresult.add(reserve.getString("SUM(R.TotalFare)"));
				revA.add(subresult);
			}
			
			//most revenue rep
			PreparedStatement stmt8 = connection.prepareStatement(MOST_REP);
			reserve = stmt8.executeQuery();
			while(reserve!=null && reserve.next()) 
			{
				List subresult = new ArrayList();
				subresult.add(reserve.getString("Customer Representative"));
				subresult.add(reserve.getString("Most Total Revenue"));
				mostRep.add(subresult);
			}
			
			//most revenue customer
			PreparedStatement stmt9 = connection.prepareStatement(MOST_CUS);
			reserve = stmt9.executeQuery();
			while(reserve!=null && reserve.next()) 
			{
				List subresult = new ArrayList();
				subresult.add(reserve.getString("FirstName"));
				subresult.add(reserve.getString("LastName"));
				mostCus.add(subresult);
			}
			
			//most active flights
			PreparedStatement stmt10 = connection.prepareStatement(MOST_FL);
			reserve = stmt10.executeQuery();
			while(reserve!=null && reserve.next()) 
			{
				List subresult = new ArrayList();
				subresult.add(reserve.getString("AirlineID"));
				subresult.add(reserve.getString("FlightNo"));
				subresult.add(reserve.getString("Number Of Flights"));
				mostFl.add(subresult);
			}
			
			PreparedStatement stmt11 = connection.prepareStatement(CUS_RESR);
			int flightnoc = 0;
			if (flightnoC!=null)
				flightnoc = Integer.parseInt(flightnoC);
			if (airlineidC==null)
				airlineidC = "";
			
			stmt11.setString(1,airlineidC);
			stmt11.setInt(2, flightnoc);
			reserve = stmt11.executeQuery();
			while(reserve!=null && reserve.next()) 
			{
				List subresult = new ArrayList();
				subresult.add(reserve.getString("AccountNo"));
				subresult.add(reserve.getString("FlightNo"));
				subresult.add(reserve.getString("AirlineID"));
				cusSeat.add(subresult);
			}
			
			PreparedStatement stmt12 = connection.prepareStatement(FL_AIR);
			
			if (airportName==null)
				airportName = "";
			
			stmt12.setString(1,airportName);
			reserve = stmt12.executeQuery();
			while(reserve!=null && reserve.next()) 
			{
				List subresult = new ArrayList();
				subresult.add(reserve.getString("Airport"));
				subresult.add(reserve.getString("AirlineID"));
				subresult.add(reserve.getString("FlightNo"));
				subresult.add(reserve.getString("LegNo"));
				subresult.add(reserve.getString("DepAirportID"));
				subresult.add(reserve.getString("ArrAirportID"));
				subresult.add(reserve.getString("ArrTime"));
				subresult.add(reserve.getString("DepTime"));
				subresult.add(reserve.getString("NoOfSeats"));
				subresult.add(reserve.getString("DaysOperating"));
				subresult.add(reserve.getString("MinLengthOfStay"));
				subresult.add(reserve.getString("MaxLengthOfStay"));
				airport.add(subresult);
			}
			
			PreparedStatement stmt13 = connection.prepareStatement(ON_TIME);
			
			reserve = stmt13.executeQuery();
			while(reserve!=null && reserve.next()) 
			{
				List subresult = new ArrayList();
				subresult.add(reserve.getString("AirlineID"));
				subresult.add(reserve.getString("FlightNo"));
				subresult.add(reserve.getString("LegNo"));
				subresult.add(reserve.getString("DepAirportID"));
				subresult.add(reserve.getString("ArrAirportID"));
				subresult.add(reserve.getString("ArrTime"));
				subresult.add(reserve.getString("DepTime"));
				subresult.add(reserve.getString("CurrArrTime"));
				subresult.add(reserve.getString("CurrDepTime"));
				subresult.add(reserve.getString("NoOfSeats"));
				subresult.add(reserve.getString("DaysOperating"));
				subresult.add(reserve.getString("MinLengthOfStay"));
				subresult.add(reserve.getString("MaxLengthOfStay"));
				ontime.add(subresult);
			}
			
			
			
			connection.close();
			
			
			
		} 
		catch (ClassNotFoundException | SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("monSales",monSales); 
		request.setAttribute("legs", leg);
		request.setAttribute("flightNo",FN);
		request.setAttribute("names", N);
		request.setAttribute("revC", revC);
		request.setAttribute("revF", revF);
		request.setAttribute("revA", revA);
		request.setAttribute("mostRep", mostRep);
		request.setAttribute("mostCus", mostCus);
		request.setAttribute("mostFl", mostFl);
		request.setAttribute("cusSeat", cusSeat);
		request.setAttribute("airport", airport);
		request.setAttribute("ontime", ontime);
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Manager.jsp");
	    dispatcher.forward(request, response); 
	    
	}
}
