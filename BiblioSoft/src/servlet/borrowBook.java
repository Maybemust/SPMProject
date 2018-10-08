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
			System.out.print(barcode+"=====================================");


		}catch(NumberFormatException e){
			
		}
		Reader reader = new ToReader().getByAccount(account, "");
		System.out.print("==============sssssssssssssssssssssssssssssssssssssss====================>");
		System.out.print(reader.toString());
		if(reader.getEmail()==null){
			request.setAttribute("ifAccountExists",0);		
			request.getRequestDispatcher("LibrarianBorrowBook4.jsp").forward(request, response);
			return;
		}
				
		Book book = new ToBook().getByBarCode(barcode);
		System.out.print(book.toString());

		if(book.getBarCode() == null){//�жϸ����Ƿ����
			request.setAttribute("ifExist", 0);
			System.out.println("���鲻����");
			request.getRequestDispatcher("LibrarianBorrowBook.jsp").forward(request, response);
			return;
		}
		System.out.print(book.toString());
		System.out.print('\n');
		Date date = new Date(System.currentTimeMillis());//��ͬ��java.util.Date
		
//		Date date2 = new Date(System.currentTimeMillis());//��ͬ��java.util.Date
//		
//		Calendar calendar = Calendar.getInstance();
//		calendar.setTime(date2);		
//		calendar.add(Calendar.DAY_OF_MONTH, +30);
//
//		date2 = new java.sql.Date(calendar.getTime().getTime());
//		
		
		String bookName = book.getBookName();
		System.out.print("======================================================================>");
		System.out.print(bookName);
		int ifBorrow = 0;
		
		/*
		 * �涨ÿ��ֻ�ܽ�һ�� 
		 * ����ͨ��Reader.account �� Book.barCode ʵ��
		 */
		request.setAttribute("borrowBook", book);

		if(reader.getBorrowedNum()<10){//�ж��û��Ƿ��ܹ�����
			if(book.getStatus() == 0){//�жϸ����Ƿ�ԤԼ���߽��
				BorrowedRecord record = new BorrowedRecord(barcode,bookName,account,date,null,0.0);
				//bRID���������������а�������д����Ҹ��˾������ݿ�ͦ�Եģ���֪������ôд��������ôд��
				System.out.print("======================================================================>");
				System.out.print(record.toString());
				new ToBorrowedRecord().add(record);
				new ToBook().setStatus(barcode, 2);
				request.getRequestDispatcher("LibrarianBorrowBook3.jsp").forward(request, response);
				System.out.print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>");
				return;
			}

			else{
				System.out.println("�����ѱ�ԤԼ���߽���������д���");
			}
		}
		else{
			System.out.println("�û����鳬�����ޣ������д���");
		}
		request.getRequestDispatcher("LibrarianBorrowBook4.jsp").forward(request, response);
	}
}
