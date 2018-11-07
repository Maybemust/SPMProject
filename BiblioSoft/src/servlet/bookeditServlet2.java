package servlet;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;

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
import updateTo.ToLabel;
import updateTo.ToLocation;
import utils.DBhelper;
import entity.Book;
import entity.Label;
import entity.Location;
/**
 * Servlet implementation class RegisterServlet
 */
public class bookeditServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final java.sql.Blob NUll = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookeditServlet2() {
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
	

/*		private String barCode;
		private String bookName;
		private String ISBN;
		private String author;
		private String publishing;
		private String location;
		private Blob cover;
		private String introduction;
		private int status;
		private Date dateOfStorage;
		private String tag1;
		private String tag2;
		private double price;*/


		
		
		   String barCode=request.getParameter("barCode1"); 
		  /* String bookName=request.getParameter("bookName"); 
	       String ISBN=request.getParameter("ISBN");  
	       String author=request.getParameter("author"); 
	       String publishing=request.getParameter("publishing"); 
	       String location=request.getParameter("location"); 
	       String introduction=request.getParameter("introduction");
	       String tag1=request.getParameter("tag1");
	       String tag2=request.getParameter("tag2");
	       int status=Integer.parseInt(request.getParameter("status"));
	       double price=Double.parseDouble(request.getParameter("price"));*/
	       Book book =ToBook.getByBarCode(barCode);
	       String ISBN = book.getISBN();
	       String author = book.getAuthor();
	       String publishing = book.getPublishing();
	       String bookName=book.getBookName();
	       String location = book.getLocation();
	       int status = book.getStatus();
	       double price = book.getPrice();
	       Date dateOfStorage = book.getDateOfStorage();
	       
	       
	       
	       
	       if(ISBN==null)
	    	   ISBN="none";
	       if(author==null)
	    	   author="none";
	       if(publishing==null)
	    	   publishing="none";
	       if(bookName==null)
	    	   bookName="none";
	       if(location==null)
	    	   location="none";
	       
	       
	       
	      System.out.println("======================>"+book.toString());
	    
	       request.setAttribute("barCode", barCode );
	       request.setAttribute("ISBN", ISBN );
	       request.setAttribute("author", author );
	       request.setAttribute("publishing", publishing );
	       request.setAttribute("bookName", bookName );
	       request.setAttribute("location", location );
	       request.setAttribute("status", status );
	       request.setAttribute("price", price );
	       request.setAttribute("dateOfStorage", dateOfStorage );
	       
	       
	  	 List<Location> locations = ToLocation.list(0, ToLabel.getTotal());
	  	List<Label> labels = ToLabel.list(0, ToLabel.getTotal());
	  	 
	 	request.setAttribute("locations",locations);
	 	request.setAttribute("labels",labels);
         RequestDispatcher dispatcher = request.getRequestDispatcher("/bookedit.jsp"); 
         
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

