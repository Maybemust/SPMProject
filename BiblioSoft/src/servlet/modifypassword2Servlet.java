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
public class modifypassword2Servlet extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
	Librarian librarian=(Librarian)request.getSession().getAttribute("PERSON");
	
	String answer=request.getParameter("answer");
	System.out.println(answer);
	
	String password=request.getParameter("password1");
	
	System.out.println(password);
	
	
	String question=librarian.getQuestion();
	
	if(answer.equals(librarian.getAnswer())){
		
		librarian.setPassword(password);
		ToLibrarian.update(librarian);
		request.setAttribute("question", question);
		
		 RequestDispatcher dispatcher = request.getRequestDispatcher("/modifypassword.jsp?sc=ok"); 
         dispatcher.forward(request, response); 
		
	}
	else{
		System.out.println("sc---------------------1");
		request.setAttribute("question", question);

		 RequestDispatcher dispatcher = request.getRequestDispatcher("/modifypassword.jsp?sc=no"); 
         dispatcher.forward(request, response); 
	}
	
	
		
	
		
		
	}	
}
