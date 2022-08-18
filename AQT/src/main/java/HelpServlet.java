
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelpServlet
 */
@WebServlet("/HelpServlet")
public class HelpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HelpServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());

		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			
			// Initialize the database
			Connection con = DatabaseConnect.initializeDatabase();

			// Create a SQL query to insert data into demo table
			// demo table consists of two columns, so two '?' is used
			PreparedStatement user = con.prepareStatement(
					"INSERT INTO test_db.contact_form_details (FIRSTNAME,LASTNAME,EMAIL,ADDRESS1,ADDRESS2,CITY,STATE,COUNTRY,ZIP,MESSAGE) VALUES (?,?,?,?,?,?,?,?,?,?)",
					PreparedStatement.RETURN_GENERATED_KEYS);

			// Getting the value from the hidden field and it loads the help page with the Text showing user that the form has been submitted
			String fN = request.getParameter("uFname");
			String lN = request.getParameter("uLname");
			String email = request.getParameter("email");
			out.println("Hello "+fN+" "+lN+" !");
			
			if(fN == null && lN == null) {
            	out.print("<h3>Please Fill out all the details</h3>");
            }else {
            	
				out.print("Welcome " + fN);

				user.clearParameters(); // Clears any previous parameters

				user.setString(1, request.getParameter("uFname"));
				user.setString(2, request.getParameter("uLname"));
				user.setString(3, request.getParameter("email"));
				user.setString(4, request.getParameter("inputAddress"));
				user.setString(5, request.getParameter("inputAddress2"));
				user.setString(6, request.getParameter("inputCity"));
				user.setString(7, request.getParameter("inputState"));
				user.setString(8, request.getParameter("Country"));
				user.setString(9, request.getParameter("inputZip"));
				user.setString(10, request.getParameter("message"));
				user.executeUpdate();
				user.close();
					 
				
				System.out.println("\nConnection Successful..... creating statement....");

                
             
            }
             

			
			out.println("You form submission has been recieved.Kindly look out from an email from our Team");
			request.getRequestDispatcher("Help.jsp").include(request, response);

			// Close all the connections
			con.close();
            out.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
