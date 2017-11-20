import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class FlightSearch extends HttpServlet { 
  protected void doPost(HttpServletRequest request, 
      HttpServletResponse response) throws ServletException, IOException 
  {
    // reading the user input
	List result = new ArrayList();
    String aid= request.getParameter("AID");    
    String flyfrom=request.getParameter("from");
    String flyto=request.getParameter("flyto");
    String start=request.getParameter("start_date");
    String arrive=request.getParameter("arrive_date");
    String nop=request.getParameter("nop");
    String type=request.getParameter("type");
    	List subresult = new ArrayList();
    	subresult.add(aid);
    	subresult.add(flyfrom);
    	subresult.add(flyto);
    	subresult.add(start);
    	subresult.add(arrive);
    	subresult.add(nop);
    	subresult.add(type);
    	result.add(subresult);
   request.setAttribute("searchlist",result); 
    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/FlightSearchResult.jsp");
   dispatcher.forward(request, response); 
  }  
}