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
		Reader reader = (Reader)(request.getSession().getAttribute("PERSON"));
		String barcode="";
		String bookname="";
		String account="";
		try{
			barcode = request.getParameter("barCode");
			bookname = request.getParameter("bookName");
		}catch(NumberFormatException e){
			
		}
		account=reader.getAccount();
		Book book = ToBook.getByBarCode(barcode);
		long total = ToReservedRecord.getTotal();
		total++;
		Date date_sql = new Date(System.currentTimeMillis());
		ReservedRecord record = new ReservedRecord(bookname,date_sql,account,barcode);
		record.setrRID(total);
		if(book.getStatus() == 0 && book.getBookName().equals(bookname)){
			ToReservedRecord.add(record);
			request.setAttribute("status", "Add Successfully");
		}
		else{
			request.setAttribute("status", "Add Fail");
		}
		String url_return = "getreader?account=";
		url_return +=account;
		System.out.println(url_return);
		request.setAttribute("Reader", reader);
		
		int start=0;
		int count=0;
		count=ToReservedRecord.getTotalByAccount(account);
		List<ReservedRecord> myorders =ToReservedRecord.listByAccountFlag(start, count, account);
	
		request.setAttribute("myorders", myorders);
		
		
		request.setAttribute("reader", reader);
		
		count=ToBorrowedRecord.getTotal();
		List<BorrowedRecord> borrowedRecord = ToBorrowedRecord.listByReaderAccount(start, count, account);
		List<Long> date=ToBorrowedRecord.reducelist(start, count, account);

		
		List<BorrowedRecord> nowrecord = new ArrayList<BorrowedRecord>();
		List<Long> nowdate = new ArrayList<Long>();
		/*
		 * 区分历史借阅和正在借阅
		 */
		int size=0;
		int i = 0;
		size=borrowedRecord.size();
		while(i < size) {//内部不锁定 执行效率高 并发操作会出错
		    if(ToBook.getByBarCode(borrowedRecord.get(i).getBarCode()).getStatus()==0){
		    	nowrecord.add(borrowedRecord.get(i));
		    	borrowedRecord.remove(i);
		    	nowdate.add(date.get(i));
		    	size--;
		    }
		    else{
		    	 i++;
		    }
		}
		request.setAttribute("Reader", reader);
		request.setAttribute("nowdate", nowdate);
		request.setAttribute("nowrecord", nowrecord);
		request.setAttribute("borrowedRecord", borrowedRecord);
		request.setAttribute("date", date);
		
		request.getRequestDispatcher("Reader_new.jsp").forward(request, response);
	}
}
