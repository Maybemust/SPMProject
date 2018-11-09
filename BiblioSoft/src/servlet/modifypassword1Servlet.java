package servlet;
import java.io.IOException;

import java.util.*;
import java.lang.String;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.*;
import updateTo.*;
/*
 * by diao
 */
public class modifypassword1Servlet extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
	
		String account = null;
		
		Librarian librarian=(Librarian)request.getSession().getAttribute("PERSON");
		int flag = 0;
		if(librarian==null||librarian.getPassword()==null){
			
			try{
				if(request.getParameter("account").equals("null"))
					flag = 1;
				account = request.getParameter("account");
				System.out.println("account="+account);
				
				librarian = ToLibrarian.get(account);
			}
			catch(Exception e){
				request.setAttribute("account", account);
				RequestDispatcher dispatcher = request.getRequestDispatcher("indexpage"); 
				dispatcher.forward(request, response); 
			}
		}
		String question="";
		try{
			 question = librarian.getQuestion();
		}
		catch(Exception e){
			
		}	
		
		if(librarian != null){
			account = String.valueOf(librarian.getAccount());
		}
		
		request.setAttribute("account", account);
		request.setAttribute("question", question);
		request.setAttribute("sc", "yes");
		
		
		System.out.println("flag="+flag);
		if(flag == 1){
			RequestDispatcher dispatcher = request.getRequestDispatcher("indexpage"); 
			dispatcher.forward(request, response); 
		}
		else{
			request.setAttribute("account", account);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/modifypassword.jsp"); 
			dispatcher.forward(request, response); 
		}
		 
         
		
		
		
		
		
		
		
		
		
		
	}	
}
