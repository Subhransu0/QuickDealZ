package in.sonu.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.sonu.Dao.DbConnectionDao;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {
	private static final String query = "delete from products where id=?";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		try {
			Connection con = DbConnectionDao.getConnection();
			PreparedStatement ps = con .prepareStatement(query);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if(i == 1) {
				HttpSession session = req.getSession();
				session.setAttribute("mssg", "Prdouct delete SuccessFully");
				RequestDispatcher rd = req.getRequestDispatcher("ListOfAllProductsServlet");
				rd.forward(req, resp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

}
