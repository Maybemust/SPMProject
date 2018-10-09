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
	
	/*�ж��ַ����Ƿ�Ϊ������*/
	public static boolean isNumeric(String str){
	    for(int i=str.length();--i>=0;){
	        int chr=str.charAt(i);
	        if(chr<48 || chr>57)
	            return false;
	    }
	   return true;
	}     
	/*�ж��ַ����Ƿ�Ϊ��С����Ĵ�����*/
	public static boolean isNumericWithPoint(String str){
		int pointCount = 0;
	    for(int i=str.length();--i>=0;){
	        int chr=str.charAt(i);
	        if(chr == 46) pointCount++;
	        if(chr<46 || chr>57 || chr==47 )
	            return false;
	    }
	    if(pointCount > 1) return false;
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

			// n:������
			// f:����
			// c:Ѻ��
			// a:Librarian�˻�
			// flt:����ʱ��
			// rt:ԤԼʱ��
			//rm:ԤԼ����
			String n = request.getParameter("number");
			String f = request.getParameter("fine");
			String c = request.getParameter("cash");
			String a = request.getParameter("account");
			String flt = request.getParameter("fineLimitTime");
			String rt = request.getParameter("reservedTime");
			String rm = request.getParameter("reservedMaxinum");
			

			// ���Librarian
			if (a != null) {
				if(a.length()>15 || !isNumeric(a)){
					out.write("no");
				} else{
					long account = Long.parseLong(a);
					String password = request.getParameter("password");
					if(password.length()>20){
						out.write("no");
					} else {
						Librarian lbr = new Librarian(account, password, 0);
						ToLibrarian tolbr = new ToLibrarian();
						tolbr.add(lbr);
						out.write("ok");
					}
				}
			}

			// �޸Ľ�����
			if (n != null) {
				if(n.length()>2 || !isNumeric(n)){
					out.write("no");
				} else{
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

			// �޸ķ���
			if (f != null) {
				if(f.length()>10 || !isNumericWithPoint(f)){
					out.write("no");
				} else{
					double fine = Double.parseDouble(f);
					if (fine >= 0) {
						ToAdmin toad = new ToAdmin();
						toad.updateFine(fine);
						out.write("ok");
					} else {
						out.write("no");
					}
				}
			}

			// �޸�Ѻ��
			if (c != null) {
				if(c.length()>10 || !isNumericWithPoint(c)){
					out.write("no");
				} else{
					double cash = Double.parseDouble(c);
					if (cash >= 0) {
						ToAdmin toad = new ToAdmin();
						toad.updateCash(cash);
						out.write("ok");
					} else {
						out.write("no");
					}
				}
			}

			// �޸ķ���ʱ��
			if (flt != null) {
				if(flt.length()>5 || !isNumeric(flt)){
					out.write("no");
				} else{
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

			// �޸�ԤԼʱ��
			if (rt != null) {
				if(rt.length()>3 || !isNumeric(rt)){
					out.write("no");
				} else{
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
			
			//�޸�ԤԼ����
			if (rm != null) {
				if(rm.length()>2 || !isNumeric(rm)){
					out.write("no");
				} else{
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
