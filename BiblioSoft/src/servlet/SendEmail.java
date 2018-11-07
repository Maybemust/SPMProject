package servlet;
import java.io.IOException;
import java.util.*;

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

public class SendEmail  extends HttpServlet{
	public static String waycode(char a)
            throws Exception {
			int tem = a;
			String newString = String.format("%03d", tem);	
            return newString;
    }
	public static String addcode(String a)
            throws Exception {
			int len=a.length();
			String st="";
			
			for(int i=0;i<len;i++){
		
				st+=waycode(a.charAt(i));
			}
            return st;
    }
	public static MimeMessage createSimpleMail(Session session,String EmailAddress,StringBuffer str)
            throws Exception {
        //创建邮件对象
        MimeMessage message = new MimeMessage(session);
//        try{
//        	message.addHeader("X-Mailer", "Microsoft Outlook Express 6.00.2900.2869");
//        }
//        catch(Exception e){
//        	
//        }
        //指明邮件的发件人
        message.setFrom(new InternetAddress("wangleksdjh@163.com"));
        //指明邮件的收件人
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(EmailAddress));
        //邮件的标题
        message.setSubject("BiblioSoft-Library-Password,网易你真帅，给我发出去吧");
        //邮件的文本内容
        
        message.setContent(str.toString(), "text/html;charset=UTF-8");
        //返回创建好的邮件对象
        return message;
    }
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html; charset=gb2312");
		request.setCharacterEncoding("utf-8");
		
		String account="";
		try{
			account=request.getParameter("account");
		}catch(NumberFormatException e){
			
		}
		Reader reader=ToReader.getByAccount(account);
		
		if(reader!=null){
			
			int total=ToActive.getTotal() + 1;
			String tot = String.valueOf(total);
			
			Date date = new Date(System.currentTimeMillis());
			Calendar currentDate = new GregorianCalendar();
	        currentDate.add(currentDate.DATE,1);
	        date=currentDate.getTime();
	        
			Active active = new Active(tot,account,reader.getEmail(),date,0);		
			ToActive.add(active);
			
			
			
			//send star
			Properties prop = new Properties();
	        prop.put("mail.host","smtp.163.com" );
			prop.put("mail.transport.protocol", "smtp");
			prop.put("mail.smtp.auth", true);
			try{
				 //使用JavaMail发送邮件的5个步骤
		        //1、创建session
		        Session session = Session.getInstance(prop);
		        //开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
		        session.setDebug(true);
		        //2、通过session得到transport对象
		        Transport ts = session.getTransport();
		        System.out.println("163163163163163163");
		        //3、使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人。
		        ts.connect("wangleksdjh", "diao123456");
		        //4、创建邮件
		        StringBuffer str = new StringBuffer();
		        String st="Hello,dear User.If you want to reset your password,please click <a>http://localhost:8080/BiblioSoft/backpd?email="+addcode(reader.getEmail())+"</a>.If it isn't your account,please ignore it.";
		        str.append("<h1>"+st);
		        //str.append("遇到困难，越坚强的人越有一股让人尊敬与心疼的魅力。坚强不是倔强更不是强悍，它是情感的理性依托。它让受伤的人把目光投向远方，给自己一个信步生活的理由。坚强的人会打一把钥匙解开心锁；借一方晴空，拥抱阳光。会找一个肩膀让泪水尽情流淌。爱过痛过，哭过笑过。然后继续坚强。 ");
		        str.append("</h1>");
		        Message message = createSimpleMail(session,reader.getEmail(),str);
		        //5、发送邮件
		        ts.sendMessage(message, message.getAllRecipients());
		        ts.close();
			}catch(Exception e){
				
			}
	       
	        
	        
		}else{
			System.out.println(reader.getAccount()+"is not exitst");
		}
		request.getRequestDispatcher("fin.jsp").forward(request, response);
	}
	
}
