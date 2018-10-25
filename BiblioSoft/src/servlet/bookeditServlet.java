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
public class bookeditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String NUll = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookeditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
	public boolean canedit(String barCode ) {
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
	       String introduction=request.getParameter("introduction");
	       String tag1=request.getParameter("tag1");
	       String tag2=request.getParameter("tag2");
	       int status=Integer.parseInt(request.getParameter("status"));
	       double price=Double.parseDouble(request.getParameter("price"));
	       
	       

		
	       java.sql.Date dateOfStorage=java.sql.Date.valueOf(request.getParameter("date"));
	       

        /* System.out.println("done3");
         System.out.println("done4");*/
         
        
         bookeditServlet id1 = new bookeditServlet();
         
        /* System.out.println("done4");*/
         
         boolean canadd =id1.canedit(barCode);
         
        
       if(!canadd){
    	   
         Book book=new Book();
         
         book.setBarCode(barCode);
         book.setBookName(bookName);
         book.setISBN(ISBN);
         book.setAuthor(author);     
         book.setPublishing(publishing);           
         book.setLocation(location);
         book.setCover(NUll);
         book.setStatus(status);
         book.setTag1(tag1);
         book.setTag2(tag2);
         book.setIntroduction(introduction);
         book.setDateOfStorage(dateOfStorage);
         book.setPrice(price);
         ToBook.update(book);
         
    
         /*RequestDispatcher dispatcher = request.getRequestDispatcher("/bookList"); 
         dispatcher.forward(request, response); */
        response.sendRedirect("bookList?error=no");
       
         }
       
        else {
        	 /*System.out.println("error1");*/
        	 response.sendRedirect("bookedit.jsp?error=yes");
        	 /*System.out.println("error2");*/
        	 
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

