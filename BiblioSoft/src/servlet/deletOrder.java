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
			ToReservedRecord.deleteByrRID(rRID);
			request.setAttribute("status", "Cancel Successfully");
		}
		else{
			request.setAttribute("status", "Cancel Fail");
		}
		String url_return = "getreader?account=";
		url_return +=account;
		System.out.println(url_return);
		request.setAttribute("Reader", reader);
		
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
