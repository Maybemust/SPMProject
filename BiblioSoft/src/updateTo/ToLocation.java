package updateTo;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import entity.*;
import utils.DBhelper;
/**
 * @author sc
 *
 */
public class ToLocation {
	public static int getTotal() {
		int total = 0;
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from location";

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
	public static void update(String location,String newlocation) {
		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "update location set location=? where location = ?";
			
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setString(1,newlocation);
			ps.setString(2,location);
	
			ps.execute();

			DBhelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	public static void delete(String location) {
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "delete from location where location = " +"'"+location+"';";

			s.execute(sql);

			DBhelper.closeConnection(c, s, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void add(Location location) {

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "insert into location(location) values(?)";
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setString(1, location.getLocation());
		
			
			ps.execute();

			DBhelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Location> list() {
		return list(0, Short.MAX_VALUE);
	}
	
	public static List<Location> list(int start, int count) {
		List<Location> locations = new ArrayList<Location>();

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "select * from Location order by location desc limit ?,? ";

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Location location = new Location();
				location.setLocation(rs.getString("location"));
		
				Date date1=null;

				locations.add(location);
			}
			DBhelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return locations;
	}
}
