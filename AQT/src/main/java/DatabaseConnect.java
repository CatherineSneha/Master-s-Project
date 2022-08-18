import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// This class can be used to initialize the database connection
public class DatabaseConnect {
	protected static Connection initializeDatabase()
		throws SQLException, ClassNotFoundException
	{
		Connection con = null;
        String JDBCUrl = "jdbc:mysql://localhost:3306/test_db";
        String username = "root";
        String password = "Yellow@12";
        try {
            System.out.println("\nConnecting to the SSD Database......");
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(JDBCUrl, username, password);
        }
        catch (Exception e) {
            System.out.println("\nAn error has occurred during the connection phase!");
            e.printStackTrace();
            System.exit(0);
        }
		return con;   
	}
}
