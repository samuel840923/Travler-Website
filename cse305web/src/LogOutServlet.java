import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogOutServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Cookie[] cookies = request.getCookies();
		 if (cookies != null) {
			 for (Cookie cookie : cookies) {
				 cookie.setValue("");
		         cookie.setPath("/");
		         cookie.setMaxAge(0);
		         response.addCookie(cookie);
		     }
		 }
		 HttpSession session = request.getSession(false);
		 if (session != null) {
			 session.invalidate();
		 }
		 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login");
		 dispatcher.forward(request, response); 
	}

}
