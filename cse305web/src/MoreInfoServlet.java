

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

public class MoreInfoServlet extends HttpServlet{
	public static final String ADV_DISCOUNT = "Select Days, DiscountRate from advpurchasediscount where AirlineID = ?";
	
	protected void doPost(HttpServletRequest request, 
		      HttpServletResponse response) throws ServletException, IOException 
		  {
		 String nop = request.getParameter("nop");
		 String flight = request.getParameter("flight");  
		 String air = request.getParameter("air");  
		 String depairname = request.getParameter("depair");  
		 String arrairname = request.getParameter("arrair"); 
		 String deptime = request.getParameter("deptime"); 
		 String arrtime = request.getParameter("arrtime"); 
		 String faretype = request.getParameter("faret");
		 String classtype = request.getParameter("class"); 
		 String  fare = request.getParameter("fare");
		 String  type = request.getParameter("type");
		 int  legno1 = Integer.parseInt(request.getParameter("leg1"));
		 int  legno2 = Integer.parseInt(request.getParameter("leg2"));
		 
		 String dtime2 = null;
		 String atime2 = null;
		 String flight2 = null; 
		 String air2 = null; 
		 String depairname2 = null;  
		 String arrairname2 = null;  
		 String deptime2 = null; 
		 String arrtime2 = null; 
		 String faretype2 = null; 
		 String classtype2 = null;  
		 String  fare2 = null; 
		 
		 List discount = new ArrayList();
		 
		 List discount2 = new ArrayList();
		 try {
			Connection connection = JDBC.getConnection();
			
		 if(type.equals("1")) {
			 dtime2 = request.getParameter("dtime2");
			 atime2 = request.getParameter("atime2"); 
			
			 
			 PreparedStatement stmt=connection.prepareStatement(ADV_DISCOUNT);  
			 stmt.setString(1,air);
			
			 
			 ResultSet dis = stmt.executeQuery();
			
			 if(dis!= null && dis.next()) {
				 discount.add(dis.getInt("Days"));
				 discount.add(dis.getDouble("DiscountRate"));
			 }
			 
			 request.setAttribute("dtime2",dtime2);
			 request.setAttribute("atime2",atime2);
		  }
		 else if(type.equals("2")) {
			  flight2 = request.getParameter("flight1"); 
			  air2 = request.getParameter("air1"); 
			  depairname2 = request.getParameter("depair1");  
			  arrairname2 = request.getParameter("arrair1"); 
			  deptime2 = request.getParameter("deptime1");
			  arrtime2 = request.getParameter("arrtime1"); 
			  faretype2 = request.getParameter("faret1");
			  classtype2 = request.getParameter("class1"); 
			  fare2 = request.getParameter("fare1"); 
			  
			  PreparedStatement stmt=connection.prepareStatement(ADV_DISCOUNT);  
				 stmt.setString(1,air);
				 
				 PreparedStatement stmt2=connection.prepareStatement(ADV_DISCOUNT);  
				 stmt2.setString(1,air2);
				
				 ResultSet dis = stmt.executeQuery();
				
				 ResultSet dis2 = stmt2.executeQuery();
				
				 if(dis!= null && dis.next()) {
					
					 discount.add(dis.getInt("Days"));
					 discount.add(dis.getDouble("DiscountRate"));
					
				 }
				
				 if(dis2!= null && dis2.next()) {
					
					 discount2.add(dis2.getInt("Days"));
					 discount2.add(dis2.getDouble("DiscountRate"));
					 
				 }
				
				   request.setAttribute("flight2",flight2); 
				   request.setAttribute("air2",air2);
				   request.setAttribute("depair2",depairname2); 
				   request.setAttribute("arrair2",arrairname2); 
				   request.setAttribute("deptime2",deptime2);
				   request.setAttribute("arrtime2",arrtime2);
				   request.setAttribute("faret2",faretype2);
				   request.setAttribute("fare2",fare2);
				   request.setAttribute("class2",classtype2);
				   request.setAttribute("discount2",discount2); 
				   request.setAttribute("leg11",Integer.parseInt(request.getParameter("leg11")));
				   request.setAttribute("leg22",Integer.parseInt(request.getParameter("leg22"))); 
			  
		 }
		 else {
			 PreparedStatement stmt=connection.prepareStatement(ADV_DISCOUNT);  
			 stmt.setString(1,air);
			 
			 ResultSet dis = stmt.executeQuery();
			 
			 if(dis!= null && dis.next()) {
				
				 discount.add(dis.getInt("Days"));
				 discount.add(dis.getDouble("DiscountRate"));
				 
			 }
			
			 
		 }
		   
		   
		   request.setAttribute("discount",discount); 
		   
		   request.setAttribute("nop",nop); 
		   request.setAttribute("flight",flight); 
		   request.setAttribute("air",air);
		   request.setAttribute("depair",depairname); 
		   request.setAttribute("arrair",arrairname); 
		   request.setAttribute("deptime",deptime);
		   request.setAttribute("arrtime",arrtime);
		   request.setAttribute("faret",faretype);
		   request.setAttribute("fare",fare);
		   request.setAttribute("type",type);
		   request.setAttribute("class",classtype);
		   request.setAttribute("leg1",legno1);
		   request.setAttribute("leg2",legno2);
		   
		   connection.close();
		   String page = request.getParameter("action");
		   if (page != null) {
			   if (page.equalsIgnoreCase("Book Flight")) {
				   RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerReserve.jsp");
				   dispatcher.forward(request, response); 
				   return;
			   }
			   else {
				   	HttpSession session = request.getSession(false);
					if (session == null || session.getAttribute("accountNo") ==  null) {
						response.sendRedirect("/cse305web/login");
					    return;
					}
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Auction.jsp");
				    dispatcher.forward(request, response); 
			   }
		   }
		   else {
			   RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/FlightDetailInfo.jsp");
			   dispatcher.forward(request, response); 
		   }
		   
		 }catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

}
}
