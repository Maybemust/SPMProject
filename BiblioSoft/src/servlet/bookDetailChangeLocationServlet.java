package servlet;
 
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import updateTo.ToBook;

public class bookDetailChangeLocationServlet extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String barCode = request.getParameter("bookbarCode");
		String location = ToBook.getByBarCode(barCode).getLocation();
		int status = ToBook.getByBarCode(barCode).getStatus();
		if(status == 0){
			out.write("Location:  "+location+"|"+"Status:  can be bowwored");
		} else {
			out.write("Location:  "+location+"|"+"Status:  can not be bowwored");
		}
		
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}


}
