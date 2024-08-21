package in.sonu.ControllerLogin_Register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.sonu.Dao.DbConnectionDao;

@WebServlet("/MyLoginS")
public class LoginServlet extends HttpServlet {

	private static final String query = "SELECT  NAME , PASSWORD FROM Register_Login WHERE GMAIL = ?";

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html");
		String gmail1 = req.getParameter("email");
		String password1 = req.getParameter("password");
		ServletContext context = getServletContext();
		context.setAttribute("gmail", gmail1);

		try {
			Connection connection = DbConnectionDao.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, gmail1);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				String storePassword = rs.getString("PASSWORD");
				String USERNAME = rs.getString("NAME");
				if (password1.equals(storePassword)) {
					HttpSession session = req.getSession();
					session.setAttribute("username", USERNAME);
					RequestDispatcher rd = req.getRequestDispatcher("home.jsp");
					rd.forward(req, resp);
				} else {
					out.println("<h4>Login Failed</h4>");
					RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
					rd.forward(req, resp);
				}

			} else {
				out.println("<h4>Login Failed</h4>");
				RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			}

			ps.close();
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		service(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		service(req, resp);
	}

}
