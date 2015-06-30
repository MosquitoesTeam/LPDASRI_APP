package myhelpers;

import java.sql.*;

public class DBUtil {
	public static Connection dbConnect(String dbName, String dbUserName,
			String dbUserPassword) {
		Connection con = null;
		try {
			StringBuilder dbURL1 = new StringBuilder(
					"jdbc:mysql://localhost:3306/");
			dbURL1.append(dbName);
			String dbURL = dbURL1.toString();
			System.out.println(dbURL);
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager
					.getConnection(dbURL, dbUserName, dbUserPassword);
		} catch (ClassNotFoundException e) {
			System.out.println("Driver non trouve : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("Connection a la base impossible : "
					+ e.getMessage());
		}
		return con;
	}

	public static void closeStatement(Statement s) {
		try {
			if (s != null) {
				s.close();
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	public static void closePreparedStatement(PreparedStatement ps) {
		try {
			if (ps != null) {
				ps.close();
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	public static void closeResultSet(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
}