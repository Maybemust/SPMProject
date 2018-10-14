package servlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.*;
import updateTo.*;

public class EmailResetPd  extends HttpServlet{
	public static char waydec(String tem)
			throws Exception{
			int a = Integer.parseInt(tem);
			char b = (char) a;
		    return b;
	}
	public static String deccode(String a)
			throws Exception {
				int len=a.length();
				String st="";
				String sum="";
				for(int i=0;i<len;i++){
					if(i%3==0 && i!=0){
						sum+=waydec(st);
						st="";
						st+=a.charAt(i);
					}
					else{
						st+=a.charAt(i);
						if(i == len - 1){
							sum+=waydec(st);
						}
					}
				}
				
				return sum;
	}
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String account="";
		String email="";
		try{
			email = request.getParameter("email");

		}catch(NumberFormatException e){
			
		}
		try {
			email = deccode(email);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		account = ToActive.getByEmail(email);
		request.setAttribute("email", email);
		request.setAttribute("account", account);
		request.getRequestDispatcher("EmailChangePwd.jsp").forward(request, response);
	}
}
