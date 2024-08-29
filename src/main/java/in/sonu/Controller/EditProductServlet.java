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

import in.sonu.Dao.DbConnectionDao;
import in.sonu.ServletModel.UploadModel;

@WebServlet("/editProduct")
public class EditProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String QUERY = "SELECT brandName, description, price, contact, productImage FROM products WHERE id=?";

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UploadModel product = null;
        int ID = Integer.parseInt(req.getParameter("id"));
        
        try (Connection con = DbConnectionDao.getConnection();
             PreparedStatement ps = con.prepareStatement(QUERY)) {
            ps.setInt(1, ID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                product = new UploadModel();
                product.setId(ID);
                product.setBrandName(rs.getString("brandName"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getString("price"));
                product.setContact(rs.getString("contact"));
                product.setProductImage(rs.getString("productImage"));
            }
            req.setAttribute("product", product);
           // resp.sendRedirect("editProduct.jsp");
            RequestDispatcher rd = req.getRequestDispatcher("editProduct.jsp");
            rd.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Database error", e);
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
