package servlet;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import entity.Librarian;
import updateTo.ToLibrarian;
import entity.Admin;
import updateTo.ToAdmin;

public class Admin1 extends HttpServlet{

	
	private ToLibrarian tolbr = new ToLibrarian();
	private ToAdmin toad = new ToAdmin();
	private Admin ad;
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		System.out.println(request.getParameter("modifiedaccount"));
		System.out.println("----" + request.getParameter("modifiedpassword"));
		
		//修改工作人员密码
		try{
			Long account = Long.parseLong(request.getParameter("modifiedaccount"));
			if(account != null){
				String password = request.getParameter("modifiedpassword");
				if(password.length()>20){
					JOptionPane.showMessageDialog(null,"Your input is too long!");
				} else {
					Librarian lbr = new Librarian(account, password, 1);
					tolbr.update(lbr);
				}
			}
		} catch (NumberFormatException e){
			
		}
		
		//删除工作人员账号
		try{
			String account = request.getParameter("deleteaccount");
			if(account != null){
				tolbr.delete(account);
			}
		} catch (NumberFormatException e){
			
		}
		
		//修改押金数额
		try{
			String c = request.getParameter("cash");
			if(c != null){
				double cash = Double.parseDouble(c);
				toad.updateFine(cash);
			}
		} catch (NumberFormatException e) {
			
		}

		//增加一个工作人员
		try {
			long account = Long.parseLong(request.getParameter("account"));
			String password = request.getParameter("password");
			String repeatPassword = request.getParameter("repeatpassword");
			Librarian lbr = new Librarian(account, password, 0);
			tolbr.add(lbr);
		} catch (NumberFormatException e) {
			
		}

		//展示工作人员列表
		List<Librarian> lbrs = tolbr.list();
		request.setAttribute("librarians", lbrs);
		
		//显示搜索结果
		try{
			String searchAccount = request.getParameter("searchLibrarian");
			if(searchAccount != null){
				lbrs.clear();
				Librarian temp = tolbr.get(searchAccount);
				if(temp != null){
					lbrs.add(temp);
				}
			}
		} catch (NumberFormatException e) {
			
		}
		
		ad = toad.list().get(0);
		
		//显示当前最大借阅数目
		request.setAttribute("borrowedMaxinum", ad.getBorrowedMaxinum());
		
		//显示超过借阅期限每天罚多少钱
		request.setAttribute("fine", ad.getFine());
		
		//显示最多借阅期限
		request.setAttribute("fineTime", ad.getFineTime());
		
		//显示押金数额
		request.setAttribute("cash", ad.getCash());
		
		//显示当前预约时限
		request.setAttribute("reservedtime", ad.getResercedTime());
		
		//显示最大预约数目
		request.setAttribute("reservedmaxinum", ad.getReservedMaxinum());
		
		request.getRequestDispatcher("Admin1.jsp").forward(request, response);
	}

}
