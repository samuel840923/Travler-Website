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
	
	public static final String ADD_CUS = "Insert into Customer values(?,?,?,?,?,?,?);\n";
	
	
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
		
		String accountN = request.getParameter("accountno");
		String creditC = request.getParameter("credit");
		String Email = request.getParameter("email");
		String creatD = request.getParameter("creation");
		String Rating = request.getParameter("rate");
		String Pass = request.getParameter("pass");
		
		List ok = new ArrayList();
		
		
		
		try 
		{
			connection = JDBC.getConnection();
			PreparedStatement stmt = connection.prepareStatement(ADD_PER);
			PreparedStatement stmt2 = connection.prepareStatement(ADD_EMP);
			PreparedStatement stmt3 = connection.prepareStatement(ADD_CUS);
			
			
			int Id = -1;
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
			
			int SSn = -1;
			if (SSN!=null)
				SSn = Integer.parseInt(SSN); 
			
			
			java.sql.Date sql=null;
			if (start !=null)
			{
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
				Date startD = df.parse(start);
				sql = new java.sql.Date(startD.getTime());
			}
			
			

			double hour = 0.0;
			if (hourly!=null)
				hour = Double.parseDouble(hourly); 
			
			//customer
			int account = -1;
			if (accountN!=null)
			{
				account = Integer.parseInt(accountN);
			}
			
			if (creditC==null)
				creditC = "";
			
			if (Email==null)
				Email = "";
			
			java.sql.Date sql2=null;
			if (creatD !=null)
			{
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
				Date startD = df.parse(creatD);
				sql2 = new java.sql.Date(startD.getTime());
			}
			
			int rate = 0;
			if (Rating!=null)
			{
				rate = Integer.parseInt(Rating);
			}
			
			if (Pass==null)
			{
				Pass = "";
			}
			
			if (Id!=-1 && SSn != -1)//add employee
			{
				stmt.setInt(1, Id);
				stmt.setString(2, first);
				stmt.setString(3, last);
				stmt.setString(4, add);
				stmt.setString(5, city);
				stmt.setString(6, state);
				stmt.setInt(7, code);
				stmt2.setInt(1, Id);
				stmt2.setInt(2, SSn);
				stmt2.setString(3, isM);
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
			}
			if (Id!=-1 && account!=-1)//add customer
			{
				stmt.setInt(1, Id);
				stmt.setString(2, first);
				stmt.setString(3, last);
				stmt.setString(4, add);
				stmt.setString(5, city);
				stmt.setString(6, state);
				stmt.setInt(7, code);
				stmt3.setInt(1, Id);
				stmt3.setInt(2, account);
				stmt3.setString(3, creditC);
				stmt3.setString(4, Email);
				stmt3.setDate(5, sql2);
				stmt3.setInt(6, rate);
				stmt3.setString(7, Pass);
				
				int reserve = stmt.executeUpdate();
				int reserve2 = stmt3.executeUpdate();
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
