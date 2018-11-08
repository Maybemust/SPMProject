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

	/* 判断字符串是否为纯数字 */
	public static boolean isNumeric(String str) {
		for (int i = str.length(); --i >= 0;) {
			int chr = str.charAt(i);
			if (chr < 48 || chr > 57)
				return false;
		}
		return true;
	}

	/* 判断字符串是否为带小数点的纯数字 */
	public static boolean isNumericWithPoint(String str) {
		// System.out.println(str);
		int pointCount = 0, afterp = 0;
		for (int i = 0; i < str.length(); i++) {
			int chr = str.charAt(i);
			if (chr == 46)
				pointCount++;
			else if (chr < 46 || chr > 57 || chr == 47)
				return false;
			else if (pointCount > 0) {
				afterp++;
			}
			// System.out.println(i);
			// System.out.println(pointCount);
			// System.out.println();
		}
		if (afterp > 2)
			return false;
		if (pointCount > 1)
			return false;
		double numberjudge = Double.parseDouble(str);
		if (numberjudge < 0 || numberjudge >= 1000)
			return false;
		return true;
	}

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
			// rm:预约上限
			String n = request.getParameter("number");
			String f = request.getParameter("fine");
			String c = request.getParameter("cash");
			String a = request.getParameter("account");
			String flt = request.getParameter("fineLimitTime");
			String rt = request.getParameter("reservedTime");
			String rm = request.getParameter("reservedMaxinum");

			// 添加Librarian
			if (a == null || a == ""){
				//out.write("no");
			}else if(a != null && a != "") {
				if (a.length() > 15 || !isNumeric(a)) {
					out.write("no");
				} else {
					String password = "001001";
					long account = Long.parseLong(a);
					ToLibrarian tolbr = new ToLibrarian();
					if (tolbr.get(a) != null) {
						out.write("same");
					} else {
							Librarian lbr = new Librarian(account, password, 0);
							ToLibrarian.add(lbr);
							out.write("ok");
							
					}
				}
			}

			// 修改Admin密码
			String oldPassword = request.getParameter("oldPassword");
			String adminPassword = request.getParameter("newPassword");
			if(oldPassword != null && adminPassword != null){
				String str = new ToAdmin().list().get(0).getPassword();
				if(!oldPassword.equals(str)){
					out.write("no");
				} else {
					ToAdmin toad = new ToAdmin();
					toad.updatePassword(adminPassword);
					out.write("ok");
				}
			}
			
			
			// 修改借书数
			if (n != null) {
				if (n.length() > 2 || !isNumeric(n)) {
					out.write("no");
				} else {
					int number = Integer.parseInt(n);
					if (number >= 0) {
						ToAdmin toad = new ToAdmin();
						toad.updateBorrowedMax(number);
						out.write("ok");
					} else {
						out.write("no");
					}
				}
			}

			// 修改罚款
			if (f != null) {
				if (f.length() > 10 || !isNumericWithPoint(f)) {
					out.write("no1");
				} else {
					double fine = Double.parseDouble(f);
					if (fine >= 0) {
						ToAdmin toad = new ToAdmin();
						toad.updateFine(fine);
						out.write("ok");
					} else {
						out.write("no1");
					}
				}
			}

			// 修改押金
			if (c != null) {
				if (c.length() > 10 || !isNumericWithPoint(c)) {
					out.write("no1");
				} else {
					double cash = Double.parseDouble(c);
					if (cash >= 0) {
						ToAdmin toad = new ToAdmin();
						toad.updateCash(cash);
						out.write("ok");
					} else {
						out.write("no1");
					}
				}
			}

			// 修改罚款时间
			if (flt != null) {
				if (flt.length() > 5 || !isNumeric(flt)) {
					out.write("no");
				} else {
					int fineLimitTime = Integer.parseInt(flt);
					if (fineLimitTime >= 0) {
						ToAdmin toad = new ToAdmin();
						toad.updateFineTime(fineLimitTime);
						out.write("ok");
					} else {
						out.write("no");
					}
				}
			}

			// 修改预约时间
			if (rt != null) {
				if (rt.length() > 3 || !isNumeric(rt)) {
					out.write("no");
				} else {
					int reservedTime = Integer.parseInt(rt);
					if (reservedTime >= 0) {
						ToAdmin toad = new ToAdmin();
						toad.updateReservedTime(reservedTime);
						out.write("ok");
					} else {
						out.write("no");
					}
				}
			}

			// 修改预约上限
			if (rm != null) {
				if (rm.length() > 2 || !isNumeric(rm)) {
					out.write("no");
				} else {
					int reservedMaxinum = Integer.parseInt(rm);
					if (reservedMaxinum >= 0) {
						ToAdmin toad = new ToAdmin();
						toad.updateReservedMax(reservedMaxinum);
						out.write("ok");
					} else {
						out.write("no");
					}
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
