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
import entity.Post;
import entity.Reader;
import entity.ReservedRecord;
import updateTo.ToBook;
import updateTo.ToBorrowedRecord;
import updateTo.ToPost;
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
		 * 閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷峰彶閿熸枻鎷烽敓渚ョ尨鎷烽敓鏂ゆ嫹閿熻妭鏂ゆ嫹閿熸枻鎷�
		 */
		int size=0;
		int i = 0;
		size=borrowedRecord.size();
		while(i < size) {//閿熻妭璇ф嫹閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷� 鎵ч敓鏂ゆ嫹鏁堥敓缁為潻鎷� 閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷烽敓鏂ゆ嫹閿燂拷
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
		
		count = 10;
		List<Post>posts = ToPost.list(start, count);
		size = posts.size();
		String st="";
		for(int tem = 0;tem < size; tem++){
			if(posts.get(tem).getText().length() > 25){
				st=posts.get(tem).getText().substring(0, 10)+"...";
				posts.get(tem).setText(st);
				st="";
			}
			if(posts.get(tem).getPostTitle().length() > 10){
				st=posts.get(tem).getPostTitle().substring(0, 10)+"...";
				posts.get(tem).setPostTitle(st);
				st="";
			}
		}
		request.setAttribute("posts", posts);
		
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
