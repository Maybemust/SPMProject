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


import java.sql.Date;
public class borrowBook  extends HttpServlet{
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
		Date date = new Date(System.currentTimeMillis());//不同于java.util.Date
		/*
		 * 规定每次只能借一本 
		 * 借书通过Reader.account 和 Book.barCode 实现
		 */
		if(reader.getBorrowedNum()<10){//判断用户是否能够借书
			if(book.getStatus() == 0){//判断该书是否被预约或者借出
				BorrowedRecord record = new BorrowedRecord("B20180927000001",barcode,account,date,date,0.0);
				//bRID和两个日期请自行按规则进行处理，我个人觉得数据库挺迷的，不知道该怎么写，就先这么写了
				new ToBorrowedRecord().add(record);
			}
			else{
				System.out.println("该书已被预约或者借出，请自行处理");
			}
		}
		else{
			System.out.println("用户借书超出上限，请自行处理");
		}
		request.getRequestDispatcher("borrowbook.jsp").forward(request, response);
	}
}
