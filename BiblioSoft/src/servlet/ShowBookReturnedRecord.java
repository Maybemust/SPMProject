package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.BorrowedRecord;
import updateTo.ToBorrowedRecord;

public class ShowBookReturnedRecord extends HttpServlet {

	
	
	protected void service(HttpServletRequest request,HttpServletResponse response)
	          throws ServletException,IOException{
		
		response.setContentType("text/html;charset=UTF-8");
		String barCode=request.getParameter("barCode1");
			
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
		
		List<BorrowedRecord> records = ToBorrowedRecord.listByBarCode(start, count,barCode);
		request.setAttribute("records", records);
        
		request.getRequestDispatcher("bookreturnedrecord.jsp").forward(request, response);
		
	}
	
}
