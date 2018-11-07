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
public class ToReader {
	/*
	 * 统计有多少个读者账户
	 */
	public static int getTotal(){
		int total = 0;
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from reader";

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
	 * 增加一个reader
	 */
	public static void add(Reader reader) {

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "insert into reader(account,password,email,phone,fine,borrowedNum,cashPledge,tag) values(?,?,?,?,0,0,?,0)";
			
			PreparedStatement ps = c.prepareStatement(sql);

			ps.setString(1, reader.getAccount());
			ps.setString(2, reader.getPassword());
			ps.setString(3, reader.getEmail());
			ps.setLong(4, reader.getPhone());
			ps.setDouble(5, reader.getCashPledge());
			
			ps.execute();

			//ResultSet rs = ps.getGeneratedKeys();

			DBhelper.closeConnection(c, ps, null);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 更新reader的信息
	 */
	
	public static void update(Reader reader) {
		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "update reader set account= ?, password = ? , email = ? , phone=?, fine=?, borrowedNum=?, cashPledge=?, tag=? where account = ?";
			
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setString(9, reader.getAccount());
			ps.setString(1, reader.getAccount());
			ps.setString(2, reader.getPassword());
			ps.setString(3, reader.getEmail());
			ps.setLong(4, reader.getPhone());
			ps.setInt(6, reader.getBorrowedNum());
			ps.setDouble(5, reader.getFine());
			ps.setDouble(7, reader.getCashPledge());
			ps.setInt(8, reader.getTag());

			ps.execute();

			DBhelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/*
	 * 删除reader by account
	 */
	public static void deleteByAccount(String account) {
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "delete from reader where account = " +"'"+account+"';";

			s.execute(sql);

			DBhelper.closeConnection(c, s, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * 通过account以及password查找reader
	 */
	public static Reader getByAccount(String account,String password) {
		Reader reader = new Reader(account,password);
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from reader where account = " + "'"+account+"';";

			ResultSet rs = s.executeQuery(sql);

			if (rs.next()) {
				reader.setAccount(rs.getString("account"));
				reader.setPassword(rs.getString("password"));
				reader.setEmail(rs.getString("email"));
				reader.setPhone(rs.getLong("phone"));
				reader.setFine(rs.getDouble("fine"));
				reader.setBorrowedNum(rs.getInt("borrowedNum"));
				reader.setCashPledge(rs.getDouble("cashPledge"));
				reader.setTag(rs.getInt("tag"));				
			}

			DBhelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return reader;
	}
	
	public static List<Reader> list() {
		return list(0, Short.MAX_VALUE);
	}
	
	public static  List<Reader> list(int start, int count) {
		
		List<Reader> readers = new ArrayList<Reader>();

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "select * from reader order by account desc limit ?,? ";

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Reader reader = new Reader();
				reader.setAccount(rs.getString("account"));
				reader.setPassword(rs.getString("password"));
				reader.setEmail(rs.getString("email"));
				reader.setPhone(rs.getLong("phone"));
				reader.setFine(rs.getDouble("fine"));
				reader.setBorrowedNum(rs.getInt("borrowedNum"));
				reader.setCashPledge(rs.getDouble("cashPledge"));
				reader.setTag(rs.getInt("tag"));
				readers.add(reader);
			}
			DBhelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return readers;
	}

	public static Reader getByAccount(String account) {
		Reader reader = new Reader(account);
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from reader where account = " + "'"+account+"';";

			ResultSet rs = s.executeQuery(sql);

			if (rs.next()) {
				reader.setAccount(rs.getString("account"));
				reader.setPassword(rs.getString("password"));
				reader.setEmail(rs.getString("email"));
				reader.setPhone(rs.getLong("phone"));
				reader.setFine(rs.getDouble("fine"));
				reader.setBorrowedNum(rs.getInt("borrowedNum"));
				reader.setCashPledge(rs.getDouble("cashPledge"));
				reader.setTag(rs.getInt("tag"));				
			}

			DBhelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return reader;
	}

	
	public static void setBorrowNumplus1(Reader reader) {
		String account = reader.getAccount();
		int bn = reader.getBorrowedNum() + 1;
		try {
			
			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "update reader set borrowedNum= " +"'"+bn+"' where account = '"+account+"';";

			s.execute(sql);

			DBhelper.closeConnection(c, s, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void setBorrowNumMinus1(Reader reader) {
		String account = reader.getAccount();
		int bn = reader.getBorrowedNum()-1;
		try {
			
			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "update reader set borrowedNum= " +"'"+bn+"' where account = '"+account+"';";

			s.execute(sql);

			DBhelper.closeConnection(c, s, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
