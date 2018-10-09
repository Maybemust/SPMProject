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

 * @author 李洋

 *

 */

public class ToReservedRecord {

	/*

	 * 找到某人预约书的总数

	 */

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

	/*

	 * 获取被预约书的总数

	 */

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

	

	



	/*

	 * 添加一条预约记录

	 */

	public static void add(ReservedRecord record) {



		try {



			Connection c = DBhelper.getInstance().getConnection();



			String sql = "insert into reservedrecord(bRID,bookName,time,readerAccount,barCode) values(?,?,?,?,?)";

			PreparedStatement ps = c.prepareStatement(sql);

			

			ps.setLong(1, record.getrRID());

			ps.setString(2, record.getBookName());

			ps.setDate(3, record.getTime());

			ps.setString(4, record.getReaderAccount());

			ps.setString(5, record.getBarCode());

			

			ps.execute();



			ResultSet rs = ps.getGeneratedKeys();



			DBhelper.closeConnection(c, ps, rs);



		} catch (Exception e) {

			e.printStackTrace();

		}

	}



	/*

	 * 更新一条预约记录

	 */

	public static void update(ReservedRecord record) {

		try {



			Connection c = DBhelper.getInstance().getConnection();



			String sql = "update book set bookName=?, time= ?, readerAccount = ? ,barCode=? where rRID = ?";

			

			PreparedStatement ps = c.prepareStatement(sql);

			

			ps.setLong(5, record.getrRID());

			ps.setString(1, record.getBookName());

			ps.setDate(2, record.getTime());

			ps.setString(3, record.getReaderAccount());

			ps.setString(4, record.getBarCode());



			ps.execute();



			DBhelper.closeConnection(c, ps, null);



		} catch (Exception e) {

			e.printStackTrace();

		}



	}

	/*

	 * 根据rRID删除一条记录

	 */

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

	/*

	 * 根据rRID找到一条记录

	 */

	public static ReservedRecord getByrRID(String rRID) {

		ReservedRecord record = new ReservedRecord();

		try {



			Connection c = DBhelper.getInstance().getConnection();



			Statement s = c.createStatement();



			String sql = "select * from reservedrecord where rRID = " + "'"+rRID+"';";



			ResultSet rs = s.executeQuery(sql);



			if (rs.next()) {

				

				record.setBarCode(rs.getString("barCode"));

				record.setrRID(rs.getLong("rRID"));

				record.setBookName(rs.getString("bookName"));

				record.setReaderAccount(rs.getString("readerAccount"));

				record.setTime(rs.getDate("time"));

			}



			DBhelper.closeConnection(c, s, rs);



		} catch (Exception e) {

			e.printStackTrace();

		}

		return record;

	}

/*

 * 找到所有的记录

 */

	public static List<ReservedRecord> list() {

		return list(0, Short.MAX_VALUE);

	}

	/*

	 * 列出部分记录

	 */

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

				record.setrRID(rs.getLong("rRID"));

				record.setBookName(rs.getString("bookName"));

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

	/*

	 * 列出某人预约的部分记录

	 */

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

				record.setrRID(rs.getLong("rRID"));

				record.setBookName(rs.getString("bookName"));

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