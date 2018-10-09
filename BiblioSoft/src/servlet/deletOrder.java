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

public class deletOrder  extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String rRID="";
		String account="";
		try{
			rRID = request.getParameter("rRID");
			account = request.getParameter("account");
		}catch(NumberFormatException e){
			
		}
		if(new ToReservedRecord().getByrRID(rRID) != null ){
			new ToReservedRecord().deleteByrRID(rRID);
			request.setAttribute("status", "Cancel Successfully");
		}
		else{
			request.setAttribute("status", "Cancel Fail");
		}
		String url_return = "getreader?account=";
		url_return +=account;
		System.out.println(url_return);
		request.getRequestDispatcher(url_return).forward(request, response);
	}
}
