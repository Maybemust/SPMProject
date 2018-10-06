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
 * @author ����
 *
 */
public class ToBorrowedRecord {
	/*
	 * ͨ���˺Ż��ĳһ���˽������Ŀ
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
	 * ��ȡ���н����¼������Ŀ
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
	 * ���һ�������¼
	 */
	public static void add(BorrowedRecord record) {

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "insert into borrowedrecord(bRID,barCode,bookName,readerAccount,boeeowedDate,returnedDate,fine) values(?,?,?,?,?,?,?)";
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
	 * ����һ�������¼
	 */
	public static void update(BorrowedRecord record) {
		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "update book set barCode= ?,bookName=?, readerAccount = ? , borrowedDate = ? , returnedDate=?, fine=? where bRID = ?";
			
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setLong(7, record.getbRID());
			ps.setString(1, record.getBarCode());
			ps.setString(2, record.getBookName());
			ps.setString(3, record.getReaderAccount());
			ps.setDate(4, record.getBorrowedDate());
			ps.setDate(5, record.getReturnedDate());
			ps.setDouble(6, record.getFine());

			ps.execute();

			DBhelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/*
	 * ɾ��һ�������¼
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
	 * ͨ��bRID�ҵ�һ�������¼
	 */
	public static BorrowedRecord getBybRID(String bRID) {
		BorrowedRecord record = new BorrowedRecord();
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from borrowedrecord where bRID = " + "'"+bRID+"';";

			ResultSet rs = s.executeQuery(sql);

			if (rs.next()) {
				
				record.setBarCode(rs.getString("barCode"));
				record.setbRID(rs.getLong("bRID"));
				record.setBookName(rs.getString("bookName"));
				record.setReaderAccount(rs.getString("readerAccount"));
				record.setBorrowedDate(rs.getDate("borrowedDate"));
				record.setReturnedDate(rs.getDate("returnedDate"));
				record.setFine(rs.getDouble("fine"));
			}

			DBhelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return record;
	}
	/*
	 * �г����м�¼
	 */
	public List<BorrowedRecord> list() {
		return list(0, Short.MAX_VALUE);
	}
	/*
	 * �г����ֽ����¼
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
				record.setbRID(rs.getLong("bRID"));
				record.setBookName(rs.getString("bookName"));
				record.setReaderAccount(rs.getString("readerAccount"));
				record.setBorrowedDate(rs.getDate("borrowedDate"));
				record.setReturnedDate(rs.getDate("returnedDate"));
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
	 * �г�ĳһ�˺ŵĽ����¼
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
				record.setbRID(rs.getLong("bRID"));
				record.setBookName(rs.getString("bookName"));
				record.setReaderAccount(rs.getString("readerAccount"));
				record.setBorrowedDate(rs.getDate("borrowedDate"));
				record.setReturnedDate(rs.getDate("returnedDate"));
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
	 * by �Ԫ
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
