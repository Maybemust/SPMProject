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
		String authority=String.valueOf(request.getSession().getAttribute("AUTHORITY"));
		System.out.println(authority);
		String account="";
		String pd="";
		String url="";
		try{
			account = request.getParameter("useraccount");
			pd = request.getParameter("userpassword");

		}catch(NumberFormatException e){
			
		}
		
		
		
		if(authority.equals("Admin")){
			Admin admin=ToAdmin.getByAccount(account);
			if(admin.getPassword().equals(pd))
			{
				request.getSession().setAttribute("PERSON", admin);
				url="admin1";
			}
			else{
				System.out.println("√‹¬Î¥ÌŒÛ");
			}
			
		}
		else if(authority.equals("Librarian"))
		{
			Librarian librarian=ToLibrarian.get(account);
			if(librarian.getPassword().equals(pd))
			{
				request.getSession().setAttribute("PERSON", librarian);
				request.setAttribute("Librarian", librarian);
				url="LibrarianFirstPage.jsp";
			}
			else{
				System.out.println("√‹¬Î¥ÌŒÛ");
			}
		}
		else if(authority.equals("Reader"))
		{
			Reader reader=ToReader.getByAccount(account);
			if(reader.getPassword().equals(pd))
			{
				request.getSession().setAttribute("PERSON", reader);
				url="getreader";
			}
			else{
				System.out.println("√‹¬Î¥ÌŒÛ");
			}
		}
		
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}
