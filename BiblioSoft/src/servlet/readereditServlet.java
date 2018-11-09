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


import updateTo.ToReader;
import utils.DBhelper;
import entity.Reader;
/**
 * Servlet implementation class RegisterServlet
 */
public class readereditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public readereditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
	public boolean canedit(String account ) {
		boolean returnValue = true;
		String sql = "SELECT * FROM reader";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBhelper.getInstance().getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				String userNameInDB = rs.getString("account");

				if (userNameInDB.equals(account) ) {
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
		
		System.out.println("done1");
		System.out.println(request.getParameter("phone"));
		System.out.println(request.getParameter("password"));
		System.out.println("done2");
		/*private String account;
		private String password;
		private String email;
		private long phone;
		private double fine;
		private int borrowedNum;
		private double cashPledge;
		private int tag;*/
		
		
		
		 
		  
	
	
	
         String account=request.getParameter("account");  
         String password=request.getParameter("password"); 
         String password2=request.getParameter("password2"); 
         String email=request.getParameter("email");
         long phone= Long.parseLong(request.getParameter("phone"));
         
        // Double fine =Double.parseDouble(request.getParameter("fine"));
        // int borrowedNum=Integer.parseInt(request.getParameter("borrowedNum"));
       //  int tag=Integer.parseInt(request.getParameter("tag"));
         double cashPledge=Double.parseDouble(request.getParameter("cashPledge"));
      

        /* System.out.println("done3");
         System.out.println("done4");*/
         
        
         readereditServlet id1 = new readereditServlet();
         
        /* System.out.println("done4");*/
         
         boolean canadd =id1.canedit(account);
         
         System.out.println("done5");
       if(!canadd){
    	   
         Reader reader=new Reader();
         
         reader.setAccount(account);;
         reader.setPassword(password);
         reader.setEmail(email);
         reader.setPhone(phone);
         reader.setCashPledge(cashPledge);
       //  reader.setBorrowedNum(borrowedNum);
        // reader.setFine(fine);
        // reader.setTag(tag);
         if(!password.equals(password2))
         {
        	 
        	 response.sendRedirect("readeredit.jsp?mima=no");
         }
         else{
          
         ToReader.update(reader);
     
         /*RequestDispatcher dispatcher = request.getRequestDispatcher("/readerList"); 
         dispatcher.forward(request, response); */
         response.sendRedirect("readerList");
         }
       }
        else {
        	
        	
        	 /*System.out.println("error1");*/
        	 response.sendRedirect("readeredit.jsp?error=yes");
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

