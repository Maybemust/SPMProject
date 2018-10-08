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
		Date date = new Date(System.currentTimeMillis());//��ͬ��java.util.Date
		/*
		 * �涨ÿ��ֻ�ܽ�һ�� 
		 * ����ͨ��Reader.account �� Book.barCode ʵ��
		 */
		if(reader.getBorrowedNum()<10){//�ж��û��Ƿ��ܹ�����
			if(book.getStatus() == 0){//�жϸ����Ƿ�ԤԼ���߽��
				BorrowedRecord record = new BorrowedRecord("B20180927000001",barcode,account,date,date,0.0);
				//bRID���������������а�������д����Ҹ��˾������ݿ�ͦ�Եģ���֪������ôд��������ôд��
				new ToBorrowedRecord().add(record);
			}
			else{
				System.out.println("�����ѱ�ԤԼ���߽���������д���");
			}
		}
		else{
			System.out.println("�û����鳬�����ޣ������д���");
		}
		request.getRequestDispatcher("borrowbook.jsp").forward(request, response);
	}
}
