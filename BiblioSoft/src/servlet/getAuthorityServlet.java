/**
 * 
 */
package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Reader;
import updateTo.ToReader;

/**
 * @author ¿Ó—Û
 *
 */
public class getAuthorityServlet extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		/*
		 * AUTHORITY
		 * Admin
		 * Reader
		 * Librarian
		 */
		String a="";
		try{
			a = request.getParameter("a");

		}catch(NumberFormatException e){
			
		}
		request.getSession().setAttribute("AUTHORITY", a);
		
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
}
