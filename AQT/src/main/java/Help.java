
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Help
 */
@WebServlet("/Help")
public class Help extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Help() {
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

			String fName = request.getParameter("inputFname");
			String lName = request.getParameter("inputLname");
			out.print("Welcome " + fName +" "+lName);

			// creating Hidden form that have invisible textfield which will redirect to HelpServlet on clicking go
			out.print("<form action='HelpServlet'>");
			out.print("<input type='hidden' name='uFname' value='" + fName + "'>");
			out.print("<input type='hidden' name='uLname' value='" + lName + "'>");
			out.print("<input type='hidden' name='email' value='" + request.getParameter("email")+ "'>");
			out.print("<input type='hidden' name='email1' value='AQTrack@abc.xy'>");
			out.print("<input type='hidden' name='inputAddress' value='" + request.getParameter("inputAddress") + "'>");
			out.print("<input type='hidden' name='inputAddress2' value='" + request.getParameter("inputAddress2") + "'>");
			out.print("<input type='hidden' name='inputCity' value='" + request.getParameter("inputCity") + "'>");
			out.print("<input type='hidden' name='inputState' value='" + request.getParameter("inputState") + "'>");
			out.print("<input type='hidden' name='inputZip' value='" + request.getParameter("inputZip") + "'>");
			out.print("<input type='hidden' name='Country' value='" + request.getParameter("country") + "'>");
			out.print("<input type='hidden' name='message' value='" + request.getParameter("message") + "'>");
			out.print("<input type='submit' value='go'>");
			out.print("</form>");
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
