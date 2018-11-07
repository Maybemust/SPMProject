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
        String imagePath=request.getParameter("saveCover");
        int number = Integer.parseInt(request.getParameter("saveNumber"));
        String [] barCodeList = new String [number];
        
        System.out.println("picture-------------------->"+imagePath);
    
        
        
 double price=0;
        
        
        StringTokenizer st = new StringTokenizer(request.getParameter("savePrice"),"Ԫ");
        String abc=st.nextToken();
        price=Double.parseDouble(abc);
        
    
	     
		
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
         book.setCover(imagePath);
        
 		if(number>0)
 		{	
 			
 	for(int cont=0; cont<number; cont++)
       { String num2,num3,barCode1;
 		
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
 		barCode1=num2;	
 		barCodeList[cont]=barCode1;
 		 book.setBarCode(barCode1);
         ToBook.add(book);
   }
 		}
        
        
      
         
       
         request.setAttribute("barCodeList", barCodeList );
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

