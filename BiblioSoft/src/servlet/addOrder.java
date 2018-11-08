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
		String sta="";
		int no = 0;
		try{

			barcode = request.getParameter("barCode");
			bookname = request.getParameter("bookName");
			no = Integer.parseInt(request.getParameter("no"));
		}catch(NumberFormatException e){
			
		}
		account=reader.getAccount();
		
		Book book = ToBook.getByBarCode(barcode);
		long total = ToReservedRecord.getTotal();
		total++;
		java.sql.Date date_sql = new Date(System.currentTimeMillis());
		ReservedRecord record = new ReservedRecord(bookname,date_sql,account,barcode);
		record.setrRID(total);
		int start=0;
		int count = 0;
		count = ToReservedRecord.getTotal();
		List<ReservedRecord> myorders =ToReservedRecord.listByAccountFlag(start, count, account);
		boolean flag = true;
		int size = 0;
		size = myorders.size();
		System.out.println(barcode+" "+bookname+" size="+size);
		if(size<ToAdmin.getByAccount("1").getReservedMaxinum()){
			for(int i = 0;i < size;i++){
				if(myorders.get(i).getBarCode().equals(barcode)){
					sta="already existed";
					flag=false;
					break;
				}
			}
			
		if(book.getBookName() == null)
		{
			flag = false;
			sta="Please check your BarCode If it is correct";
			request.setAttribute("status",sta);
			System.out.println("null");
		}
		else{
			System.out.println("book.getBookName()"+book.getBookName());
		}
		System.out.println("flag="+flag);
		if(flag){
				if(book.getStatus() == 0 && book.getBookName().equals(bookname)){
					sta="Add successfully";
					ToReservedRecord.add(record);
					Book tembook=ToBook.getByBarCode(barcode);
					tembook.setStatus(1);
					ToBook.update(tembook);
					request.setAttribute("status",sta);
				}
				else{
					sta="please check barCode or bookName is true";
					request.setAttribute("status",sta);
				}
			}
			else{
				request.setAttribute("status",sta);
			}
		}
		else{
			sta="sum over";
			request.setAttribute("status",sta);
		}
		
		myorders=ToReservedRecord.listByAccountFlag(start, count, account);
		request.setAttribute("Reader", reader);
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
		//hou
		if(no == 1 ){
			request.getRequestDispatcher("ReaderaddOrder.jsp").forward(request, response);
		}
		else{
			request.getRequestDispatcher("Reader_new.jsp").forward(request, response);
		}
	}
}
