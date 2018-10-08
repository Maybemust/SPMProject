package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Admin2 extends HttpServlet{
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		request.setAttribute("account", account);
		request.setAttribute("password", password);
		
		request.getRequestDispatcher("Admin2.jsp").forward(request, response);
	}
}
