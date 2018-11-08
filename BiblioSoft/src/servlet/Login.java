package servlet;
import java.io.IOException;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import entity.*;
import updateTo.*;

import java.util.*;
import java.lang.String;

public class Login  extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		

		List<Reader>readers=ToReader.list(0, ToReader.getTotal());
		for(int i = 0;i < readers.size();i++){
			Reader temp = readers.get(i);
			List<BorrowedRecord> records = ToBorrowedRecord.getListByAccount(temp.getAccount());
			double sum;
			double temsum;
			sum = 0;
			for(int j = 0;j < records.size();j++){
				Date endDate = records.get(j).getBorrowedDate();
				Date nowDate = new Date(System.currentTimeMillis());
				temsum=(nowDate.getTime()-endDate.getTime())/(24*60*60*1000);	
				temsum = temsum - 30;
				if(temsum < 0)
					sum = sum + 0;
				else
					sum = sum + temsum*ToAdmin.list().get(0).getFine();
			}
	
			temp.setFine(sum);
			ToReader.update(temp);
		}
		String authority=String.valueOf(request.getSession().getAttribute("AUTHORITY"));
		System.out.println("type is :"+authority);
		String account="";
		String pd="";
		String url="";
		try{
			account = request.getParameter("useraccount");
			pd = request.getParameter("userpassword");

		}catch(NumberFormatException e){
			
		}
		
		
		/*
		 * 
		 */

		if(authority.equals("Admin")){
			Admin admin=ToAdmin.getByAccount(account);

			if(admin.getAccount()!=0&&admin.getPassword().equals(pd))
			{
				request.getSession().setAttribute("PERSON", admin);
				url="admin1";
			}
			else{
				System.out.println("密码错误");
				url="Login.jsp?mima=no";
			}
			
		}
		else if(authority.equals("Librarian"))
		{
			System.out.println("===============1");
			Librarian librarian=ToLibrarian.get2(account);
			System.out.println(librarian.toString());
			System.out.println("===============2");
			if(librarian.getAccount()==0)
			{
				url="Login.jsp?mima=no";
			}
			else if(librarian.getPassword().equals(pd))
			{
				request.getSession().setAttribute("PERSON", librarian);
				request.setAttribute("Librarian", librarian);
				System.out.println(librarian.toString());
				if(librarian.getAnswer() == null||librarian.getAnswer().equals("")){
					request.setAttribute("account", librarian.getAccount());
					url="SecurityQuestion.jsp";
				}
				else{
					url="LibrarianFirstPage.jsp";
				}
				
			}
			else{
				System.out.println("密码错误");
				url="Login.jsp?mima=no";
			}
		}
		else if(authority.equals("Reader"))
		{
			Reader reader=ToReader.getByAccount(account);
			if(reader.getPassword().equals(pd))
			{
				request.getSession().setAttribute("PERSON", reader);
				url="/getreader";
			}
			else{
				System.out.println("密码错误");
				url="Login.jsp?mima=no";
			}
		}
		//别删
//		Properties prop = new Properties();
//        prop.put("mail.host","smtp.163.com" );
//		prop.put("mail.transport.protocol", "smtp");
//		prop.put("mail.smtp.auth", true);
//		try{
//			int start = 0;
//			int count = 0;
//			int i = 0;
//			int size = 0;
//			count=ToBorrowedRecord.getTotal();
//			System.out.println("diao total="+count);
//			List<BorrowedRecord> borrowedRecord = ToBorrowedRecord.listByDiao(start, count);
//			List<BorrowedRecord> nowrecord = new ArrayList<BorrowedRecord>();
//			size=borrowedRecord.size();
//			System.out.println("diao size bor="+size);
//			while(i < size) {//内部不锁定 执行效率高 并发操作会出错
//			    if(borrowedRecord.get(i).getBorrowedDate().after(borrowedRecord.get(i).getReturnedDate())){
//			    	nowrecord.add(borrowedRecord.get(i));			    	
//			    }
//			    i++;
//			}
//			i = 0;
//			size = nowrecord.size();
//
//			int day = ToAdmin.getByAccount("1").getFineTime();
//			int temday = 0;
//			while(i < size){
//				Date nowdate = new Date(System.currentTimeMillis());
//				Date begindate = nowrecord.get(i).getBorrowedDate();
//				temday = (int)( (nowdate.getTime() - begindate.getTime())/(3600*24*1000));
//				System.out.println("temday="+temday);
//				if(temday == day){
//					try{
//						 //使用JavaMail发送邮件的5个步骤
//				        //1、创建session
//				        Session session = Session.getInstance(prop);
//				        //开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
//				        session.setDebug(true);
//				        //2、通过session得到transport对象
//				        Transport ts = session.getTransport();
//				        System.out.println("163163163163163163");
//				        //3、使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人。
//				        ts.connect("wangleksdjh", "diao123456");
//				        //4、创建邮件
//				        StringBuffer str = new StringBuffer();
//				        String st="";
//				        str.append("<h1>");
//				        st="Dear reader, hello. The books you borrowed will expire soon, please return them in time. Thank you for your cooperation.";
//				        str.append(st+"</h1>");
//				        Message message = SendEmail.createSimpleMail(session,ToReader.getByAccount(nowrecord.get(i).getReaderAccount()).getEmail(),str);
//				        //5、发送邮件
//				        ts.sendMessage(message, message.getAllRecipients());
//				        ts.close();
//					}catch(Exception e){
//						
//					}
//				}
//				if(temday > day){
//					try{
//						 //使用JavaMail发送邮件的5个步骤
//				        //1、创建session
//				        Session session = Session.getInstance(prop);
//				        //开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
//				        session.setDebug(true);
//				        //2、通过session得到transport对象
//				        Transport ts = session.getTransport();
//				        System.out.println("163163163163163163");
//				        //3、使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人。
//				        ts.connect("wangleksdjh", "diao123456");
//				        //4、创建邮件
//				        StringBuffer str = new StringBuffer();
//				        String st="";
//				        str.append("<h1>");	        
//				        st="Dear reader, hello. The books you borrowed have been overdue, please return them in time to avoid any fine.";
//				        str.append(st+"</h1>");
//				        Message message = SendEmail.createSimpleMail(session,ToReader.getByAccount(nowrecord.get(i).getReaderAccount()).getEmail(),str);
//				        //5、发送邮件
//				        ts.sendMessage(message, message.getAllRecipients());
//				        ts.close();
//					}catch(Exception e){
//						
//					}
//				}				
//				i++;
//			}			
//		}
//		catch(Exception e){
//			System.out.println("Send Email error" + e.getMessage());
//		}
		//别删
		
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}
