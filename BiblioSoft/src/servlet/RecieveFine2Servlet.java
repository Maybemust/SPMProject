
	package servlet;

	import java.io.IOException;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
/*import java.sql.Date;*/
import java.util.Date;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;

import java.text.SimpleDateFormat;
	import java.util.ArrayList;
	import java.util.Calendar;
	import java.util.List;

		import entity.Book;
		import entity.BorrowedRecord;
import entity.DayilyIncome;
import entity.Post;
		import entity.Reader;
		import updateTo.ImgUtil;
		import updateTo.StringUtil;
	import updateTo.ToAdmin;
	import updateTo.ToBook;
		import updateTo.ToBorrowedRecord;
import updateTo.ToDayilyIncome;
import updateTo.ToPost;
		import updateTo.ToReader;
import utils.DBhelper;

		public class RecieveFine2Servlet extends HttpServlet {
			
			  public boolean canincome(String date ) {
					boolean returnValue = true;
					String sql = "SELECT * FROM DayilyIncome";
					Connection conn = null;
					Statement stmt = null;
					ResultSet rs = null;
					try {
						conn = DBhelper.getInstance().getConnection();
						stmt = conn.createStatement();
						rs = stmt.executeQuery(sql);
						
						while (rs.next()) {
							String date1 = rs.getString("date");

							if (date1.equals(date) ) {
								returnValue = false;
								break;
							}
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}		
					return returnValue;
				}
			

			
				protected void service(HttpServletRequest request, HttpServletResponse response)
						throws ServletException, IOException {
					response.setContentType("text/html; charset=UTF-8");
					request.setCharacterEncoding("utf-8");
					
				  Date now = new Date();// new Date()为获取当前系统时间
				 		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				 		String today = dateFormat.format(now);
					String account="";
					String barcode="";
					try{
						account = request.getParameter("useraccount");
						
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
					
					
//					if(book.getBarCode() == null){//判断该书是否存在
//						request.setAttribute("ifExist", 0);
//						System.out.println("该书不存在");
//						request.getRequestDispatcher("LibrarianRecieveFine1.jsp").forward(request, response);
//						return;
//					}
//					
//					request.setAttribute("returnedbook",book);
	//
//					if(book.getStatus()==1){
//						System.out.println("该书未被借阅");
//						request.setAttribute("ifReturned",0);
//						request.getRequestDispatcher("LibrarianRecieveFine1.jsp").forward(request, response);
//						return;
//					}
//					String bookName = book.getBookName();
					
					double fineall =0;
					Date returnDate = new Date(System.currentTimeMillis());//不同于java.util.Date

					double fineaday =ToAdmin.getByAccount("1").getFine();

		//			List <BorrowedRecord> BorrowedRecords = new ArrayList <BorrowedRecord>();

					List <Book> booklist = new ArrayList<Book>();
					for(int i1 = 0;i1 < BorrowedRecords.size(); i1 ++)
					{
						BorrowedRecord record = BorrowedRecords.get(i1);//一条借阅记录

						System.out.print("====================================>"+i1+' '+record.toString()+'\n');

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
						
						
						record.setFine(day*fineaday);
						new ToBorrowedRecord().update(record);
						
						
					
						  if(!canincome(today)&&day*fineaday>0){
				        	   
								ToDayilyIncome income=new ToDayilyIncome();
								try {
									income.updateDayilyIncome(day*fineaday, 1);
								} catch (SQLException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
					           }
					           else
					           {
					        	   DayilyIncome cometoday=new DayilyIncome();
					        	   cometoday.setCash(0);
					        	   cometoday.setDate(now);
					        	   cometoday.setFine(day*fineaday);
					        	   ToDayilyIncome income1=new ToDayilyIncome();
					        	   try {
									income1.addDayilyIncome(cometoday);
								} catch (SQLException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
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
//					System.out.println("===========================================xiangchatianshu>"+day);
	//
//					System.out.println("===========================================yinggaihuanshu>"+date2.toString());
//					System.out.println("===========================================shijihuanshu>"+returnDate.toString());
	//
//					request.setAttribute("returnBook", book);
	//
//					
	//
//					if(day<0)
//					{
//						System.out.println("该书不存在罚款！");
//						request.getRequestDispatcher("LibrarianRecieveFine1.jsp").forward(request, response);
//					}
					else{
						request.setAttribute("fine", fineall);
						request.setAttribute("bookList", booklist);
						request.setAttribute("borrower", reader);
						java.sql.Date now1 = new java.sql.Date(System.currentTimeMillis());
						
						List <BorrowedRecord> record2 = ToBorrowedRecord.getListByAccount(account);
						for(int i2=0 ; i2<record2.size();i2++){
							ToBook.setStatus(record2.get(i2).getBarCode(), 0);
							record2.get(i2).setReturnedDate(now1);
							ToBorrowedRecord.update(record2.get(i2));
						}
						
						
						
						 Reader reader1 = ToReader.getByAccount(account);
						 reader1.setFine(reader1.getFine()-fineall);
						 ToReader.update(reader1);
						 ToReader.setBorrowNumMinus1(reader1);
						
						request.getRequestDispatcher("LibrarianRecieveFine3.jsp").forward(request, response);
						return ;
//						BorrowedRecord.setBook(book,null);
//						BorrowedRecord.setReader(reader,null);
//						BorrowedRecord.setDate(date,null);
					}
//					request.getRequestDispatcher("returnbook.jsp").forward(request, response);
				}
				
			}
		}
		
