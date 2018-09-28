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
	
	


	public static void add(BorrowedRecord record) {

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "insert into borrowedrecord(bRID,barCode,readerAccount,boeeowedDate,returnedDate,fine) values(?,?,?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setString(1, record.getbRID());
			ps.setString(2, record.getBarCode());
			ps.setString(3, record.getReaderAccount());
			ps.setDate(4, record.getBorrowedDate());
			ps.setDate(5, record.getReturnedDate());
			ps.setDouble(6, record.getFine());
			
			ps.execute();

			ResultSet rs = ps.getGeneratedKeys();

			DBhelper.closeConnection(c, ps, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public static void update(BorrowedRecord record) {
		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "update book set barCode= ?, readerAccount = ? , borrowedDate = ? , returnedDate=?, fine=? where bRID = ?";
			
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setString(6, record.getbRID());
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
	public static BorrowedRecord getBybRID(String bRID) {
		BorrowedRecord record = new BorrowedRecord();
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from borrowedrecord where bRID = " + "'"+bRID+"';";

			ResultSet rs = s.executeQuery(sql);

			if (rs.next()) {
				
				record.setBarCode(rs.getString("barCode"));
				record.setbRID(rs.getString("bRID"));
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

	public List<BorrowedRecord> list() {
		return list(0, Short.MAX_VALUE);
	}
	
	public static List<BorrowedRecord> list(int start, int count) {
		List<BorrowedRecord> records = new ArrayList<BorrowedRecord>();

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "select * from borrowedrecord where readerAccount=? order by barCode desc limit ?,? ";

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				BorrowedRecord record = new BorrowedRecord();
				record.setBarCode(rs.getString("barCode"));
				record.setbRID(rs.getString("bRID"));
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
				record.setbRID(rs.getString("bRID"));
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
}
