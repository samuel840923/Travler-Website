import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogOutServlet extends HttpServlet{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Cookie[] cookies = request.getCookies();
		 if (cookies != null) {
			 for (Cookie cookie : cookies) {
				 Cookie c = new Cookie(cookie.getName(), null);
		         c.setPath("/");
		         c.setMaxAge(0);
		         response.addCookie(c);
		     }
		 }
		 HttpSession session = request.getSession(false);
		 if (session != null) {
			 session.invalidate();
		 }
		 //RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login");
		 //dispatcher.forward(request, response); 
		 response.sendRedirect("/cse305web/login");
	}

}
