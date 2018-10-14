package servlet;
 
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import updateTo.ToBook;
import utils.DBhelper;
import entity.Book;
/**
 * Servlet implementation class RegisterServlet
 */
public class bookEditAndSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookEditAndSaveServlet() {
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
		
		java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
		String barCode=request.getParameter("savebarCode");
		String ISBN=request.getParameter("saveISBN"); 
		String bookName=request.getParameter("saveBookName");  
        String author=request.getParameter("saveAuthor"); 
        String publishing=request.getParameter("savePublishing"); 
        String location=request.getParameter("saveLocation"); 
        String tag1=request.getParameter("saveTag1");
        String tag2=request.getParameter("saveTag2");
        
        StringTokenizer st = new StringTokenizer(request.getParameter("savePrice"),"Ԫ");
        String abc=st.nextToken();
        if(abc==null)
        {
        	abc="0";
        	
        }
	     double price=Double.parseDouble(abc);
	     
	     
	     
      
	
        
		
        
        
      
		
         Book book=new Book();
         book.setBarCode(barCode);
         book.setISBN(ISBN);
         book.setAuthor(author);     
         book.setPublishing(publishing);           
         book.setLocation(location);
         book.setBookName(bookName);
         book.setDateOfStorage(date);
         book.setTag1(tag1);
         book.setTag2(tag2);
         book.setPrice(price);
         
         ToBook.add(book);
         request.setAttribute("barCode1", barCode );
         RequestDispatcher dispatcher = request.getRequestDispatcher("/Firstp.jsp?"); 
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

