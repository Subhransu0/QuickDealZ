package in.sonu.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.sonu.Dao.DbConnectionDao;
import in.sonu.ServletModel.UploadModel;

@WebServlet("/ListOfAllProductsServlet")
public class ListOfAllProductServlet extends HttpServlet {
	private static final String Query = "select * from products";

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<UploadModel> list = new ArrayList<>();

		HttpSession session = req.getSession();

		try {
			Connection connection = DbConnectionDao.getConnection();
			PreparedStatement ps = connection.prepareStatement(Query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				UploadModel model = new UploadModel();
				model.setBrandName(rs.getString("brandName"));
				model.setDescription(rs.getString("description"));
				model.setPrice(rs.getString("price"));
				model.setContact(rs.getString("contact"));
				model.setProductImage(rs.getString("productImage"));
				list.add(model);
			}
			session.setAttribute("list", list);
			RequestDispatcher rd = req.getRequestDispatcher("list.jsp");
			rd.forward(req, resp);

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
