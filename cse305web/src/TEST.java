

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TEST extends HttpServlet{
	
	protected void doPost(HttpServletRequest request, 
		      HttpServletResponse response) throws ServletException, IOException 
		  {
		 String aid = request.getParameter("flight");  
		 System.out.print(aid);
		 String ai = request.getParameter("air");  
		 System.out.print(ai);
		 String a = request.getParameter("deptime");  
		 System.out.print(a);
		  }

}
