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

public class Login  extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String account="";
		String pd="";
		try{
			account = request.getParameter("account");
			pd = request.getParameter("password");

		}catch(NumberFormatException e){
			
		}
		Reader reader = ToReader.getByAccount(account, "");
		System.out.println(reader);
		if(reader.getPassword().equals(pd)){
			
		}
		else{
			System.out.println("√‹¬Î¥ÌŒÛ");
		}
		request.getRequestDispatcher("").forward(request, response);
	}
}
