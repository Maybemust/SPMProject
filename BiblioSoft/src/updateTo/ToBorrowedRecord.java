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
public class ToBorrowedRecord {
	/*
	 * 得到某个account(用户)借阅记录的总数
	 */
	public static int getTotalByAccount(String readerAccount) {
		int total = 0;
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from borrowedrecord where readerAccount = "+"'"+readerAccount+"';";

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
	 * 得到数据库钟借阅记录的总数
	 */
	public static int getTotal() {
		int total = 0;
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from borrowedrecord";

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
	 * 添加一条借阅记录
	 */
	public static void add(BorrowedRecord record) {

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "insert into borrowedrecord(bRID,barCode,bookName,readerAccount,borrowedDate,returnedDate,fine) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setLong(1, record.getbRID());
			ps.setString(2, record.getBarCode());
			ps.setString(3, record.getBookName());

			ps.setString(4, record.getReaderAccount());
			ps.setDate(5, record.getBorrowedDate());
			ps.setDate(6, record.getReturnedDate());
			ps.setDouble(7, record.getFine());
			
			ps.execute();

			ResultSet rs = ps.getGeneratedKeys();

			DBhelper.closeConnection(c, ps, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/*
	 * 更新一条借阅记录
	 */
	public static void update(BorrowedRecord record) {
		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "update borrowedrecord set barCode= ?, readerAccount = ? , borrowedDate = ? , returnedDate=?, fine=? where bRID = ?";
			
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setLong(6, record.getbRID());
			ps.setString(1, record.getBarCode());
			ps.setString(2, record.getReaderAccount());
			ps.setDate(3, record.getBorrowedDate());
			ps.setDate(4, record.getReturnedDate());
			ps.setDouble(5, record.getFine());

			ps.execute();

			DBhelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/*
	 * 删除一条借阅记录
	 */
	public static void deleteBybRID(String bRID) {
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "delete from borrowedrecord where bRID = " +"'"+bRID+"';";

			s.execute(sql);

			DBhelper.closeConnection(c, s, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*
	 * 根据bRID得到一条借阅记录
	 */
	public static BorrowedRecord getBybRID(int bRID) {
		BorrowedRecord record = new BorrowedRecord();
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from borrowedrecord where bRID = " + "'"+bRID+"';";

			ResultSet rs = s.executeQuery(sql);

			if (rs.next()) {
				
				record.setBarCode(rs.getString("barCode"));
				record.setbRID(rs.getInt("bRID"));
				record.setReaderAccount(rs.getString("readerAccount"));
				record.setBorrowedDate(rs.getDate("borrowedDate"));
				record.setReturnedDate(rs.getDate("returnedDate"));
				record.setReduceDate((rs.getDate("returnedDate").getTime()-rs.getDate("borrowedDate").getTime())/(24*60*60*1000));
				record.setFine(rs.getDouble("fine"));
			}

			DBhelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return record;
	}
	
	/*
	 * 根据bRID得到一条借阅记录
	 */
	public static BorrowedRecord getByBarCode(String barcode) {
		BorrowedRecord record = new BorrowedRecord();
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from borrowedrecord where barCode = " + "'"+barcode+"' and returnedDate is null;";

			ResultSet rs = s.executeQuery(sql);

			if (rs.next()) {
				
				record.setBarCode(rs.getString("barCode"));
				record.setbRID(rs.getInt("bRID"));
				record.setReaderAccount(rs.getString("readerAccount"));
				record.setBorrowedDate(rs.getDate("borrowedDate"));
				record.setReturnedDate(rs.getDate("returnedDate"));
				record.setReduceDate((rs.getDate("returnedDate").getTime()-rs.getDate("borrowedDate").getTime())/(24*60*60*1000));
				record.setFine(rs.getDouble("fine"));
			}

			DBhelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return record;
	}
	
	
	/*
	 * 借阅List
	 */
	public List<BorrowedRecord> list() {
		return list(0, Short.MAX_VALUE);
	}
	/*
	 * 
	 */
	public static List<BorrowedRecord> list(int start, int count) {
		List<BorrowedRecord> records = new ArrayList<BorrowedRecord>();

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "select * from borrowedrecord order by barCode desc limit ?,? ";

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				BorrowedRecord record = new BorrowedRecord();
				record.setBarCode(rs.getString("barCode"));
				record.setbRID(rs.getInt("bRID"));
				record.setReaderAccount(rs.getString("readerAccount"));
				record.setBorrowedDate(rs.getDate("borrowedDate"));
				record.setReturnedDate(rs.getDate("returnedDate"));
				record.setReduceDate((rs.getDate("returnedDate").getTime()-rs.getDate("borrowedDate").getTime())/(24*60*60*1000));
				record.setFine(rs.getDouble("fine"));
				records.add(record);
			}
			DBhelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return records;
	}
	/*
	 * 得到部分借阅List
	 */
	public static List<BorrowedRecord> listByReaderAccount(int start, int count,String readerAccount) {
		List<BorrowedRecord> records = new ArrayList<BorrowedRecord>();

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "select * from borrowedrecord where readerAccount=? order by barCode desc limit ?,? ";

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, readerAccount);
			ps.setInt(2, start);
			ps.setInt(3, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				BorrowedRecord record = new BorrowedRecord();
				record.setBarCode(rs.getString("barCode"));
				record.setbRID(rs.getInt("bRID"));
				record.setReaderAccount(rs.getString("readerAccount"));
				record.setBorrowedDate(rs.getDate("borrowedDate"));
				record.setReturnedDate(rs.getDate("returnedDate"));
				record.setReduceDate((rs.getDate("returnedDate").getTime()-rs.getDate("borrowedDate").getTime())/(24*60*60*1000));
				record.setFine(rs.getDouble("fine"));
				records.add(record);
			}
			DBhelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return records;
	}
	/*
	 * by hby
	 */
	public static List<Long> reducelist(int start, int count, String readerAccount) {
		List<Long> dates = new ArrayList<Long>();

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "select * from borrowedrecord where readerAccount=? order by barCode desc limit ?,? ";

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, readerAccount);
			ps.setInt(2, start);
			ps.setInt(3, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				long date=0;
				date=(rs.getDate("returnedDate").getTime()-rs.getDate("borrowedDate").getTime())
						/(24*60*60*1000);
				dates.add(date);
			}
			DBhelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dates;
	}
}
