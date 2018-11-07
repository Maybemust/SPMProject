package servlet;
import java.io.IOException;

import java.util.*;
import java.lang.String;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.*;
import updateTo.*;
/*
 * by diao
 */
public class LocationManage extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		int no = 0;
		try{
			no = Integer.parseInt(request.getParameter("no"));

		}catch(NumberFormatException e){
			
		}
		List<Location> locations = ToLocation.list(0, ToLabel.getTotal());
		
		request.setAttribute("locations",locations);

		if(no == 0)
			request.getRequestDispatcher("LocationManage.jsp").forward(request, response);
		else
			request.getRequestDispatcher("bookadd.jsp").forward(request, response);
	}
}
