package updateTo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import entity.DayilyIncome;
import utils.DBhelper;

public class ToDayilyIncome {
	
	//通过 year month day 获取某日的收入情况
	public static DayilyIncome getByDate(String year, String month, String day) throws ParseException, SQLException{
		Connection c = DBhelper.getInstance().getConnection();

		Statement s = c.createStatement();
		
		String date = year + "-" + month + "-" + day;
		
		String sql = "select * from DayilyIncome where date = " + "'"+date+"';";

		ResultSet rs = s.executeQuery(sql);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		DayilyIncome income = new DayilyIncome(dateFormat.parse(date), 0.0, 0.0);
		
		if(rs.next()){
			income = new DayilyIncome(rs.getDate("date"), rs.getDouble("cash"), rs.getDouble("fine"));
		}
		
		DBhelper.closeConnection(c, s, rs);
		
		return income;
	}
	
	//通过 year month day 获取一段时间内的收入情况
	//区间开始 syear smonth sday
	//区间结束 eyear emonth eday
	public static DayilyIncome getByDate(String syear, String smonth, String sday, String eyear, String emonth, String eday) throws ParseException, SQLException{
		String sdate = syear + "-" + smonth + "-" + sday;
		String edate = eyear + "-" + emonth + "-" + eday;
		
		Connection c = DBhelper.getInstance().getConnection();
		Statement s = c.createStatement();
		
		String sql = "select * from DayilyIncome where date between " + "'"+sdate+"' and '" + edate + "';";

		ResultSet rs = s.executeQuery(sql);
		
		DayilyIncome income = new DayilyIncome();
		
		while(rs.next()){
			DayilyIncome temp = new DayilyIncome(rs.getDate("date"), rs.getDouble("cash"), rs.getDouble("fine"));
			income.setCash(income.getCash() + temp.getCash());
			income.setFine(income.getFine() + temp.getFine());
		}
		
		DBhelper.closeConnection(c, s, rs);
		
		return income;
	}
	
	//通过 year month day 更新某日的收入情况
	//type=0 表示更新 cash
	//type=1 表示更新 fine
	public  void updateDayilyIncome(double value, int type) throws SQLException{
		Date now = new Date();// new Date()为获取当前系统时间
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String today = dateFormat.format(now);
		
		Connection c = DBhelper.getInstance().getConnection();
		Statement s = c.createStatement();
		
		String sql = "select * from DayilyIncome where date = " + "'"+today+"';";
		
		ResultSet rs = s.executeQuery(sql);
		
		if(rs.next()){
			DayilyIncome temp = new DayilyIncome(rs.getDate("date"), rs.getDouble("cash"), rs.getDouble("fine"));
			if(type == 0){
				temp.setCash(temp.getCash() + value);
				updateDayilyIncome(temp);
			}else{
				temp.setFine(temp.getFine() + value);
				updateDayilyIncome(temp);
			}
		}else{
			DayilyIncome temp = new DayilyIncome();
			if(type == 0){
				temp.setCash(temp.getCash() + value);
				temp.setDate(new Date());
				addDayilyIncome(temp);
			}else{
				temp.setFine(temp.getFine() + value);
				temp.setDate(new Date());
				addDayilyIncome(temp);
			}
		}
		
		DBhelper.closeConnection(c, s, rs);
	}

	//通过 DayilyIncome 对象增加今天的日常收入情况记录项
	public void addDayilyIncome(DayilyIncome temp) throws SQLException {
		Connection c = DBhelper.getInstance().getConnection();
		String sql = "insert into DayilyIncome(date, cash, fine) values(?,?,?)";
		PreparedStatement ps = c.prepareStatement(sql);
		
		ps.setDate(1, new java.sql.Date(temp.getDate().getTime()));
		ps.setDouble(2,  temp.getCash());
		ps.setDouble(3, temp.getFine());
		
		ps.execute();
		
		DBhelper.closeConnection(c, ps, null);
	}

	//通过 DayilyIncome 对象更新某天的日常收入情况记录
	private void updateDayilyIncome(DayilyIncome temp) throws SQLException {
		Connection c = DBhelper.getInstance().getConnection();

		String sql = "update DayilyIncome set cash = ? , fine = ? where date = ?";
		
		PreparedStatement ps = c.prepareStatement(sql);
		
		ps.setDouble(1,  temp.getCash());
		ps.setDouble(2,  temp.getFine());
		ps.setDate(3, new java.sql.Date(temp.getDate().getTime()));

		ps.execute();

		DBhelper.closeConnection(c, ps, null);
	}
}
