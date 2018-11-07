/**
 * 
 */
package updateTo;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

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
	
	public static List<BorrowedRecord> getListByAccount(String readerAccount) {

		List <BorrowedRecord> BorrowedRecords = new ArrayList <BorrowedRecord>();
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from borrowedrecord where readerAccount = "+"'"+readerAccount+"'and returnedDate = '1949-10-01'"+";";

			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
			
				BorrowedRecord borrowedrecord= new BorrowedRecord();
				borrowedrecord.setBarCode(rs.getString("barCode"));
				borrowedrecord.setbRID(rs.getInt("bRID"));
				borrowedrecord.setBookName(rs.getString("bookName"));
				borrowedrecord.setReaderAccount(rs.getString("readerAccount"));
				borrowedrecord.setBorrowedDate(rs.getDate("borrowedDate"));
				borrowedrecord.setReturnedDate(rs.getDate("returnedDate"));
				borrowedrecord.setFine(rs.getDouble("fine"));
				BorrowedRecords.add(borrowedrecord);
				
			}


			DBhelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return BorrowedRecords;
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

			//ResultSet rs = ps.getGeneratedKeys();

			DBhelper.closeConnection(c, ps, null);

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
	 * 根据bRID得到一条借阅记录 去掉了ReduceDate
	 */
	public static BorrowedRecord getByBarCode(String barcode) {
		BorrowedRecord record = new BorrowedRecord();
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from borrowedrecord where barCode = " + "'"+barcode+"' and returnedDate = '1949-10-01';";

			ResultSet rs = s.executeQuery(sql);


			if (rs.next()) {
				System.out.println("----sqqqqqqqqqqqqqqqqq2------------------------>"+rs.getFloat("fine"));
				record.setBarCode(rs.getString("barCode"));
				
				record.setFine(rs.getDouble("fine"));
				System.out.println("----sqqqqqqqqqqqqqqqqq3------------------------>"+rs.getFloat("fine"));
				record.setbRID(rs.getInt("bRID"));
				record.setReaderAccount(rs.getString("readerAccount"));
				record.setBorrowedDate(rs.getDate("borrowedDate"));
				record.setReturnedDate(rs.getDate("returnedDate"));
				//record.setReduceDate((rs.getDate("returnedDate").getTime()-rs.getDate("borrowedDate").getTime())/(24*60*60*1000));
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
	public static List<BorrowedRecord> listByDiao(int start, int count) {
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
				record.setBookName(rs.getString("bookName"));
				record.setReaderAccount(rs.getString("readerAccount"));
				record.setBorrowedDate(rs.getDate("borrowedDate"));
				record.setReturnedDate(rs.getDate("returnedDate"));			
				//record.setReduceDate((rs.getDate("returnedDate").getTime()-rs.getDate("borrowedDate").getTime())/(24*60*60*1000));
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
	 * 去掉了ReduceDate
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
				record.setBookName(rs.getString("bookName"));
				record.setReaderAccount(rs.getString("readerAccount"));
				record.setBorrowedDate(rs.getDate("borrowedDate"));
				
				Date date1=null;
	
			    String date=(new SimpleDateFormat("yyyy-MM-dd")).format(rs.getDate("returnedDate"));
			    if(date.equals("1949-10-01"))
			    	date1=null;
			    else
			    	date1=rs.getDate("returnedDate");
			
				
				record.setReturnedDate(date1);
				//record.setReduceDate((rs.getDate("returnedDate").getTime()-rs.getDate("borrowedDate").getTime())/(24*60*60*1000));
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
				record.setBookName(rs.getString("bookName"));
				record.setBorrowedDate(rs.getDate("borrowedDate"));
				record.setReturnedDate(rs.getDate("returnedDate"));
				//record.setReduceDate((rs.getDate("returnedDate").getTime()-rs.getDate("borrowedDate").getTime())/(24*60*60*1000));
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
	
	/*
	 * 根据某一本书的barCode列出这本书的被借记�?by huang tao
	 */
	public static List<BorrowedRecord> listByBarCode(int start, int count,String barcode) {
		List<BorrowedRecord> records = new ArrayList<BorrowedRecord>();

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "select * from borrowedrecord where barcode=? order by barCode desc limit ?,? ";;

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, barcode);
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
	 * 为搜索所做的更新，通过bookname找到指定的书
	 */
	public static List<BorrowedRecord> getByBookName(String bookname) {
		List<BorrowedRecord> records = new ArrayList<BorrowedRecord>();
		
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from borrowedrecord where bookName like " + "'%"+bookname+"%';";

			ResultSet rs = s.executeQuery(sql);

			while(rs.next()) {
				BorrowedRecord record = new BorrowedRecord();
				record.setBarCode(rs.getString("barCode"));
				record.setbRID(rs.getInt("bRID"));
				record.setBookName(rs.getString("bookName"));
				record.setReaderAccount(rs.getString("readerAccount"));
				record.setBorrowedDate(rs.getDate("borrowedDate"));
				record.setReturnedDate(rs.getDate("returnedDate"));
				//record.setReduceDate((rs.getDate("returnedDate").getTime()-rs.getDate("borrowedDate").getTime())/(24*60*60*1000));
				record.setFine(rs.getDouble("fine"));
				records.add(record);
				
			}

			DBhelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return records;
	}
	
	/*
	 * 为搜索所做的更新，通过barCode找到指定的书
	 */
	public static List<BorrowedRecord> getByBarCode1(String barCode) {
		List<BorrowedRecord> records = new ArrayList<BorrowedRecord>();
		
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from borrowedrecord where barCode like " + "'%"+barCode+"%';";

			ResultSet rs = s.executeQuery(sql);

			while(rs.next()) {
				BorrowedRecord record = new BorrowedRecord();
				record.setBarCode(rs.getString("barCode"));
				record.setbRID(rs.getInt("bRID"));
				record.setBookName(rs.getString("bookName"));
				record.setReaderAccount(rs.getString("readerAccount"));
				record.setBorrowedDate(rs.getDate("borrowedDate"));
				record.setReturnedDate(rs.getDate("returnedDate"));
				//record.setReduceDate((rs.getDate("returnedDate").getTime()-rs.getDate("borrowedDate").getTime())/(24*60*60*1000));
				record.setFine(rs.getDouble("fine"));
				records.add(record);
				
			}

			DBhelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return records;
	}
	
	/*
	 * 为搜索所做的更新，通过readerAccount找到指定的书
	 */
	public static List<BorrowedRecord> getByReaderAccount(String readerAccount) {
		List<BorrowedRecord> records = new ArrayList<BorrowedRecord>();
		
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from borrowedrecord where readerAccount like " + "'%"+readerAccount+"%';";

			ResultSet rs = s.executeQuery(sql);

			while(rs.next()) {
				BorrowedRecord record = new BorrowedRecord();
				record.setBarCode(rs.getString("barCode"));
				record.setbRID(rs.getInt("bRID"));
				record.setBookName(rs.getString("bookName"));
				record.setReaderAccount(rs.getString("readerAccount"));
				record.setBorrowedDate(rs.getDate("borrowedDate"));
				record.setReturnedDate(rs.getDate("returnedDate"));
				//record.setReduceDate((rs.getDate("returnedDate").getTime()-rs.getDate("borrowedDate").getTime())/(24*60*60*1000));
				record.setFine(rs.getDouble("fine"));
				records.add(record);
				
			}

			DBhelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return records;
	}
/* 关键字搜�?*/
	public static List<BorrowedRecord> searchForKey(String key) {
		List<BorrowedRecord> records = new ArrayList<BorrowedRecord>();
		
		try {
			List<BorrowedRecord> records1 = getByBookName(key);
			
			for (BorrowedRecord b : records1) {
				records.add(b);
			}
			
			records1=getByBarCode1(key);
			
			for (BorrowedRecord b : records1) {
				records.add(b);
			}
			
			records1=getByReaderAccount(key);
			
			
			for (BorrowedRecord b : records1) {
				records.add(b);
			}
		

			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return records;
	}

}


