package in.sonu.Controller;

import java.io.IOException;
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

import in.sonu.Dao.DbConnectionDao;
import in.sonu.ServletModel.Register_LoginModel;

@WebServlet("/profileServletIt")
public class ProfileServlet extends HttpServlet {
    private static final String query = "select * from Register_Login where GMAIL = ?";

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Register_LoginModel model = null;

        ServletContext context = getServletContext();
        String gmail1 = (String) context.getAttribute("gmail");

        try {
            Connection con = DbConnectionDao.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, gmail1);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                model = new Register_LoginModel();
                model.setNAME(rs.getString("NAME"));
                model.setGMAIL(rs.getString("GMAIL"));
                model.setPASSWORD(rs.getString("PASSWORD"));
            }
            rs.close();
            ps.close();
            con.close();

            req.setAttribute("profile", model);
            RequestDispatcher rd = req.getRequestDispatcher("profile.jsp");
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
