package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.BorrowedRecord;
import updateTo.ToBorrowedRecord;

public class ShowReaderBorrowRecord extends HttpServlet {

	
	protected void service(HttpServletRequest request,HttpServletResponse response)
	          throws ServletException,IOException{
		
		response.setContentType("text/html;charset=UTF-8");
		String account=request.getParameter("account1");
		int start = 0;
		int count = 100;

		try {
			start = Integer.parseInt(request.getParameter("start"));
		} catch (NumberFormatException e) {
			// 当浏览器没有传参数start时
		}

		int next = start + count;
		int pre = start - count;

		int total = ToBorrowedRecord.getTotal();
		
		
		System.out.print("test=  "+total);
	
        
		int last;
		if (0 == total % count)
			last = total - count;
		else
			last = total - total % count;

		pre = pre < 0 ? 0 : pre;
		next = next > last ? last : next;

		request.setAttribute("next", next);
		request.setAttribute("pre", pre);
		request.setAttribute("last", last);
		
		List<BorrowedRecord> records1 = ToBorrowedRecord.listByReaderAccount(start, count,account);
		List<BorrowedRecord> records = new ArrayList<BorrowedRecord>();
		
		  for(int i1=0; i1<records1.size();i1++)
	        {
	        	if(records1.get(i1).getReturnedDate().before(java.sql.Date.valueOf("1949-10-02")))
	        	{	
	        		
	        
	        			records1.get(i1).setReturnedDate(null);
				  
	        		records.add(records1.get(i1));
	        	}	
	        }
		request.setAttribute("records", records);
      
		request.getRequestDispatcher("borrowedbookrecord.jsp").forward(request, response);
		
		
	}
	
	
	
	
}
