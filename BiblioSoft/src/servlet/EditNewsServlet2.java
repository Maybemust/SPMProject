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

public class EditNewsServlet2 extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
     
		int start = 0;
		int id=0;
		String account="";
		String barcode="";
		String image_content = "";
		String word_content ="";
		String picturePath = "";
		String postID = "";
		Post post;
		try{
			postID = request.getParameter("postID");//获得富文本编辑器内容
		}catch(NumberFormatException e){

		}

		Reader reader = new ToReader().getByAccount(account, "");
		System.out.print("===========================>content is :"+word_content);
		System.out.print("===========================>picturePath is :"+picturePath);
		System.out.print("===========================>image_content is :"+image_content);
		
		post = ToPost.getByPostID(postID);
		Date date = new Date(System.currentTimeMillis());//不同于java.util.Date		
		
		System.out.print("==========EDS2=====================>"+post.toString()+'\n');
		request.setAttribute("Post", post);
		request.setAttribute("postID", postID);
		System.out.print(post.toString()+'\n');

				request.getRequestDispatcher("LibrarianEditPostText2.jsp").forward(request, response);

				return;
	}
	
}
