package in.sonu.ControllerLogin_Register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.sonu.Dao.DbConnectionDao;
import in.sonu.ServletModel.Register_LoginModel;

@WebServlet("/MyregisterServlet")
public class RegistrationServlet extends HttpServlet {
	private static final String query = "INSERT INTO Register_Login(NAME , GMAIL , PASSWORD) VALUES (? , ? ,?)";

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html");
		String name1 = req.getParameter("name");
		String gmail1 = req.getParameter("gmail");
		String pass1 = req.getParameter("password");
		
		Register_LoginModel model = new Register_LoginModel();
		model.setNAME(name1);
		model.setGMAIL(gmail1);
		model.setPASSWORD(pass1);

		try {
			Connection connection = DbConnectionDao.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, model.getNAME());
			ps.setString(2, model.getGMAIL());
			ps.setString(3, model.getPASSWORD());
			int i = ps.executeUpdate();
			if (i > 0) {
				RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			} else {
				out.println("<h4>Registration Failed Try Again</h4>");
				RequestDispatcher rd = req.getRequestDispatcher("registration.jsp");
				rd.include(req, resp);
			}
			ps.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		service(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		service(req, resp);
	}

}
