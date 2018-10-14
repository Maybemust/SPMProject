package updateTo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;

import entity.*;
import utils.DBhelper;
/**
 * @author diao
 *
 */
public class ToActive {
	public static int getTotal() {
		int total = 0;
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from active";

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
	
	public static void add(Active active) {

		try {

			Connection c = DBhelper.getInstance().getConnection();

			String sql = "insert into active(ID,account,email,affective,flag) values(?,?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setString(1, active.getID());
			ps.setString(2,active.getAccount());
			ps.setString(3, active.getEmail());
			
			Timestamp timeStamp = new Timestamp(active.getAffective().getTime());
			ps.setTimestamp(4, timeStamp);
			
			ps.setInt(5, active.getFlag());
			
			ps.execute();

			DBhelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static String getByEmail(String email) {
		String st = "";
		try {

			Connection c = DBhelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from active where email = " + "'"+email+"';";

			ResultSet rs = s.executeQuery(sql);

			if (rs.next()) {
				st=rs.getString("account");
			}

			DBhelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return st;
	}
}
