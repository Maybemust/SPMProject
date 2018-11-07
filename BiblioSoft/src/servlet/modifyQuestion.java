package servlet;
import java.io.IOException;
import entity.Librarian;
import updateTo.ToLibrarian;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class modifyQuestion extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String account = request.getParameter("account");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		System.out.println(account+question+answer);
		Librarian librarian = ToLibrarian.get(account);
		System.out.println(librarian.toString());
		Librarian librarianNew = new Librarian(librarian.getAccount(),librarian.getPassword(),librarian.getTag(),question,answer);
		ToLibrarian.update(librarianNew);
		
		request.setAttribute("Librarian", librarianNew);
		
		
		request.getRequestDispatcher("LibrarianFirstPage.jsp").forward(request, response);
	}
}
