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
		Reader reader = (Reader)(request.getSession().getAttribute("PERSON"));
		String rRID="";
		String account="";
		try{
			rRID = request.getParameter("rRID");
		}catch(NumberFormatException e){
			
		}
		account=reader.getAccount();
		if(ToReservedRecord.getByrRID(rRID) != null ){
			ToReservedRecord.deleteByrRID(rRID);
			request.setAttribute("status", "Cancel Successfully");
		}
		else{
			request.setAttribute("status", "Cancel Fail");
		}
		String url_return = "getreader?account=";
		url_return +=account;
		System.out.println(url_return);
		request.setAttribute("Reader", reader);
		request.getRequestDispatcher("Reader_new.jsp").forward(request, response);
	}
}
