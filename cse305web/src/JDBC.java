
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
public class JDBC {

	static JDBC instance = new JDBC();
	public static final String dbname = "jijli";
	public static final String URL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/jijli";
	public static final String USER = "jijli";
	public static final String PASSWORD = "109843894";
	public static final String DRIVER = "com.mysql.jdbc.Driver";
	
	private JDBC() {
        try {
            //Step 2: Load MySQL Java driver
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Connection conn = DriverManager.getConnection(URL, USER,PASSWORD);
		return conn; 
	}
	
	
	
}
