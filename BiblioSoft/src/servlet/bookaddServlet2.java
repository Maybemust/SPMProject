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
import servlet.RetrieveDocumentByURL;



/**
 * Servlet implementation class RegisterServlet
 */
public class bookaddServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookaddServlet2() {
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
		
		
		
		java.sql.Date date = new java.sql.Date(System.currentTimeMillis());

		System.out.println(date);
		
		String ISBN=request.getParameter("ISBN"); 
		
		int number = Integer.parseInt(request.getParameter("number"));
		
		String [] barCodeList = new String [number];
		String barCode1="";
		
 		if(number>0)
 		{	
 			
 	for(int cont=0; cont<number; cont++)
       { String num2,num3,barCode;
 		
 		int num1=0;
 		num3=String.valueOf(num1);
 		for(num1=1;;num1++)
 		{
 			num3=String.valueOf(num1);
 			if(num1<10)
 			{
 				num2=ISBN+"-0"+num3;
 				
 			}
 			else
 			{
 				num2=ISBN+"-"+num3;
 			}
 			Book book1=ToBook.getByBarCode(num2);
 			
 			
 			if(book1.getISBN()==null)
 				break;	
 		}
 		barCode=num2;	
 		barCodeList[cont]=barCode;
 		/* book.setBarCode(barCode);
         ToBook.add(book);*/
   }
 		}	
		
		
		
		barCode1=barCodeList[0];	
		
		String url="http://api.douban.com/book/subject/isbn/";
		  url=url+ISBN;
		 /* RetrieveDocumentByURL a=new RetrieveDocumentByURL(url);*/
		  
		  TudouBookInfo book1=new RetrieveDocumentByURL(url).getBookInformation();
	     
	     
	     String bookName=book1.getTitle();
	     String author=book1.getAuthor();
	     String publishing=book1.getPublisher();
	     String price1 =book1.getPrice();
	     String imagePath=book1.getImagePath();
	     
	     
	     System.out.println(price1);
	     
	     
	     if(price1==null)
	    	 price1="0.0";
	     
	     if(publishing==null)
	    	 publishing="none";
	     
	     if(bookName==null)
	    	 bookName="none";
	     
	     if(author==null)
	    	 author="none";
	     
	     if(imagePath==null)
	    	 imagePath="none";
	     
	/*     StringTokenizer st = new StringTokenizer(price1,"Ԫ");
	     double price=Double.parseDouble(st.nextToken());
	     */
	  
		

        
        
         
         
       
    	  
      /*   Book book=new Book();
         
         book.setBarCode(barCode);
         book.setISBN(ISBN);
         book.setAuthor(author);     
         book.setPublishing(publishing);           
         book.setLocation("location");
         book.setBookName(bookName);
         book.setDateOfStorage(date);
         book.setTag1("tag1");
         book.setTag2("tag2");
         book.setPrice(price);
         */
  
         request.setAttribute("barCode", barCode1);
         request.setAttribute("ISBN", ISBN );
         request.setAttribute("author", author );
         request.setAttribute("publishing", publishing );
         request.setAttribute("bookName", bookName );
         request.setAttribute("tag1", "tag1" );
         request.setAttribute("tag2", "tag2" );
         request.setAttribute("location", "location" );
         request.setAttribute("date", date );
         request.setAttribute("price", price1 );
         request.setAttribute("imagePath", imagePath );
         request.setAttribute("number", number );
         System.out.println(imagePath);
         
         RequestDispatcher dispatcher = request.getRequestDispatcher("/bookDetailPage.jsp?"); 
         dispatcher.forward(request, response); 
         
         
       /* response.sendRedirect("bookadd.jsp?error=no");*/
         
   
       

		
		
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

