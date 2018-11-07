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

public class modifyPersonImformation extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		Reader reader = (Reader)(request.getSession().getAttribute("PERSON"));
		String email = "";
		String phone = "";
		try{
			email = request.getParameter("Email");
			phone = request.getParameter("Phone");
		}catch(NumberFormatException e){
			
		}
		System.out.println("email="+email);
		System.out.println("phone"+phone);
		long newphone = Long.parseLong(phone);
		
		reader.setEmail(email);
		reader.setPhone(newphone);
		ToReader.update(reader);
		String account=reader.getAccount();
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
			c.add(Calendar.HOUR_OF_DAY, ToAdmin.getByAccount("1").getResercedTime());
			java.util.Date hhDate = c.getTime();
			houorders.get(ih).setTime(hhDate);
			ih++;
		}
		request.setAttribute("houorders", houorders);
		
		List<java.sql.Date>   houborrow=new ArrayList<java.sql.Date>();
		i=0;
		size=nowrecord.size();
		while(i < size){
			houborrow.add(nowrecord.get(i).getBorrowedDate());;
			i++;
		}
		int ih2=0;
		while(ih2 < houborrow.size()) {
			java.sql.Date datehh2=houborrow.get(ih2);
			Calendar c2 = Calendar.getInstance();
			c2.setTime(datehh2);
			c2.add(Calendar.DATE, 2);
			java.util.Date hhDate2 = (java.util.Date)c2.getTime();
			//java.util.Date日期转换成转成java.sql.Date格式
			java.sql.Date newDate =new java.sql.Date(hhDate2.getTime());
			houborrow.set(ih2, newDate);
			ih2++;
		}
		request.setAttribute("houborrow", houborrow);
		//hou
		List<String> barCodeList=new ArrayList<String>(1);
		barCodeList.add(account);
		request.setAttribute("barCodeList", barCodeList);
		request.getRequestDispatcher("Reader_new.jsp").forward(request, response);
	
	}
}
