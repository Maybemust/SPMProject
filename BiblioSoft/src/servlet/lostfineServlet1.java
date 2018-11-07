package servlet;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import com.mysql.jdbc.Blob;

import updateTo.ToBook;
import utils.DBhelper;
import entity.Book;
/**
 * Servlet implementation class RegisterServlet
 */
public class lostfineServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final java.sql.Blob NUll = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lostfineServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
	
    
    
    
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");	
		request.setCharacterEncoding("utf-8"); 
	



		
		   String type =request.getParameter("type");
		   String barCode=request.getParameter("barCode"); 
		   String bRID =request.getParameter("bRID");
		   String readerAccount =request.getParameter("readerAccount");
		   Book book = ToBook.getByBarCode(barCode);
		   double price = book.getPrice();
		   String ISBN = book.getISBN();
	       String author = book.getAuthor();
	       String publishing = book.getPublishing();
	       String bookName=book.getBookName();
	       String location = book.getLocation();
	       int status = book.getStatus();
	       String imagePath = book.getCover();
	       
	       Date dateOfStorage = book.getDateOfStorage();
	       String tag1=book.getTag1();
	       String tag2=book.getTag2();
		
	       
	       if(imagePath==null)
	       {
	    	   imagePath ="http://pic19.nipic.com/20120308/4970979_102637717125_2.jpg";
	       }
	       
	       
	     
	    
	       request.setAttribute("barCode", barCode );
	       request.setAttribute("ISBN", ISBN );
	       request.setAttribute("author", author );
	       request.setAttribute("publishing", publishing );
	       request.setAttribute("bookName", bookName );
	       request.setAttribute("location", location );   
	       request.setAttribute("price", price );
	       request.setAttribute("bRID", bRID );
	       request.setAttribute("imagePath", imagePath );
	       request.setAttribute("readerAccount", readerAccount );
	       request.setAttribute("dateOfStorage", dateOfStorage );
	       request.setAttribute("tag1", tag1 );
	       request.setAttribute("tag2", tag2 );
	       request.setAttribute("type", type );
         RequestDispatcher dispatcher = request.getRequestDispatcher("/lostbookconfirm.jsp"); 
         dispatcher.forward(request, response); 
       /* response.sendRedirect("bookedit.jsp?error=no");*/
       
         
       /*
        else {
        	 System.out.println("error1");
        	 response.sendRedirect("bookedit.jsp?error=yes");
        	 System.out.println("error2");
        	 
        	 }*/
    
	}

	
	
	
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		HttpServletRequest rq = (HttpServletRequest) request;
		HttpServletResponse rs = (HttpServletResponse) response;
		doPost(rq, rs);
	}
 
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
 
	@Override
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return null;
	}
 
	@Override
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null;
	}
 
	@Override
	public void init(ServletConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
 
}

