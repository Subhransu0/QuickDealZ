package in.sonu.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnectionDao {

	private static Connection connection;

	public static Connection getConnection() throws ClassNotFoundException, SQLException, Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DbConnectionDao.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/buy_sell", "root",
				"Subh123@");

	}

	

}
 