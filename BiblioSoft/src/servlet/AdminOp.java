package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Admin;
import entity.Librarian;
import updateTo.ToAdmin;
import updateTo.ToLibrarian;

public class AdminOp extends HttpServlet {
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html");

			// n:借书数
			// f:罚款
			// c:押金
			// a:Librarian账户
			// flt:罚款时间
			// rt:预约时间
			//rm:预约上限
			String n = request.getParameter("number");
			String f = request.getParameter("fine");
			String c = request.getParameter("cash");
			String a = request.getParameter("account");
			String flt = request.getParameter("fineLimitTime");
			String rt = request.getParameter("reservedTime");
			String rm = request.getParameter("reservedMaxinum");
			

			// 添加Librarian
			if (a != null) {
				long account = Long.parseLong(a);
				String password = request.getParameter("password");
				Librarian lbr = new Librarian(account, password, 0);
				ToLibrarian tolbr = new ToLibrarian();
				tolbr.add(lbr);
				out.write("ok");
			}

			// 修改借书数
			if (n != null) {
				int number = Integer.parseInt(n);
				if (number >= 0) {
					ToAdmin toad = new ToAdmin();
					toad.updateBorrowedMax(number);
					out.write("ok");
				} else {
					out.write("no");
				}
			}

			// 修改罚款
			if (f != null) {
				double fine = Double.parseDouble(f);
				if (fine >= 0) {
					ToAdmin toad = new ToAdmin();
					toad.updateFine(fine);
					out.write("ok");
				} else {
					out.write("no");
				}
			}

			// 修改押金
			if (c != null) {
				double cash = Double.parseDouble(c);
				if (cash >= 0) {
					ToAdmin toad = new ToAdmin();
					toad.updateCash(cash);
					out.write("ok");
				} else {
					out.write("no");
				}
			}

			// 修改罚款时间
			if (flt != null) {
				int fineLimitTime = Integer.parseInt(flt);
				if (fineLimitTime >= 0) {
					ToAdmin toad = new ToAdmin();
					toad.updateFineTime(fineLimitTime);
					out.write("ok");
				} else {
					out.write("no");
				}
			}

			// 修改预约时间
			if (rt != null) {
				int reservedTime = Integer.parseInt(rt);
				if (reservedTime >= 0) {
					ToAdmin toad = new ToAdmin();
					toad.updateReservedTime(reservedTime);
					out.write("ok");
				} else {
					out.write("no");
				}
			}
			
			//修改预约上限
			if (rm != null) {
				int reservedMaxinum = Integer.parseInt(rm);
				if (reservedMaxinum >= 0) {
					ToAdmin toad = new ToAdmin();
					toad.updateReservedMax(reservedMaxinum);
					out.write("ok");
				} else {
					out.write("no");
				}
			}

		} finally {
			out.close();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}
}
