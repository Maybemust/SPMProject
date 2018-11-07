package servlet;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import updateTo.ToReader;
import updateTo.ToAdmin;
import updateTo.ToDayilyIncome;
import utils.DBhelper;
import entity.Reader;
import entity.Admin;
import entity.DayilyIncome;

/**
 * Servlet implementation class RegisterServlet
 */
public class readeraddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public readeraddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
    public boolean canadd(String account ) {
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
	
    public boolean canincome(String date ) {
		boolean returnValue = true;
		String sql = "SELECT * FROM DayilyIncome";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBhelper.getInstance().getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				String date1 = rs.getString("date");

				if (date1.equals(date) ) {
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
		
		
		/*private String account;
		private String password;
		private String email;
		private long phone;
		private double fine;
		private int borrowedNum;
		private double cashPledge;
		private int tag;*/
		
         String email=request.getParameter("email");
         String account=request.getParameter("phone");
         long phone= Long.parseLong(request.getParameter("phone"));
         /*int tag=Integer.parseInt(request.getParameter("tag"));*/
         Date now = new Date();// new Date()为获取当前系统时间
 		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
 		String today = dateFormat.format(now);
 		
       String barCodeList[] = new String [1];
       barCodeList[0]=account;
        
         readeraddServlet id1 = new readeraddServlet();
       
         boolean canadd =id1.canadd(account);
     
       if(canadd){
    	   
         Reader reader=new Reader();
         
         
         reader.setAccount(account);
         reader.setEmail(email);
         reader.setPhone(phone);
         reader.setPassword("12345678");
         Admin admin=ToAdmin.list().get(0);
         reader.setCashPledge(admin.getCash());
         /*reader.setTag(tag);*/
       
         ToReader.add(reader);
         
           if(!canincome(today)){
        	   
			ToDayilyIncome income=new ToDayilyIncome();
			try {
				income.updateDayilyIncome(admin.getCash(), 0);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           }
           else
           {
        	   DayilyIncome cometoday=new DayilyIncome();
        	   cometoday.setCash(admin.getCash());
        	   cometoday.setDate(now);
        	   cometoday.setFine(0);
        	   ToDayilyIncome income1=new ToDayilyIncome();
        	   try {
				income1.addDayilyIncome(cometoday);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	   
           }
           
           request.setAttribute("barCodeList", barCodeList );
           RequestDispatcher dispatcher = request.getRequestDispatcher("/Firstp.jsp?"); 
           dispatcher.forward(request, response); 
        /* RequestDispatcher dispatcher = request.getRequestDispatcher("/readerList"); 
         dispatcher.forward(request, response); */
         
         
         }
       
        else {
        	System.out.println("error1");
        	 response.sendRedirect("readeradd.jsp?error=yes");
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

