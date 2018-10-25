
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
import entity.Librarian;
import entity.Post;
	import entity.Reader;
	import updateTo.ImgUtil;
	import updateTo.StringUtil;
	import updateTo.ToBook;
	import updateTo.ToBorrowedRecord;
import updateTo.ToPost;
import updateTo.ToReader;

	public class EditNewsServlet3 extends HttpServlet {
		protected void service(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			response.setContentType("text/html; charset=UTF-8");
			request.setCharacterEncoding("utf-8");

			int start = 0;
			int id=0;
			long postID= 0;

			String barcode="";
			String image_content = "";
			String word_content ="";
			String word_content2 ="";
			String picturePath = "";
			
			Librarian librarian=(Librarian)(request.getSession().getAttribute("PERSON"));
			String account=String.valueOf(librarian.getAccount());

			try{
				image_content = request.getParameter("editorValue");//获得富文本编辑器内容
				word_content = request.getParameter("MyPostTitle");//获得富文本编辑器内容
				postID=Integer.parseInt(request.getParameter("postID"));

				List list = ImgUtil.getImageSrc(request.getParameter("editorValue"));
//				List list = ImgUtil.getImageSrc(request.getParameter("MyPostTitle"));
				picturePath = StringUtil.listToString(list, ',');
			}catch(NumberFormatException e){

			}
			String pid = String.valueOf(postID);
			word_content2 = ToPost.getByPostID(pid).getText();

			Reader reader = new ToReader().getByAccount(account, "");
			System.out.print("===========================>content is :"+word_content);
			System.out.print("===========================>picturePath is :"+picturePath);
			System.out.print("===========================>image_content is :"+image_content);
			
			Date date = new Date(System.currentTimeMillis());//不同于java.util.Date

			
			Post post = new Post(postID,account,date,word_content2,picturePath,word_content);
			
			
			System.out.print("==========EDS3=====================>"+post.toString()+'\n');
			request.setAttribute("Post", post);
			//System.out.print(post.toString()+'\n');

					request.getRequestDispatcher("LibrarianEditPostText2.jsp").forward(request, response);

					return;
		}
		
	}
