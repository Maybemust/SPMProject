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
public class changePassword extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		Reader reader = (Reader)(request.getSession().getAttribute("PERSON"));
		String OldPassword = "";
		String NewPassword = "";
		try{
			OldPassword = request.getParameter("oldPassword");
			NewPassword = request.getParameter("newPassword");
		}catch(NumberFormatException e){
		}
          if(OldPassword.equals(reader.getPassword())){
        	  reader.setPassword(NewPassword);
              ToReader.update(reader);
        	  }
          else
        	  {
        	  System.out.println("old password is error!");
          }
          String account=reader.getAccount();     
          int start=0;
          int count=0;
      		count=ToReservedRecord.getTotalByAccount(account);
      		List<ReservedRecord> myorders =ToReservedRecord.listByReaderAccount(start, count, account);
      	
      		request.setAttribute("myorders", myorders);
      		
      		
      		request.setAttribute("reader", reader);
      		
      		count=ToBorrowedRecord.getTotal();
      		List<BorrowedRecord> borrowedRecord = ToBorrowedRecord.listByReaderAccount(start, count, account);
      		List<Long> date=ToBorrowedRecord.reducelist(start, count, account);

      		
      		List<BorrowedRecord> nowrecord = new ArrayList<BorrowedRecord>();
      		List<Long> nowdate = new ArrayList<Long>();
      		/*
      		 * ������ʷ���ĺ����ڽ���
      		 */
      		int size=0;
      		int i = 0;
      		size=borrowedRecord.size();
      		while(i < size) {//�ڲ������� ִ��Ч�ʸ� �������������
      		    if(ToBook.getByBarCode(borrowedRecord.get(i).getBarCode()).getStatus()==0){
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
      		
      		request.getRequestDispatcher("Reader_new.jsp").forward(request, response);
		}
	}

