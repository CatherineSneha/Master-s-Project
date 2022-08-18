
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.xdevapi.Result;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		System.out.println("GET");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("POST");
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		ResultSet rs = null;

		// loading data from a property file
		Properties prop = new Properties();
		InputStream input = null;

		try {

			String emailId = request.getParameter("email");
			String passwrd = request.getParameter("password");
			String type = request.getParameter("account");

			HttpSession session = request.getSession();
			session.setAttribute("email", emailId);

			// Initialize the database
			Connection con = DatabaseConnect.initializeDatabase();
			System.out.println("\nConnection Successful..... creating statement....");
			// Retrieve User details from login_details table in the DB
			PreparedStatement login = con.prepareStatement("SELECT * FROM test_db.login_details WHERE USERNAME=?");
			login.setString(1, emailId);
			rs = login.executeQuery();

			System.out.println(rs.toString());

			// Retrieve User details from login_details table in the DB
			PreparedStatement aqi = con
					.prepareStatement("INSERT INTO test_db.aqi_details (USERNAME,AQI_VALUE,CATEGORY) VALUES (?,?,?)");

			// User Validation
			while (rs.next()) {
				if (rs != null) {
					if (rs.getString("USERNAME").equals(emailId)) {
						if (rs.getString("PASSWORD").equals(passwrd)) {
							System.out.println("Your Password is correct");
							System.out.println(type);
							if (rs.getString("ACCOUNT_TYPE").equals(type)) {
								System.out.println("Admin");
								response.sendRedirect("Index.jsp");
								session.setAttribute("url", "AdminAccount.jsp");
							} else {
								System.out.println("User");
								try {
									System.out.println("Try Catch");
									URL url = new URL(
											"https://api.thingspeak.com/channels/1826222/feeds.json?results=1");
									HttpURLConnection conn = (HttpURLConnection) url.openConnection();
									conn.setRequestMethod("GET");
									conn.setRequestProperty("Accept", "application/json");

									if (conn.getResponseCode() != 200) {
										throw new RuntimeException(
												"Failed : HTTP error code : " + conn.getResponseCode());
									}

									BufferedReader br = new BufferedReader(
											new InputStreamReader((conn.getInputStream())));

									String output;
									// System.out.println(output);
									System.out.println("Output from Server .... \n");
									while ((output = br.readLine()) != null) {
										System.out.println(output);
										// Using the JSON simple library parse the string into a json object
										JSONParser parse = new JSONParser();
										JSONObject data_obj = (JSONObject) parse.parse(output);

										// Get the required object from the above created object
										JSONObject obj = (JSONObject) data_obj.get("channel");

										// Get the required data using its key
										System.out.println(obj.get("id"));

										JSONArray arr = (JSONArray) data_obj.get("feeds");
										String category;
										String AQI = null;
										for (int i = 0; i < arr.size(); i++) {

											JSONObject new_obj = (JSONObject) arr.get(i);

											if (new_obj.get("field1") != null) {

												System.out.println("AQI Value: " + new_obj.get("field1"));
												String value =  (String) new_obj.get("field1");
												int val = Integer.parseInt(value);
												if (val >= 0 && val <= 50) {
													category = "Good";
												} else if (val > 50 && val <= 100) {
													category = "Moderate";
												} else if (val > 100 && val <= 150) {
													category = "USG";
												} else if (val > 150 && val <= 200) {
													category = "Unhealthy";
												} else if (val > 200 && val <= 300) {
													category = "Very Unhealthy";
												} else {
													category = "Hazardous";
												} 
 
													AQI = (String) new_obj.get("field1");

												aqi.clearParameters(); // Clears any previous parameters

												// Set strings on the Login details Table
												aqi.setString(1, request.getParameter("email"));
												aqi.setString(2, AQI);
												aqi.setString(3, category);
												aqi.executeUpdate();
												aqi.close();

												break;
											}
										}
									}

								} catch (MalformedURLException e) {

									e.printStackTrace();

								} catch (IOException e) {

									e.printStackTrace();

								} catch (ParseException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}

								response.sendRedirect("Index.jsp");
								session.setAttribute("url", "myAccount.jsp");
							}

							// Cookie creation
							Cookie ck = new Cookie("auth", emailId);
							ck.setMaxAge(600);
							response.addCookie(ck);

						} else {
							System.out.println("Your Password is Incorrect");
							response.sendRedirect("Login.jsp");
						}
					}
				} else {
					System.out.println("User does not exist");
					response.sendRedirect("Login.jsp");
					break;
				}
			}
			login.close();

			/*
			 * // path of the property file input =
			 * Thread.currentThread().getContextClassLoader().getResourceAsStream(
			 * "userData.properties");
			 * 
			 * // load a properties file prop.load(input);
			 * 
			 * String[] emails = prop.getProperty("data.username").split(","); String[]
			 * passwords = prop.getProperty("data.password").split(",");
			 * 
			 * // get the property value and print it out
			 * 
			 * System.out.println(Arrays.toString(emails));
			 * System.out.println(Arrays.toString(passwords));
			 * 
			 * 
			 * System.out.println(emailId); System.out.println(passwrd);
			 * 
			 * String pass = null;
			 * 
			 * // Validation of user if (emailId != null && !emailId.isEmpty()) { for (int i
			 * = 0; i <= emails.length;) { if (emails[i].equalsIgnoreCase(emailId)) { pass =
			 * passwords[i]; System.out.println(pass); break; } } if (passwrd.equals(pass))
			 * {
			 * 
			 * System.out.println("Your Password is correct"); if
			 * (type.equalsIgnoreCase("Admin")) { response.sendRedirect("Index.jsp");
			 * session.setAttribute("url", "AdminAccount.jsp"); ; } else {
			 * response.sendRedirect("Index.jsp"); session.setAttribute("url",
			 * "myAccount.jsp"); }
			 * 
			 * // Cookie creation Cookie ck = new Cookie("auth", emailId);
			 * ck.setMaxAge(600); response.addCookie(ck);
			 * 
			 * } else { System.out.println("Your Password is Incorrect");
			 * response.sendRedirect("Login.jsp"); } }
			 */

		} catch (IOException | ClassNotFoundException | SQLException ex) {
			ex.printStackTrace();
		}

	}

}
