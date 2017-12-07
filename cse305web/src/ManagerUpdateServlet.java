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
import javax.servlet.http.HttpSession;


public class ManagerUpdateServlet extends HttpServlet{
	
	
	public static final String UPDATE_EMP_ISM = "UPDATE Employee SET IsManager=? WHERE Id=?; \n";

	public static final String UPDATE_EMP_START = "UPDATE Employee SET StartDate=? WHERE Id=?; \n";
	
	public static final String UPDATE_EMP_RATE = "UPDATE Employee SET HourlyRate=? WHERE Id=?; \n";
	
	public static final String UPDATE_CUS_CREDIT = "UPDATE Customer SET CreditCardNo=? WHERE Id=?; \n";
	
	public static final String UPDATE_CUS_EMAIL = "UPDATE Customer SET Email=? WHERE Id=?; \n";
	
	public static final String UPDATE_CUS_RATE = "UPDATE Customer SET Rating=? WHERE Id=?; \n";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("id") ==  null || ((String)session.getAttribute("isManager")).equalsIgnoreCase("False")) {
			response.sendRedirect("/cse305web/login");
		    return;
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ManagerUpdate.jsp");
	    dispatcher.forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Connection connection;
		
		String id = request.getParameter("id");
		String isM = request.getParameter("isM");
		String id2 = request.getParameter("id2");
		String start = request.getParameter("start");
		String id3 = request.getParameter("id3");
		String rate = request.getParameter("rate");
		
		String id4 = request.getParameter("id4");
		String id5 = request.getParameter("id5");
		String id6 = request.getParameter("id6");
		
		List ok = new ArrayList();
		
		try 
		{
			connection = JDBC.getConnection();
			PreparedStatement stmt = connection.prepareStatement(UPDATE_EMP_ISM);
			
			
			int Id = -1;
			if (id!=null)
				Id = Integer.parseInt(id);
			
			if (isM!=null)
				if (!isM.equals("1"))
					isM = "0";
			
			if (Id!=-1)
			{
				stmt.setInt(2, Id);
				stmt.setString(1, isM);
				
				int reserve = stmt.executeUpdate();

				if(reserve!=100) 
				{
					List subresult = new ArrayList();
					subresult.add(reserve);
					ok.add(subresult);
				}
			}
			
			stmt = connection.prepareStatement(UPDATE_EMP_START);
			Id = -1;
			if (id2!=null)
				Id = Integer.parseInt(id2);
			
			
			
			if (Id!=-1)
			{
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
				Date startD = df.parse(start);
				java.sql.Date sql = new java.sql.Date(startD.getTime());
				stmt.setInt(2, Id);
				stmt.setDate(1, sql);
				
				int error = stmt.executeUpdate();
				
				if(error!=100) 
				{
					List subresult = new ArrayList();
					subresult.add(error);
					ok.add(subresult);
				}
			}
			
			stmt = connection.prepareStatement(UPDATE_EMP_RATE);
			
			
			
			Id = -1;
			if (id3!=null)
				Id = Integer.parseInt(id3);
			
			
			if (Id!=-1)
			{
				double h = 0.0;
				if (rate!=null)
					h = Double.parseDouble(rate);
				stmt.setInt(2, Id);
				stmt.setDouble(1, h);
				
				int error = stmt.executeUpdate();
				
				if(error!=100) 
				{
					List subresult = new ArrayList();
					subresult.add(error);
					ok.add(subresult);
				}
			}
			
			
			stmt = connection.prepareStatement(UPDATE_CUS_CREDIT);
			Id = -1;
			if (id4!=null)
				Id = Integer.parseInt(id4);
			
			
			if (Id!=-1)
			{
				String credit = request.getParameter("credit");
				 if (credit==null)
					credit = "";
				stmt.setInt(2, Id);
				stmt.setString(1, credit);
				
				int error = stmt.executeUpdate();
				
				if(error!=100) 
				{
					List subresult = new ArrayList();
					subresult.add(error);
					ok.add(subresult);
				}
			}
			
			stmt = connection.prepareStatement(UPDATE_CUS_EMAIL);
			Id = -1;
			if (id5!=null)
				Id = Integer.parseInt(id5);
			
			
			if (Id!=-1)
			{
				String email = request.getParameter("email");
				 if (email==null)
					email = "";
				stmt.setInt(2, Id);
				stmt.setString(1, email);
				
				int error = stmt.executeUpdate();
				
				if(error!=100) 
				{
					List subresult = new ArrayList();
					subresult.add(error);
					ok.add(subresult);
				}
			}
			
			stmt = connection.prepareStatement(UPDATE_CUS_RATE);
			Id = -1;
			if (id6!=null)
				Id = Integer.parseInt(id6);
			
			
			if (Id!=-1)
			{
				String rateC = request.getParameter("rateC");
				int r=-1;
				 if (rateC!=null)
					r = Integer.parseInt(rateC);
				stmt.setInt(2, Id);
				stmt.setInt(1, r);
				
				int error = stmt.executeUpdate();
				
				if(error!=100) 
				{
					List subresult = new ArrayList();
					subresult.add(error);
					ok.add(subresult);
				}
			}
			
			
			
			connection.close();
			
			
			
		} 
		catch (ClassNotFoundException | SQLException | NullPointerException | NumberFormatException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
		request.setAttribute("ok", ok);
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ManagerUpdate.jsp");
	    dispatcher.forward(request, response); 
	    
	}
}
