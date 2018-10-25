/**
 * Servlet implementation class PostDetailsServlet
 */
	package servlet;

	import java.io.IOException;
	import java.sql.Date;

	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import java.sql.Timestamp;
	import java.text.SimpleDateFormat;
	import java.util.List;

	import entity.Book;
	import entity.BorrowedRecord;
	import entity.Post;
	import entity.Reader;
	import updateTo.ImgUtil;
	import updateTo.StringUtil;
	import updateTo.ToBook;
	import updateTo.ToBorrowedRecord;
	import updateTo.ToPost;
	import updateTo.ToReader;

	public class PostDetailsServlet extends HttpServlet {
		protected void service(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			response.setContentType("text/html; charset=UTF-8");
			request.setCharacterEncoding("utf-8");
			System.out.print("===========================>Here :");

			int start = 0;
			int id=0;
			String account="";
			String barcode="";
			String image_content = "";
			String word_content ="";
			String picturePath = "";
			String postID = "";
			System.out.print("===========================>Here :");

			try{
				postID = request.getParameter("postID");
				image_content = request.getParameter("postImage");//获得富文本编辑器内容
				word_content = request.getParameter("postTitle");//获得富文本编辑器内容

			}catch(NumberFormatException e){

			}
			Post post = ToPost.getByPostID(postID);

			Reader reader = new ToReader().getByAccount(account, "");
			System.out.print("===========================>content is :"+post.getText());
//		System.out.print("===========================>picturePath is :"+picturePath);
			System.out.print("===========================>image_content is :"+image_content);
			
			
			Date date = new Date(System.currentTimeMillis());//不同于java.util.Date

			
			
			
			System.out.print(post.toString());
			request.setAttribute("post", post);
			
				
					request.getRequestDispatcher("LibrarianPostDetails.jsp").forward(request, response);

					return;
//			if(reader.getEmail()==null){
//				request.setAttribute("ifAccountExists",0);		
//				request.getRequestDispatcher("LibrarianBorrowBook4.jsp").forward(request, response);
//				return;
//			}
					
//			Book book = new ToBook().getByBarCode(barcode);
//			System.out.print(book.toString());
	//
//			if(book.getBarCode() == null){//判断该书是否存在
//				request.setAttribute("ifExist", 0);
//				System.out.println("该书不存在");
//				request.getRequestDispatcher("LibrarianBorrowBook.jsp").forward(request, response);
//				return;
//			}
//			System.out.print(book.toString());
//			System.out.print('\n');
//			Date date1 = new Date(System.currentTimeMillis());//不同于java.util.Date
//			
////			Date date2 = new Date(System.currentTimeMillis());//不同于java.util.Date
////			
////			Calendar calendar = Calendar.getInstance();
////			calendar.setTime(date2);		
////			calendar.add(Calendar.DAY_OF_MONTH, +30);
	////
////			date2 = new java.sql.Date(calendar.getTime().getTime());
////			
//			
//			String bookName = book.getBookName();
//			System.out.print("======================================================================>");
//			System.out.print(bookName);
//			int ifBorrow = 0;
//			
//			/*
//			 * 规定每次只能借一本 
//			 * 借书通过Reader.account 和 Book.barCode 实现
//			 */
//			request.setAttribute("borrowBook", book);
	//
//			if(reader.getBorrowedNum()<10){//判断用户是否能够借书
//				if(book.getStatus() == 0){//判断该书是否被预约或者借出
//					BorrowedRecord record = new BorrowedRecord(barcode,bookName,account,date1,null,0.0);
//					//bRID和两个日期请自行按规则进行处理，我个人觉得数据库挺迷的，不知道该怎么写，就先这么写了
//					System.out.print("======================================================================>");
//					System.out.print(record.toString());
//					new ToBorrowedRecord().add(record);
//					new ToBook().setStatus(barcode, 2);
//					request.getRequestDispatcher("LibrarianBorrowBook3.jsp").forward(request, response);
//					System.out.print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>");
//					return;
//				}
	//
//				else{
//					System.out.println("该书已被预约或者借出，请自行处理");
//				}
//			}
//			else{
//				System.out.println("用户借书超出上限，请自行处理");
//			}
//			request.getRequestDispatcher("LibrarianBorrowBook4.jsp").forward(request, response);
		}
		
	}
