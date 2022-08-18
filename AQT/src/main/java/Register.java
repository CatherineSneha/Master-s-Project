

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
            response.setContentType("text/html");
         
            PrintWriter out = response.getWriter();
            
			// Initialize the database
			Connection con = DatabaseConnect.initializeDatabase();
  
			// Create a SQL query to insert data into user_details table
			PreparedStatement user = con.prepareStatement(
					"INSERT INTO test_db.user_details (FIRSTNAME,LASTNAME,EMAILID,PASSWORD,ACCOUNT_TYPE,ADDRESS1,ADDRESS2,CITY,STATE,COUNTRY,ZIPCODE,THINGSPEAK_KEY) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)",
					PreparedStatement.RETURN_GENERATED_KEYS);
			// Create a SQL query to insert data into login_details table
			PreparedStatement login = con.prepareStatement(
					"INSERT INTO test_db.login_details (USERNAME,PASSWORD,ACCOUNT_TYPE,THINGSPEAK_KEY) VALUES (?,?,?,?)");

            String firstName = request.getParameter("fname");
            String lastName = request.getParameter("lname");
            String account = request.getParameter("account");
            String api = request.getParameter("apiKey");
            if(firstName == null && lastName == null) {
            	out.print("<h3>Please Fill out all the details</h3>");
            }else {
            	
				out.print("Welcome " + firstName);

				user.clearParameters(); // Clears any previous parameters
                
				//Set strings on the User details Table
				user.setString(1, request.getParameter("fname"));
				user.setString(2, request.getParameter("lname"));
				user.setString(3, request.getParameter("email"));
				user.setString(4, request.getParameter("password"));
				user.setString(5, request.getParameter("account"));
				user.setString(6, request.getParameter("address1"));
				user.setString(7, request.getParameter("address2"));
				user.setString(8, request.getParameter("city"));
				user.setString(9, request.getParameter("state"));
				user.setString(10, request.getParameter("country"));
				user.setString(11, request.getParameter("zip"));
				user.setString(12, request.getParameter("apiKey"));
				user.executeUpdate();
				user.close();
				
				/*
				 * Statement stmt = con.createStatement(); ResultSet rs =
				 * stmt.executeQuery("SELECT * FROM test_db.user_details WHERE EMAILID='email'"
				 * );
				 */
				
				login.clearParameters(); // Clears any previous parameters
                
				//Set strings on the Login details Table
				login.setString(1, request.getParameter("email"));
				login.setString(2, request.getParameter("password"));
				login.setString(3, request.getParameter("account"));
				login.setString(4, request.getParameter("api"));
				login.executeUpdate();
				login.close();
				
				System.out.println("\nConnection Successful..... creating statement....");

				

            	//URL rewriting to add key and value in the url while redirecting to User page
                out.print("<a href='MyAccount?uname=" + firstName + "&accountType=" +account +"'> Go to MyAccount Page </a>");
                
             // Close all the connections
				
				con.close();
                out.close();
            }
             

            
        }
        catch (Exception e) {
            System.out.println(e);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
