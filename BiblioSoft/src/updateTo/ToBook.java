/**
 * 
 */
package updateTo;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;


import entity.Book;
import entity.BorrowedRecord;
import entity.Librarian;
import entity.Post;
import entity.Reader;
import entity.ReservedRecord;
import entity.Admin;
import utils.DBhelper;

/**
 * @author 李洋
 *
 */
public class ToBook {
	
	/*
	 * 找到同一ISBN的书有多少
	 */
	public static int getTotalISBN(String ISBN) {
		int total = 0;
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from book where ISBN = "+"'"+ISBN+"';";

			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				total = rs.getInt(1);
			}


			DBhelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	/*
	 * 获得所有书的数量
	 */
	public static int getTotal() {
		int total = 0;
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from book";

			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				total = rs.getInt(1);
			}

			System.out.println("total:" + total);

			DBhelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	

	/*
	 * 向数据库中添加一本书
	 */
	public static void add(Book book) {

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "insert into book(barCode,bookName,ISBN,author,publishing,location,status) values(?,?,?,?,?,?,0)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, book.getBarCode());
			ps.setString(2,book.getBookName());
			ps.setString(3, book.getISBN());
			ps.setString(4, book.getAuthor());
			ps.setString(5, book.getPublishing());
			ps.setString(6, book.getLocation());
			
			ps.execute();

			ResultSet rs = ps.getGeneratedKeys();

			DBhelper.closeConnection(c, ps, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * 向数据库中更新一本书
	 */
	public static void update(Book book) {
		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "update book set bookName=?, ISBN= ?, author = ? , publishing = ? , location=?,cover=?,introduction=?, status=?, dateOfStorage=?, tag1=?, tag2=?, price=? where barCode = ?";
			
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setString(13, book.getBarCode());
			ps.setString(1,book.getBookName());
			ps.setString(2, book.getISBN());
			ps.setString(3, book.getAuthor());
			ps.setString(4, book.getPublishing());
			ps.setString(5, book.getLocation());
			ps.setBlob(6,book.getCover());
			ps.setString(7, book.getIntroduction());
			ps.setInt(8, book.getStatus());
			ps.setDate(9, book.getDateOfStorage());
			ps.setString(10, book.getTag1());
			ps.setString(11, book.getTag2());
			ps.setDouble(12, book.getPrice());

			ps.execute();

			DBhelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/*
	 * 根据barcode删除指定的书
	 */
	public static void deleteByBarCode(String barCode) {
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "delete from book where barCode = " +"'"+barCode+"';";

			s.execute(sql);

			DBhelper.closeConnection(c, s, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*
	 * 通过barcode找到指定的书
	 */
	public static Book getByBarCode(String barCode) {
		Book book = new Book();
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from book where barCode = " + "'"+barCode+"';";

			ResultSet rs = s.executeQuery(sql);

			if (rs.next()) {
				book.setBarCode(barCode);
				book.setBookName(rs.getString("bookName"));
				book.setAuthor(rs.getString("author"));
				book.setISBN(rs.getString("ISBN"));
				book.setPublishing(rs.getString("publishing"));
				book.setLocation(rs.getString("location"));
				book.setCover(rs.getBlob("cover"));
				book.setIntroduction(rs.getString("introduction"));
				book.setStatus(rs.getInt("status"));
				book.setDateOfStorage(rs.getDate("dateOfStorage"));
				book.setTag1(rs.getString("tag1"));
				book.setTag2(rs.getString("tag2"));
				book.setPrice(rs.getDouble("price"));
				
			}

			DBhelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}
	/*
	 * 列出所有的书
	 */
	public static List<Book> list() {
		return list(0, Short.MAX_VALUE);
	}
	/*
	 * 按照顺序显示一些书
	 */
	public static List<Book> list(int start, int count) {
		List<Book> books = new ArrayList<Book>();

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "select * from book order by barCode desc limit ?,? ";

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Book book = new Book();
				book.setBarCode(rs.getString("barCode"));
				book.setBookName(rs.getString("bookName"));
				book.setAuthor(rs.getString("author"));
				book.setISBN(rs.getString("ISBN"));
				book.setPublishing(rs.getString("publishing"));
				book.setLocation(rs.getString("location"));
				book.setCover(rs.getBlob("cover"));
				book.setIntroduction(rs.getString("introduction"));
				book.setStatus(rs.getInt("status"));
				book.setDateOfStorage(rs.getDate("dateOfStorage"));
				book.setTag1(rs.getString("tag1"));
				book.setTag2(rs.getString("tag2"));
				book.setPrice(rs.getDouble("price"));
				books.add(book);
			}
			DBhelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return books;
	}
	
	
}
