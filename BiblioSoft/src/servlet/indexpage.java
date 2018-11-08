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
public class indexpage  extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		
				int total=ToPost.getTotal();
				List<Post> posts=ToPost.list(0, total);
				request.setAttribute("posts", posts);
				System.out.println("title:"+posts.get(0).getPostTitle());
		request.getRequestDispatcher("finPost").forward(request, response);
	}
}
