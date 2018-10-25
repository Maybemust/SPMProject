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

public class EmailChangePd  extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String account="";
		String accountinput="";
		String pd="";
		String pd2="";
		try{
			account = request.getParameter("account");
			pd = request.getParameter("pd");
			pd2 = request.getParameter("NewPasswordAgain");
		}catch(NumberFormatException e){
			
		}

		Reader reader = ToReader.getByAccount(account);
		if(pd.equals(pd2)){
			reader.setPassword(pd);
		}
		ToReader.update(reader);

		request.getRequestDispatcher("fin.jsp").forward(request, response);
	}
}
