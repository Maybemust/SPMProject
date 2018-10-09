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
public class readersearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public readersearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
	public boolean cansearch(String account ) {
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
		
		System.out.println(request.getParameter("searchaccount"));
		
         String account=request.getParameter("searchaccount"); 
         
         
         
         
         readersearchServlet id1 = new readersearchServlet();
       
         boolean cansearch =id1.cansearch(account);
         
     
       if(!cansearch){
    	   
         Reader reader1=new Reader();
         reader1=ToReader.getByAccount(account, "");
         request.setAttribute("reader1", reader1);
         request.getRequestDispatcher("readermanagent2.jsp").forward(request, response);
         
         }
       
        else {
        	System.out.println("error1");
        	 response.sendRedirect("readermanagent2.jsp?error1=yes");
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

