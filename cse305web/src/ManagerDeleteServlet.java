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


public class ManagerDeleteServlet extends HttpServlet{
	public static final String DELETE_PER = "DELETE FROM Person WHERE Person.Id=?; \n";
	
	public static final String DELETE_EMP = "DELETE FROM Employee WHERE Employee.Id=?; \n";

	public static final String DELETE_CUS = "DELETE FROM Customer WHERE Customer.Id=?; \n";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("id") ==  null || ((String)session.getAttribute("isManager")).equalsIgnoreCase("False")) {
			response.sendRedirect("/cse305web/login");
		    return;
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ManagerDelete.jsp");
	    dispatcher.forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Connection connection;
		
		String id = request.getParameter("id");
		
		String id2 = request.getParameter("id2");
		
		
		
		List ok = new ArrayList();
		
		try 
		{
			connection = JDBC.getConnection();
			PreparedStatement stmt = connection.prepareStatement(DELETE_EMP);
			PreparedStatement stmt2 = connection.prepareStatement(DELETE_PER);
			
			
			int Id = -1;
			if (id!=null)
				Id = Integer.parseInt(id);
			
			
			
			if (Id!=-1)
			{
				stmt.setInt(1, Id);
				stmt2.setInt(1, Id);
				
				int reserve = stmt.executeUpdate();
				int reserve2 = stmt2.executeUpdate();

				if(reserve!=100) 
				{
					List subresult = new ArrayList();
					subresult.add(reserve);
					ok.add(subresult);
				}
			}
			
			stmt = connection.prepareStatement(DELETE_CUS);
			stmt2 = connection.prepareStatement(DELETE_PER);
			Id = -1;
			if (id2!=null)
				Id = Integer.parseInt(id2);
			
			
			
			if (Id!=-1)
			{
				
				stmt.setInt(1, Id);
				stmt2.setInt(1, Id);
				
				int error = stmt.executeUpdate();
				int error2 = stmt2.executeUpdate();
				
				
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
		} 
		request.setAttribute("ok", ok);
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ManagerDelete.jsp");
	    dispatcher.forward(request, response); 
	    
	}
}
