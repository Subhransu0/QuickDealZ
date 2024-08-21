package in.sonu.Controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import in.sonu.Dao.DbConnectionDao;
import in.sonu.ServletModel.UploadModel;

@WebServlet("/uploadProduct")
@MultipartConfig
public class SellProductServlet extends HttpServlet {
	private static final String query = "INSERT INTO products (brandName , description , price , contact , productImage)VALUES (?,?,?,?,?)";

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String brandName = req.getParameter("brandName");
		String description = req.getParameter("description");
		String price = req.getParameter("price");
		String contact = req.getParameter("contact");

		// Image Upload
		Part p = req.getPart("productImage");
		String Filename = p.getSubmittedFileName();

		UploadModel model = new UploadModel();
		model.setBrandName(brandName);
		model.setDescription(description);
		model.setPrice(price);
		model.setContact(contact);
		model.setProductImage(Filename);

		try {
			Connection connection = DbConnectionDao.getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, model.getBrandName());
			ps.setString(2, model.getDescription());
			ps.setString(3, model.getPrice());
			ps.setString(4, model.getContact());
			ps.setString(5, model.getProductImage());
			int i = ps.executeUpdate();
			if (i > 0) {

				String path = getServletContext().getRealPath("") + "Image";
				File file = new File(path);
				p.write(path + File.separator + Filename);

				resp.sendRedirect("ListOfAllProductsServlet");
			}

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
