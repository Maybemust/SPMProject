import javax.servlet.http.HttpServlet;

import java.awt.print.Book;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import java.sql.Date;
public class ReturnBooks extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String account="";
		String barcode="";
		try{
			account = request.getParameter("useraccount");
			barcode = request.getParameter("barCode");

		}catch(NumberFormatException e){
			
		}
		Book book = new ToBook().getByBarCode(barcode);
		Reader reader = new ToReader().getByAccount(account, "");
		Date date = new Date(System.currentTimeMillis());
		
		if(date!.equals(BorrowRecord.getReturnDate()))
		{
			System.out.println("该书已超出还书日期，请缴纳滞纳金后再进行还书");
		}
		else{
			BorrowRecord.setBook(book,null);
			BorrowRecord.setReader(reader,null);
			BorrowRecord.setDate(date,null);
			ReturnRecord record = new ReturnedRecord("B20180927000001",barcode,account,date,date,0.0);
			new ToReturnedRecord().add(record);
		}
		request.getRequestDispatcher("returnbook.jsp").forward(request, response);
	}
	
}
