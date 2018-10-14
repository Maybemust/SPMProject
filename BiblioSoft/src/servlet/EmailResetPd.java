package servlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.*;
import updateTo.*;

public class EmailResetPd  extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String account="";
		String email="";
		try{
			email = request.getParameter("email");

		}catch(NumberFormatException e){
			
		}
		account = ToActive.getByEmail(email);
		request.setAttribute("email", email);
		request.setAttribute("account", account);
		request.getRequestDispatcher("EmailChangePwd.jsp").forward(request, response);
	}
}
