
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
public class booksearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public booksearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	
    
    public boolean cansearch(String barCode ) {
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
		
		
         String barCode=request.getParameter("searchbarCode"); 
         
         

         booksearchServlet id1 = new booksearchServlet();
       
         boolean cansearch =id1.cansearch(barCode);
         
     
       if(!cansearch){
    	   
         Book book1=new Book();
         book1=ToBook.getByBarCode(barCode);
         
         request.setAttribute("book1", book1);
         request.getRequestDispatcher("bookmanagent2.jsp").forward(request, response);
         
         }
       
        else {
        	System.out.println("error1");
        	 response.sendRedirect("bookmanagent2.jsp?error1=yes");
        	 System.out.println("error2");
    
        	 }
       
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

