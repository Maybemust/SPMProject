package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Admin;
import entity.Librarian;
import entity.Book;
import updateTo.ToAdmin;
import updateTo.ToBook;
import updateTo.ToLibrarian;

public class bookDetailServletrr extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String aaa = "111";
		out.write("aa");
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html");
			
			
			
			
			String ISBN = request.getParameter("ISBN");
			List<Book> books = ToBook.getByISBN(ISBN);
			Book book = books.get(0);
			request.setAttribute("books", books);
			request.setAttribute("ISBN", book.getISBN());
			request.setAttribute("bookName", book.getBookName());
			request.setAttribute("author", book.getAuthor());
			request.setAttribute("publishing", book.getPublishing());
			request.setAttribute("location", book.getLocation());
			request.setAttribute("dateOfStorage", book.getDateOfStorage());
			request.setAttribute("tag1", book.getTag1());
			request.setAttribute("tag2", book.getTag2());
			request.setAttribute("price", book.getPrice());
			request.setAttribute("books", books);
			request.setAttribute("status", book.getStatus());
			request.setAttribute("imagePath", book.getCover());
			System.out.println("cover -----    "+book.getCover());
			
			request.setAttribute("introduction", book.getIntroduction());
			int st = book.getStatus();
			if(st == 0) {
				request.setAttribute("status", "can be borrowed");
			} else {
				request.setAttribute("status", "can not be borrowed");
			}
			
			
//			String aaa = "111";
//			out.write("aa");
			
//			String bookbarCode = request.getParameter("bookbarCode");
//			System.out.println(bookbarCode);
//			Book book2 = ToBook.getByBarCode(bookbarCode);
//			String location = book2.getLocation();
//			System.out.println("1111");
//			System.out.println(location);
//			out.write(location);
			
		} catch (NumberFormatException e){
			
		}
		
		request.getRequestDispatcher("bookDetailPagerr.jsp").forward(request, response);

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
