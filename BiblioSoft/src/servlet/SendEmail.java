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
	public static MimeMessage createSimpleMail(Session session,Reader reader)
            throws Exception {
		String st= "";
        //�����ʼ�����
        MimeMessage message = new MimeMessage(session);
        //ָ���ʼ��ķ�����
        message.setFrom(new InternetAddress("wangleksdjh@163.com"));
        //ָ���ʼ����ռ��ˣ����ڷ����˺��ռ�����һ���ģ��Ǿ����Լ����Լ���
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(reader.getEmail()));
        //�ʼ��ı���
        message.setSubject("BiblioSoft-Password");
        //�ʼ����ı�����
        st="http://localhost:8080/BiblioSoft/backpd?email="+addcode(reader.getEmail());
        message.setContent(st, "text/html;charset=UTF-8");
        //���ش����õ��ʼ�����
        return message;
    }
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
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
				 //ʹ��JavaMail�����ʼ���5������
		        //1������session
		        Session session = Session.getInstance(prop);
		        //����Session��debugģʽ�������Ϳ��Բ鿴��������Email������״̬
		        session.setDebug(true);
		        //2��ͨ��session�õ�transport����
		        Transport ts = session.getTransport();
		        System.out.println("163163163163163163");
		        //3��ʹ��������û��������������ʼ��������������ʼ�ʱ����������Ҫ�ύ������û����������smtp���������û��������붼ͨ����֤֮����ܹ����������ʼ����ռ��ˡ�
		        ts.connect("wangleksdjh", "diao123456");
		        //4�������ʼ�
		        Message message = createSimpleMail(session,reader);
		        //5�������ʼ�
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
