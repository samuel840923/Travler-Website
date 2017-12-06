import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ManagerEditServlet extends HttpServlet{
	public static final String ADD_PER = "Insert into Person values(?, ?, ?, ?, ?, ?, ?);\n";
	
	public static final String ADD_EMP = "Insert into Employee values(?, ?, ?, ?, ?, ?);\n";
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Connection connection;
		String id = request.getParameter("id");
		String first = request.getParameter("first");
		String last = request.getParameter("last");
		String add = request.getParameter("add");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zip = request.getParameter("zip");
		
		String SSN = request.getParameter("SSN");
		String isM = request.getParameter("isM");
		String start = request.getParameter("start");
		String hourly = request.getParameter("hourly");
		
		List ok = new ArrayList();
		
		
		
		try 
		{
			connection = JDBC.getConnection();
			PreparedStatement stmt = connection.prepareStatement(ADD_PER);
			PreparedStatement stmt2 = connection.prepareStatement(ADD_EMP);
			
			
			int Id = 0;
			if (id!=null)
				Id = Integer.parseInt(id);
			if (first==null)
				first = "";

			if (last==null)
				last = "";
			
			if (add==null)
				add = "";
			
			if (city==null)
				city = "";
			
			if (state==null)
				state = "";
			
			int code = 0;
			if (zip!=null)
				code = Integer.parseInt(zip);
			
			int SSn = 0;
			if (SSN!=null)
				SSn = Integer.parseInt(SSN); 
			
			int IsM = 0;
			if (isM=="1")
				IsM = 1; 

			DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
			Date startD = df.parse(start);
			java.sql.Date sql = new java.sql.Date(startD.getTime());

			double hour = 0.0;
			if (hourly!=null)
				hour = Double.parseDouble(hourly); 
			
			stmt.setInt(1, Id);
			stmt.setString(2, first);
			stmt.setString(3, last);
			stmt.setString(4, add);
			stmt.setString(5, city);
			stmt.setString(6, state);
			stmt.setInt(7, code);
			stmt2.setInt(1, Id);
			stmt2.setInt(2, SSn);
			stmt2.setInt(3, IsM);
			stmt2.setDate(4, sql);
			stmt2.setDouble(5, hour);
			stmt2.setString(6, "");
			
			int reserve = stmt.executeUpdate();
			int reserve2 = stmt2.executeUpdate();
			
			if(reserve!=100) 
			{
				List subresult = new ArrayList();
				subresult.add(reserve);
				ok.add(subresult);
			}
			connection.close();
			
			
			
		} 
		catch (ClassNotFoundException | SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("ok", ok);
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ManagerEdit.jsp");
	    dispatcher.forward(request, response); 
	    
	}
}
