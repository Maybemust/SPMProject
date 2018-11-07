package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import java.sql.Date;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

	import entity.Book;
	import entity.BorrowedRecord;
	import entity.Post;
	import entity.Reader;
	import updateTo.ImgUtil;
	import updateTo.StringUtil;
import updateTo.ToAdmin;
import updateTo.ToBook;
	import updateTo.ToBorrowedRecord;
	import updateTo.ToPost;
	import updateTo.ToReader;


		public class RecieveFineServlet extends HttpServlet {

			protected void service(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
				response.setContentType("text/html; charset=UTF-8");
				request.setCharacterEncoding("utf-8");
				
				String account="";
				String barcode="";
				try{
					account = request.getParameter("borrowid");
				}catch(NumberFormatException e){
					
				}
				Reader reader = new ToReader().getByAccount(account, "");
				Date date = new Date(System.currentTimeMillis());
				
				System.out.print(reader.toString());
				if(reader.getEmail()==null){
					request.setAttribute("ifAccountExists",0);		
					request.getRequestDispatcher("LibrarianRecieveFine1.jsp").forward(request, response);
					return;
				}
						
				List <BorrowedRecord> BorrowedRecords= ToBorrowedRecord.getListByAccount(account);//获得该读者的所有借阅记录
				
				
//				if(book.getBarCode() == null){//判断该书是否存在
//					request.setAttribute("ifExist", 0);
//					System.out.println("该书不存在");
//					request.getRequestDispatcher("LibrarianRecieveFine1.jsp").forward(request, response);
//					return;
//				}
//				
//				request.setAttribute("returnedbook",book);
//
//				if(book.getStatus()==1){
//					System.out.println("该书未被借阅");
//					request.setAttribute("ifReturned",0);
//					request.getRequestDispatcher("LibrarianRecieveFine1.jsp").forward(request, response);
//					return;
//				}
//				String bookName = book.getBookName();
				
				double fineall =0;
				Date returnDate = new Date(System.currentTimeMillis());//不同于java.util.Date

				double fineaday =ToAdmin.getByAccount("1").getFine();

	//			List <BorrowedRecord> BorrowedRecords = new ArrayList <BorrowedRecord>();

				List <Book> booklist = new ArrayList<Book>();
				for(int i1 = 0;i1 < BorrowedRecords.size(); i1 ++)
				{
					BorrowedRecord record = BorrowedRecords.get(i1);//一条借阅记录

					System.out.print("====================================>"+i1+' '+record.toString()+'\n');

					if(record.getFine()!=0.0)
					{
						continue;
					}
					Date returnDate2 = record.getBorrowedDate();//借书日期
					Book book = new ToBook().getByBarCode(record.getBarCode());
					booklist.add(book);
					Date date2 = new Date(System.currentTimeMillis());//不同于java.util.Date				
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(returnDate2);		
					calendar.add(Calendar.DAY_OF_MONTH, +30);
					date2 = new java.sql.Date(calendar.getTime().getTime());//应该还书日期
				
					//record.setReturnedDate(returnDate);
					int result=date2.compareTo(returnDate);//date2是应该还书日期，returnDate是实际还书日期
					long day=(returnDate.getTime()-date2.getTime())/(24*60*60*1000);    //日期差值
		            
					
					if (day<=0){
						record.setFine(0.0);
						continue;
					}
					else
						fineall = fineall+day*fineaday;
					record.setFine(0.0);
//					new ToBorrowedRecord().update(record);

				}
				System.out.print("====================================>fineall"+fineall+'\n');

			/*	for(int i1 = 0;i1 < BorrowedRecords.size(); i1 ++)
				{
				
				Date returnDate2 = BorrowedRecords.get(i1).getReturnedDate();//还书日期
				Date borrowDate2 = BorrowedRecords.get(i1).getBorrowedDate();//借书日期	
				
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(returnDate2);		
				calendar.add(Calendar.DAY_OF_MONTH, +30);
				date2 = new java.sql.Date(calendar.getTime().getTime());				
				record.setReturnedDate(returnDate);
				int result=date2.compareTo(returnDate);//date2是应该还书日期，returnDate是实际还书日期
		        long day=(returnDate.getTime()-date2.getTime())/(24*60*60*1000);    //日期差值
		            
		        
		        
				}*/
				
				if(fineall ==0.0){
					request.setAttribute("fine",0.0);		
					request.getRequestDispatcher("LibrarianRecieveFine1.jsp").forward(request, response);
					return;
				}
//						
//				System.out.println("===========================================xiangchatianshu>"+day);
//
//				System.out.println("===========================================yinggaihuanshu>"+date2.toString());
//				System.out.println("===========================================shijihuanshu>"+returnDate.toString());
//
//				request.setAttribute("returnBook", book);
//
//				
//
//				if(day<0)
//				{
//					System.out.println("该书不存在罚款！");
//					request.getRequestDispatcher("LibrarianRecieveFine1.jsp").forward(request, response);
//				}
				else{
					request.setAttribute("fine", fineall);
					request.setAttribute("bookList", booklist);
					request.setAttribute("borrower", reader);
					request.getRequestDispatcher("LibrarianRecieveFine.jsp").forward(request, response);
					return ;
//					BorrowedRecord.setBook(book,null);
//					BorrowedRecord.setReader(reader,null);
//					BorrowedRecord.setDate(date,null);
				}
//				request.getRequestDispatcher("returnbook.jsp").forward(request, response);
			}
			
		}
