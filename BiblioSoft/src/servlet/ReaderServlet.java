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

public class ReaderServlet  extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String account="";
		int start=0;
		int count=0;
		try{
			account = request.getParameter("account");

		}catch(NumberFormatException e){
			
		}
		
		count=ToReservedRecord.getTotalByAccount(account);
		List<ReservedRecord> myorders =ToReservedRecord.listByReaderAccount(start, count, account);
		System.out.println(myorders);
		request.setAttribute("myorders", myorders);
		
		Reader reader = ToReader.getByAccount(account,"123");
		Book book = ToBook.getByBarCode("123");
		request.setAttribute("reader", reader);
		
		count=ToBorrowedRecord.getTotal();
		List<BorrowedRecord> borrowedRecord = ToBorrowedRecord.listByReaderAccount(start, count, account);
		List<Long> date=ToBorrowedRecord.reducelist(start, count, account);

		
		List<BorrowedRecord> nowrecord = new ArrayList<BorrowedRecord>();
		List<Long> nowdate = new ArrayList<Long>();
		/*
		 * 区分历史借阅和正在借阅
		 */
		for( int i = 0 ; i < borrowedRecord.size() ; i++) {//内部不锁定，效率最高，但在多线程要考虑并发操作的问题。
		    if(borrowedRecord.get(i) == null){
		    	nowrecord.add(borrowedRecord.get(i));
		    	borrowedRecord.remove(i);
		    	nowdate.add(date.get(i));
		    	date.remove(i);
		    }
		}
		System.out.println("1");
		
		request.setAttribute("nowdate", nowdate);
		request.setAttribute("nowrecord", nowrecord);
		request.setAttribute("borrowedRecords", borrowedRecord);
		request.setAttribute("date", date);
		
		System.out.println("2");
		request.getRequestDispatcher("reader.jsp").forward(request, response);
	}
}
