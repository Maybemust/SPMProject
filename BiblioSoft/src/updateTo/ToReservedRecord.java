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
import entity.ReservedRecord;
import entity.Librarian;
import entity.Post;
import entity.Reader;
import entity.BorrowedRecord;
import entity.Admin;
import utils.DBhelper;
/**
 * @author ¿Ó—Û
 *
 */
public class ToReservedRecord {

	public static int getTotalByAccount(String readerAccount) {
		int total = 0;
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from reservedrecord where readerAccount = "+"'"+readerAccount+"';";

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

			String sql = "select count(*) from reservedrecord";

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
	
	


	public static void add(ReservedRecord record) {

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "insert into reservedrecord(bRID,time,readerAccount,barCode) values(?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setString(1, record.getrRID());
			ps.setDate(2, record.getTime());
			ps.setString(3, record.getReaderAccount());
			ps.setString(4, record.getBarCode());
			
			ps.execute();

			ResultSet rs = ps.getGeneratedKeys();

			DBhelper.closeConnection(c, ps, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public static void update(ReservedRecord record) {
		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "update book set time= ?, readerAccount = ? ,barCode=? where rRID = ?";
			
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setString(4, record.getrRID());
			ps.setDate(1, record.getTime());
			ps.setString(2, record.getReaderAccount());
			ps.setString(3, record.getBarCode());

			ps.execute();

			DBhelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static void deleteByrRID(String rRID) {
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "delete from reservedrecord where rRID = " +"'"+rRID+"';";

			s.execute(sql);

			DBhelper.closeConnection(c, s, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static ReservedRecord getByrRID(String rRID) {
		ReservedRecord record = new ReservedRecord();
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from reservedrecord where rRID = " + "'"+rRID+"';";

			ResultSet rs = s.executeQuery(sql);

			if (rs.next()) {
				
				record.setBarCode(rs.getString("barCode"));
				record.setrRID(rs.getString("rRID"));
				record.setReaderAccount(rs.getString("readerAccount"));
				record.setTime(rs.getDate("time"));
			}

			DBhelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return record;
	}

	public static List<ReservedRecord> list() {
		return list(0, Short.MAX_VALUE);
	}
	
	public static List<ReservedRecord> list(int start, int count) {
		List<ReservedRecord> records = new ArrayList<ReservedRecord>();

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "select * from reservedrecord where readerAccount=? order by barCode desc limit ?,? ";

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ReservedRecord record = new ReservedRecord();
				record.setBarCode(rs.getString("barCode"));
				record.setrRID(rs.getString("rRID"));
				record.setReaderAccount(rs.getString("readerAccount"));
				record.setTime(rs.getDate("time"));
				records.add(record);
			}
			DBhelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return records;
	}
	
	public static List<ReservedRecord> listByReaderAccount(int start, int count,String readerAccount) {
		List<ReservedRecord> records = new ArrayList<ReservedRecord>();

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "select * from reservedrecord where readerAccount=? order by barCode desc limit ?,? ";

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, readerAccount);
			ps.setInt(2, start);
			ps.setInt(3, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ReservedRecord record = new ReservedRecord();
				record.setBarCode(rs.getString("barCode"));
				record.setrRID(rs.getString("rRID"));
				record.setReaderAccount(rs.getString("readerAccount"));
				record.setTime(rs.getDate("time"));
				records.add(record);
			}
			DBhelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return records;
	}
}
