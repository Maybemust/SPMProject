package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
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
import updateTo.ToAdmin;
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
		 * 闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐔告灮閹峰嘲褰堕柨鐔告灮閹风兘鏁撴笟銉у皑閹风兘鏁撻弬銈嗗闁跨喕濡弬銈嗗闁跨喐鏋婚幏锟�
		 */
		int size=0;
		int i = 0;
		size=borrowedRecord.size();
		while(i < size) {//闁跨喕濡拠褎瀚归柨鐔告灮閹风兘鏁撻弬銈嗗闁跨喐鏋婚幏锟� 閹笛囨晸閺傘倖瀚归弫鍫ユ晸缂佺偤娼婚幏锟� 闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐔告灮閹风兘鏁撻弬銈嗗闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐕傛嫹
			 if(borrowedRecord.get(i).getBorrowedDate().after(borrowedRecord.get(i).getReturnedDate())){
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
		//hou
		List<ReservedRecord> houorders =ToReservedRecord.listByAccountFlag(start, count, account);
		int ih=0;
		while(ih < myorders.size()) {
			java.util.Date datehh=houorders.get(ih).getTime();
			Calendar c = Calendar.getInstance();
			c.setTime(datehh);
			c.add(Calendar.HOUR_OF_DAY, ToAdmin.getByAccount("1").getResercedTime());
			java.util.Date hhDate = c.getTime();
			houorders.get(ih).setTime(hhDate);
			ih++;
		}
		request.setAttribute("houorders", houorders);
		//hou
		List<String> barCodeList=new ArrayList<String>(1);
		barCodeList.add(account);
		request.setAttribute("barCodeList", barCodeList);
		RequestDispatcher view = request.getRequestDispatcher("ReaderaddOrder.jsp");
	    view.forward(request, response);
	}

}
