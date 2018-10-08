package servlet;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
public class bookaddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookaddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
	public boolean canadd(String barCode ) {
		boolean returnValue = true;
		String sql = "SELECT * FROM book";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBhelper.getInstance().getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				String userNameInDB = rs.getString("barCode");

				if (userNameInDB.equals(barCode) ) {
					returnValue = false;
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return returnValue;
	}
	
    
    
    
    
    
    
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
		
         String barCode=request.getParameter("barCode");  
         String bookName=request.getParameter("bookName");
         String ISBN=request.getParameter("ISBN");  
         String author=request.getParameter("author"); 
         String publishing=request.getParameter("publishing"); 
         String location=request.getParameter("location"); 
         
         
        
        
         
         
         bookaddServlet id1 = new bookaddServlet();
        
         boolean canadd =id1.canadd(barCode);
      
       if(canadd){
    	   
         Book book=new Book();
         
         book.setBarCode(barCode);
         book.setISBN(ISBN);
         book.setAuthor(author);     
         book.setPublishing(publishing);           
         book.setLocation(location);
         book.setBookName(bookName);
         /*reader.setTag(tag);*/
       
         
         ToBook.add(book);
     
         
         
         
         /*RequestDispatcher dispatcher = request.getRequestDispatcher("/bookList"); 
         dispatcher.forward(request, response); */
        response.sendRedirect("bookadd?error=no");
         
   
         }
       
        else {
        	System.out.println("error1");
        	 response.sendRedirect("bookadd.jsp?error=yes");
        	 System.out.println("error2");
        	 
        	 }
       System.out.println("doneall");
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

