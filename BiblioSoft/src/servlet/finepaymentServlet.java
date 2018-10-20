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
import updateTo.ToBorrowedRecord;
import updateTo.ToReader;
import utils.DBhelper;
import entity.Book;
import entity.BorrowedRecord;
import entity.Reader;
/**
 * Servlet implementation class RegisterServlet
 */
public class finepaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final java.sql.Blob NUll = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public finepaymentServlet() {
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


		System.out.println(request.getParameter("bRID"));
		
		   String account=request.getParameter("account"); 
		   String bRID1=request.getParameter("bRID"); 
		   String fine1=request.getParameter("fine"); 
		 
		   int bRID=Integer.parseInt(bRID1);
		   double fine=Double.parseDouble(fine1);
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
		   BorrowedRecord borrowedrecord=ToBorrowedRecord.getBybRID(bRID);
		   borrowedrecord.setFine(0);
		   ToBorrowedRecord.update(borrowedrecord);
		   
		   Reader reader =ToReader.getByAccount(account);
		   fine=reader.getFine()-fine;
		   
		   System.out.println(fine);
		   
		   reader.setFine(fine);
		   ToReader.update(reader);
		  System.out.println("done all");
	       
         RequestDispatcher dispatcher = request.getRequestDispatcher("/borrowedrecordList"); 
         dispatcher.forward(request, response); 
      
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

