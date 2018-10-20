package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Book;
import entity.BorrowedRecord;
import entity.Reader;
import entity.ReservedRecord;
import updateTo.ToBook;
import updateTo.ToBorrowedRecord;
import updateTo.ToReservedRecord;

public class searchBook extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		Reader reader = (Reader)(request.getSession().getAttribute("PERSON"));
		String barcode="";
		String bookname="";
		String account="";
		account=reader.getAccount();
		long total = ToReservedRecord.getTotal();
		total++;
		Date date_sql = new Date(System.currentTimeMillis());
		ReservedRecord record = new ReservedRecord(bookname,date_sql,account,barcode);
		record.setrRID(total);
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
		 * 锟斤拷锟斤拷锟斤拷史锟斤拷锟侥猴拷锟斤拷锟节斤拷锟斤拷
		 */
		int size=0;
		int i = 0;
		size=borrowedRecord.size();
		while(i < size) {//锟节诧拷锟斤拷锟斤拷锟斤拷 执锟斤拷效锟绞革拷 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟�
			if(borrowedRecord.get(i).getReturnedDate().after(borrowedRecord.get(i).getBorrowedDate())||borrowedRecord.get(i).getReturnedDate() == null){
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
		String key="";
		try{
			key = request.getParameter("searchou");
		}catch(NumberFormatException e){
			
		}
		List<Book> bookList = ToBook.searchForKey(key);
		request.setAttribute("bookList", bookList);
		RequestDispatcher view = request.getRequestDispatcher("ReaderaddOrder.jsp");
	    view.forward(request, response);
	}

}
