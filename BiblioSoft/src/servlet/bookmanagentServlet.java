package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import updateTo.ToBook;
import entity.Book;
import utils.DBhelper;

public  class bookmanagentServlet extends HttpServlet {

	
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		 String cover2 = bookaddServlet.class.getResource("").toString();
	       for(int i = 0; i < 9; i++){
	    	   cover2 += "..\\";
	       }
	       cover2= cover2+"SPMProject\\BiblioSoft\\WebContent\\imgs\\";
	       cover2=cover2.substring(6);
	       System.out.println(cover2);
		
	
		int start = 0;
		int count = 10000;

		try {
			start = Integer.parseInt(request.getParameter("start"));
		} catch (NumberFormatException e) {
			// 当浏览器没有传参数start时
		}

		int next = start + count;
		int pre = start - count;

		int total = ToBook.getTotal();
		
		
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

		List<Book> books = ToBook.list(start, count);
		request.setAttribute("books", books);
      
		request.getRequestDispatcher("bookmanagent.jsp").forward(request, response);
		

	}

}
