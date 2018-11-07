package servlet;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import updateTo.ToBorrowedRecord;
import updateTo.ToReader;
import utils.DBhelper;
import entity.BorrowedRecord;
import entity.Reader;
/**
 * Servlet implementation class RegisterServlet
 */
public class readerdeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public readerdeleteServlet() {
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
		int k=0;
		
		System.out.println(request.getParameter("account1"));
        String account=request.getParameter("account1"); 
        Reader reader=ToReader.getByAccount(account);
        
        List<BorrowedRecord> records = new ArrayList<BorrowedRecord>();
        records=ToBorrowedRecord.getByReaderAccount(account);
        for(int i1=0; i1<records.size();i1++)
        {
        	if(records.get(i1).getReturnedDate().before(java.sql.Date.valueOf("1949-10-02")));
        	response.sendRedirect("readerList?borrownumber=no");
        	return;
        	
        }
        
        
        
        if(reader.getFine()>0)
        	response.sendRedirect("readerList?fine=no");
        else{
        if(reader.getBorrowedNum()>0)
        	response.sendRedirect("readerList?borrownum=no");
        
      
  
        
        else{
        ToReader.deleteByAccount(account);
        k=k+1;
        if(k>0)
        {
        	response.sendRedirect("readerList?tishi=yes");
        	
        }
        else
        {   
        	response.sendRedirect("readerList?error=no");
        	
        }
        
        }
        
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

