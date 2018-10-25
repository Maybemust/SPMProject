package servlet;

import java.io.IOException;

import java.sql.SQLException;

import java.util.Calendar;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import entity.DayilyIncome;
import updateTo.ToDayilyIncome;


public class ShowIncome1 extends HttpServlet {

	
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);     
    }
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		  
		    request.setCharacterEncoding("utf-8");
	        response.setContentType("text/html;charset=utf-8");
		     
	       
	        String input2=request.getParameter("date1");
	        String input3=request.getParameter("date2");
	        
	        DayilyIncome income2=null;
			income2 = getIncome(input2,input3);;
			
	       
		    request.setAttribute("income2", income2);
	
			request.getRequestDispatcher("income1.jsp").forward(request, response);
	  }
	  
	
	  
	  public DayilyIncome getIncome(String input1,String input2){
		 
		  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		   Date d1=null;
		   Date d2=null;
		   try {
			 d1 = sdf.parse(input1);
			 d2 = sdf.parse(input2);
		   } catch (ParseException e1) {
			// TODO Auto-generated catch block
			 e1.printStackTrace();
		   }
			
	        Calendar date1=Calendar.getInstance();
	        Calendar date2=Calendar.getInstance();
	        date1.setTime(d1);
	        date2.setTime(d2);
	        
	        String year1 =""+(int)date1.get(Calendar.YEAR);
	        String month1=""+(int)(date1.get(Calendar.MONTH)+1);
	        String day1=""+(int)date1.get(Calendar.DATE);
	        String year2 =""+(int)date2.get(Calendar.YEAR);
	        String month2=""+(int)(date2.get(Calendar.MONTH)+1);
	        String day2=""+(int)date2.get(Calendar.DATE);
		  
	        DayilyIncome income=null;
	        try {
				 income=ToDayilyIncome.getByDate(year1,month1,day1,year2,month2,day2);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        return income;
	  }
}
