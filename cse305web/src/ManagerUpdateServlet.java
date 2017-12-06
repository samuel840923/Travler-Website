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


public class ManagerUpdateServlet extends HttpServlet{
	
	
	public static final String UPDATE_EMP_ISM = "UPDATE Employee SET IsManager=? WHERE Id=?; \n";

	public static final String UPDATE_EMP_START = "UPDATE Employee SET StartDate=? WHERE Id=?; \n";
	
	public static final String UPDATE_EMP_RATE = "UPDATE Employee SET HourlyRate=? WHERE Id=?; \n";
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Connection connection;
		
		String id = request.getParameter("id");
		String isM = request.getParameter("isM");
		String id2 = request.getParameter("id2");
		String start = request.getParameter("start");
		String id3 = request.getParameter("id3");
		String rate = request.getParameter("rate");
		
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
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ManagerUpdate.jsp");
	    dispatcher.forward(request, response); 
	    
	}
}
