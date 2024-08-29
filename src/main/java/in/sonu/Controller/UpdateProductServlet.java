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
import in.sonu.ServletModel.UploadModel;

@WebServlet("/updateeProduct")
public class UpdateProductServlet extends HttpServlet {
	private static final String updateQuery = "UPDATE products SET brandName = ?, description = ?, price = ?, contact = ? WHERE id = ?";

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		UploadModel m = new UploadModel();
		m.setId(Integer.parseInt(req.getParameter("id")));
		m.setBrandName(req.getParameter("brandName"));
		m.setDescription(req.getParameter("description"));
		m.setPrice(req.getParameter("price"));
		m.setContact(req.getParameter("contact"));

		try {
			Connection con = DbConnectionDao.getConnection();
			PreparedStatement ps = con.prepareStatement(updateQuery);
			ps.setString(1, m.getBrandName());
			ps.setString(2, m.getDescription());
			ps.setString(3, m.getPrice());
			ps.setString(4, m.getContact());
			ps.setInt(5, m.getId());
			
			int i = ps.executeUpdate();
			if(i == 1) {
				HttpSession session = req.getSession();
				session.setAttribute("msg", "Update Successful");
				RequestDispatcher rd = req.getRequestDispatcher("ListOfAllProductsServlet");
				rd.forward(req, resp);
			}

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
