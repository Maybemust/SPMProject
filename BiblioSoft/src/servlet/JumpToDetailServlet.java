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

public class JumpToDetailServlet extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html");
			Book book = (Book)request.getAttribute("book");
			request.setAttribute("ISBN", book.getISBN());
			request.setAttribute("bookName", book.getBookName());
			request.setAttribute("author", book.getAuthor());
			request.setAttribute("publishing", book.getPublishing());
			request.setAttribute("location", book.getLocation());
			request.setAttribute("dateOfStorage", book.getDateOfStorage());
			request.setAttribute("tag1", book.getTag1());
			request.setAttribute("tag2", book.getTag2());
			request.setAttribute("price", book.getPrice());
//			String str = book.getISBN();
//			List<Book> books = ToBook.getByISBN(str);
//			int count = 0;
//			for(int i = 0; i < books.size(); i++){
//				if(books.get(i).getStatus() == 0) 
//					count++;
//			}
//			request.setAttribute("remainingNumber", count);
			
			
			
		} catch (NumberFormatException e){
			
		}
		request.getRequestDispatcher("bookDetailPage.jsp").forward(request, response);

	}
}
