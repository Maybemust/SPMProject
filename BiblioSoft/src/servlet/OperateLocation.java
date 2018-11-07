package servlet;

import java.io.IOException;

import java.util.*;
import java.lang.String;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.*;
import updateTo.*;

public class OperateLocation  extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");


		String no="";
		String name="";
		String newname="";
		try{
			no = request.getParameter("no");
			name = request.getParameter("name");
			newname = request.getParameter("newname");

		}catch(NumberFormatException e){
			
		}
		int tem = 0 ;
		
		tem = Integer.parseInt(no);
		if(tem == 1){
			ToLocation.delete(name);
		}
		if(tem == 2){
			Location location = new Location(name);
			ToLocation.add(location);
		}
		if(tem == 3){
			ToLocation.update(name, newname);
		}
		List<Location> locations = ToLocation.list(0, ToLocation.getTotal());
		request.setAttribute("locations", locations);
		request.getRequestDispatcher("LocationManage.jsp").forward(request, response);
	}
}