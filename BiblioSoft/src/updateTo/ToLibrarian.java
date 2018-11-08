/**
 * 
 */
package updateTo;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import entity.Book;
import entity.BorrowedRecord;
import entity.Post;
import entity.Librarian;
import entity.Reader;
import entity.ReservedRecord;
import entity.Admin;
import utils.DBhelper;
/**
 * @author 李洋
 *
 */
public class ToLibrarian {

	/*
	 * 获取图书馆工作人员的数目
	 */
	public static int getTotal() {
		int total = 0;
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from librarian";

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
	 * 添加图书馆工作人员
	 */
	public static void add(Librarian librarian) {

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "insert into librarian(account,password,tag,question,answer) values(?,?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setLong(1, librarian.getAccount());
			ps.setString(2, librarian.getPassword());
			ps.setInt(3, librarian.getTag());
			ps.setString(4, librarian.getQuestion());
			ps.setString(5, librarian.getAnswer());
			
			ps.execute();

			//ResultSet rs = ps.getGeneratedKeys();

			DBhelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * 更新工作人员
	 */
	public static void update(Librarian librarian) {
		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "update librarian set password = ? , tag = ? , question = ? , answer = ?  where account = ?";
			
			PreparedStatement ps = c.prepareStatement(sql);
			System.out.println(librarian.getQuestion()+librarian.getAnswer());
			
			ps.setLong(5, librarian.getAccount());
			ps.setString(1, librarian.getPassword());
			ps.setInt(2,librarian.getTag());
			ps.setString(3, librarian.getQuestion());
			ps.setString(4, librarian.getAnswer());

			ps.execute();

			DBhelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/*
	 * 根据账号删除
	 */
	public static void delete(String account) {
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "delete from librarian where account = " +"'"+account+"';";

			s.execute(sql);

			DBhelper.closeConnection(c, s, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*
	 * 根据账号获取
	 */
	public static Librarian get(String account) {
		Librarian librarian = new Librarian();
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from librarian where account = " + "'"+account+"';";

			ResultSet rs = s.executeQuery(sql);

			if (rs.next()) {
				librarian.setAccount(rs.getLong("account"));
				librarian.setPassword(rs.getString("password"));
				librarian.setTag(rs.getInt("tag"));
				librarian.setQuestion(rs.getString("question"));
				librarian.setAnswer(rs.getString("answer"));
			}else{
				return null;
			}

			DBhelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return librarian;
	}
	/*
	 * 列出所有的数据
	 */
	public static List<Librarian> list() {
		return list(0, Short.MAX_VALUE);
	}
	/*
	 * 列出部分图书馆工作人员
	 */
	public static List<Librarian> list(int start, int count) {
		List<Librarian> librarians = new ArrayList<Librarian>();

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "select * from librarian order by account desc limit ?,? ";

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Librarian librarian = new Librarian();
				librarian.setAccount(rs.getLong("account"));
				librarian.setPassword(rs.getString("password"));
				librarian.setTag(rs.getInt("tag"));
				librarian.setQuestion(rs.getString("question"));
				librarian.setAnswer(rs.getString("answer"));
				librarians.add(librarian);
			}
			DBhelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return librarians;
	}
	
	public static Librarian get2(String account) {
		Librarian librarian = new Librarian();
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from librarian where account = " + "'"+account+"';";

			ResultSet rs = s.executeQuery(sql);

			if (rs.next()) {
				librarian.setAccount(rs.getLong("account"));
				librarian.setPassword(rs.getString("password"));
				librarian.setTag(rs.getInt("tag"));
				librarian.setQuestion(rs.getString("question"));
				librarian.setAnswer(rs.getString("answer"));
			}

			DBhelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return librarian;
	}
	
}
