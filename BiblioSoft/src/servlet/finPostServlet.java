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

	public class finPostServlet extends HttpServlet {
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
			System.out.print("===========================>Here :");

			try{
				start = Integer.parseInt(request.getParameter("start"));

			}catch(NumberFormatException e){
				System.out.print("++++++++++++++++++++++++++++>Here :");

			}
			System.out.print("===========================>Here :");

			Reader reader = new ToReader().getByAccount(account, "");
			int count = 1;
					int next = start + count;
					int pre = start - count;

					int total = new ToPost().getTotal();
					
					int last;
					if (0 == total % count)
						last = total - count;
					else
						last = total - total % count;

					pre = pre < 0 ? 0 : pre;
					next = next > last ? last : next;

					request.setAttribute("next", next);
					request.setAttribute("pre", pre);
					request.setAttribute("last", last);

					List<Post> posts2 = new ToPost().list();

					List<Post> posts = new ToPost().list(start, count);

					request.setAttribute("posts", posts);
					
					request.getRequestDispatcher("fin.jsp").forward(request, response);

					return;
		}
		
	}
