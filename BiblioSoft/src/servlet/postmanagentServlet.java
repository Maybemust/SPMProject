package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import updateTo.ToBook;
import updateTo.ToPost;
import entity.Book;
import entity.Post;
import utils.DBhelper;

public  class postmanagentServlet extends HttpServlet {

	
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		
		
	
		int start = 0;
		int count = 100;

		try {
			start = Integer.parseInt(request.getParameter("start"));
		} catch (NumberFormatException e) {
			// 当浏览器没有传参数start时
		}

		int next = start + count;
		int pre = start - count;

		int total = ToPost.getTotal();
		
		
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

	
		List<Post> posts = ToPost.list(start, count);
		request.setAttribute("posts", posts);
      
		request.getRequestDispatcher("postmanagent.jsp").forward(request, response);
		

	}

}
