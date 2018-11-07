package servlet;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.sql.Date;

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

import updateTo.ToAdmin;
import updateTo.ToBook;
import updateTo.ToBorrowedRecord;
import updateTo.ToDayilyIncome;
import updateTo.ToReader;
import utils.DBhelper;
import entity.Book;
import entity.BorrowedRecord;
import entity.DayilyIncome;
import entity.Librarian;
import entity.Reader;
/**
 * Servlet implementation class RegisterServlet
 */
public class lostfineServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final java.sql.Blob NUll = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lostfineServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
	
    
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
	
		   double fineaday =ToAdmin.getByAccount("1").getFine();
		   Date date = new Date(System.currentTimeMillis());
		   double fineall=0;
		   
		   DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	 		String today = dateFormat.format(date);
	 		
		   String barCode=request.getParameter("barCode"); 
		   String bRID1 =request.getParameter("bRID");
		   String type =request.getParameter("type");
		   
		   double price= Double.parseDouble(request.getParameter("savePrice"));
		   String readerAccount =request.getParameter("readerAccount");
		   int bRID = Integer.parseInt(bRID1);
		   
		   /* reader 对应的fine值减去*/
		   Date returnDate = new Date(System.currentTimeMillis());
		   BorrowedRecord record1 =ToBorrowedRecord.getBybRID(bRID);
		   
		   Date returnDate2 = record1.getBorrowedDate();//借书日期
		
			Date date2 = new Date(System.currentTimeMillis());//不同于java.util.Date				
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(returnDate2);		
			calendar.add(Calendar.DAY_OF_MONTH, +30);
			date2 = new java.sql.Date(calendar.getTime().getTime());//应该还书日期
		
			//record.setReturnedDate(returnDate);
			int result=date2.compareTo(returnDate);//date2是应该还书日期，returnDate是实际还书日期
			long day=(returnDate.getTime()-date2.getTime())/(24*60*60*1000);   
		   
			if (day<=0){
				
			}
			else
				fineall = fineall+day*fineaday;
		   Reader reader1=ToReader.getByAccount(readerAccount);
		   reader1.setFine(reader1.getFine()-fineall);
		   ToReader.update(reader1);
		   
		   
		   
		/* 删除丢失书籍*/
		   Librarian librarian=(Librarian)request.getSession().getAttribute("PERSON");
			String deleteman=String.valueOf(librarian.getAccount());
	        Book book=ToBook.getByBarCode(barCode);
	        if(type.equals("1"))
	        book.setIntroduction("the book has been deleted for lost");
	        else
	        book.setIntroduction("the book has been deleted for damage");
	        
	        book.setDeleteman(deleteman);
	        ToBook.update(book);
	        ToBook.update1(book);
	        
	        
	        /* 丢失书籍上报日期即为还书日趋*/
		   BorrowedRecord record =ToBorrowedRecord.getBybRID(bRID);
		   record.setReturnedDate(date);
		   ToBorrowedRecord.update(record);
		   
		   /* 将丢失罚金加入每日收入*/
		   
		   
		   if(!canincome(today)){
        	   
				ToDayilyIncome income=new ToDayilyIncome();
				try {
					income.updateDayilyIncome(price, 1);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	           }
	           else
	           {
	        	   DayilyIncome cometoday=new DayilyIncome();
	        	   cometoday.setCash(0);
	        	   cometoday.setDate(date);
	        	   cometoday.setFine(price);
	        	   ToDayilyIncome income1=new ToDayilyIncome();
	        	   try {
					income1.addDayilyIncome(cometoday);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
           
	
		   
		   
		   /* 更新用户借书的数目*/
		  Reader reader = ToReader.getByAccount(readerAccount);
		  reader.setBorrowedNum(reader.getBorrowedNum()-1);
		  ToReader.update(reader);
		 

         RequestDispatcher dispatcher = request.getRequestDispatcher("/readerList"); 
         dispatcher.forward(request, response); 
       /* response.sendRedirect("bookedit.jsp?error=no");*/
       
         
       /*
        else {
        	 System.out.println("error1");
        	 response.sendRedirect("bookedit.jsp?error=yes");
        	 System.out.println("error2");
        	 
        	 }*/
    
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

