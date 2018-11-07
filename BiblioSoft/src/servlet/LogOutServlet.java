/**
 * 
 */
package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Ηϊ½¨Πρ
 *
 */
public class LogOutServlet extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		request.getSession().setAttribute("AUTHORITY", null);
		request.getSession().setAttribute("PERSON", null);
		 
		request.getRequestDispatcher("indexpage").forward(request, response);
	}
}