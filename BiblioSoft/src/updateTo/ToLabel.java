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
 * @author diao
 *
 */
public class ToLabel {
	public static int getTotal() {
		int total = 0;
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from label";

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
	public static void update(String name,String newname) {
		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "update label set name=? where name = ?";
			
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setString(1,newname);
			ps.setString(2,name);
	
			ps.execute();

			DBhelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	public static void delete(String name) {
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "delete from label where name = " +"'"+name+"';";

			s.execute(sql);

			DBhelper.closeConnection(c, s, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void add(Label label) {

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "insert into label(name) values(?)";
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setString(1, label.getName());
		
			
			ps.execute();

			DBhelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Label> list() {
		return list(0, Short.MAX_VALUE);
	}
	
	public static List<Label> list(int start, int count) {
		List<Label> labels = new ArrayList<Label>();

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "select * from Label order by name desc limit ?,? ";

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Label label = new Label();
				label.setName(rs.getString("name"));
		
				Date date1=null;

				labels.add(label);
			}
			DBhelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return labels;
	}
}
