package servlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.*;
import updateTo.*;


import java.sql.Date;
public class ReturnBooks extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String account="";
		String barcode="";
		try{
			account = request.getParameter("useraccount");
			barcode = request.getParameter("barCode");

		}catch(NumberFormatException e){
			
		}
		Book book = new ToBook().getByBarCode(barcode);
		Reader reader = new ToReader().getByAccount(account, "");
		Date date = new Date(System.currentTimeMillis());
		String bookName = book.getBookName();
		Date returnDate = new Date(System.currentTimeMillis());//不同于java.util.Date

		BorrowedRecord record = new ToBorrowedRecord().getByBarCode(barcode);

		System.out.println(record.toString());

		int brID = record.getbRID();
		Date returnDate2 = record.getBorrowedDate();//还书日期

		Date date2 = new Date(System.currentTimeMillis());//不同于java.util.Date
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(returnDate2);		
		calendar.add(Calendar.DAY_OF_MONTH, +30);

		date2 = new java.sql.Date(calendar.getTime().getTime());
		
		record.setReturnedDate(returnDate);

		int result=date2.compareTo(returnDate);

		System.out.println("===========================================yinggaihuanshu>"+date2.toString());
		System.out.println("===========================================shijihuanshu>"+returnDate.toString());

		if(result<0)
		{
			System.out.println("该书已超出还书日期，请缴纳滞纳金后再进行还书");
		}
		else{
			new ToBorrowedRecord().update(record);
			
			System.out.println("--------------------------------------------------->"+record.toString());

			new ToBook().setStatus(barcode, 0);
			request.getRequestDispatcher("LibrarianReturnBook2.jsp").forward(request, response);
			
//			BorrowedRecord.setBook(book,null);
//			BorrowedRecord.setReader(reader,null);
//			BorrowedRecord.setDate(date,null);
		}
		request.getRequestDispatcher("returnbook.jsp").forward(request, response);
	}
	
}
