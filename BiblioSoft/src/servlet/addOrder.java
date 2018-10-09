package servlet;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.*;
import updateTo.*;
import java.sql.*;
import java.sql.Date;
import java.util.*;
public class addOrder  extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String barcode="";
		String bookname="";
		String account="";
		try{
			barcode = request.getParameter("barCode");
			bookname = request.getParameter("bookName");
			account = request.getParameter("account");
		}catch(NumberFormatException e){
			
		}
		Book book = new ToBook().getByBarCode(barcode);
		long total = new ToReservedRecord().getTotal();
		total++;
		Date date = new Date(System.currentTimeMillis());
		ReservedRecord record = new ReservedRecord(bookname,date,account,barcode);
		record.setrRID(total);
		if(book.getStatus() == 0 && book.getBookName().equals(bookname)){
			new ToReservedRecord().add(record);
			request.setAttribute("status", "Add Successfully");
		}
		else{
			request.setAttribute("status", "Add Fail");
		}
		String url_return = "getreader?account=";
		url_return +=account;
		System.out.println(url_return);
		request.getRequestDispatcher(url_return).forward(request, response);
	}
}
