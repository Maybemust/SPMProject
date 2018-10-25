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
			ReservedRecord record = ToReservedRecord.getByrRID(rRID);
			record.setFlag(1);
			ToReservedRecord.update(record);
			Book tembook=ToBook.getByBarCode(ToReservedRecord.getByrRID(rRID).getBarCode());
			tembook.setStatus(0);
			ToBook.update(tembook);
			request.setAttribute("status","Cancel Successfully");
		}
		else{
			request.setAttribute("status","Cancel Fail");
		}
		String url_return = "getreader?account=";
		url_return +=account;
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
		
		//hou
		List<ReservedRecord> houorders =ToReservedRecord.listByAccountFlag(start, count, account);
		int ih=0;
		while(ih < myorders.size()) {
			java.util.Date datehh=houorders.get(ih).getTime();
			Calendar c = Calendar.getInstance();
			c.setTime(datehh);
			c.add(Calendar.HOUR_OF_DAY, 2);
			java.util.Date hhDate = c.getTime();
			houorders.get(ih).setTime(hhDate);
			ih++;
		}
		request.setAttribute("houorders", houorders);
		//hou
		request.getRequestDispatcher("Reader_new.jsp").forward(request, response);
	}
}
