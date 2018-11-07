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

public class OperateLabel  extends HttpServlet{
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
			ToLabel.delete(name);
		}
		if(tem == 2){
			Label label = new Label(name);
			ToLabel.add(label);
		}
		if(tem == 3){
			ToLabel.update(name, newname);
		}
		List<Label> labels = ToLabel.list(0, ToLabel.getTotal());
		request.setAttribute("labels", labels);
		request.getRequestDispatcher("LabelManage.jsp").forward(request, response);
	}
}