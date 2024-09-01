package in.sonu.ControllerLogin_Register;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Cookies")
public class CookiesManagement extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean loginstatus = false;
		
		Cookie [] ck = req.getCookies();
		if(ck != null) {
			for(Cookie c : ck) {
				if(c.getName().equals("loginstatus") && c.getValue().equals("true")) {
					loginstatus = true;
					break;
				}
			}
		}
		if(loginstatus == true) {
			RequestDispatcher rd = req.getRequestDispatcher("MyLoginS");
			rd.forward(req, resp);
		}
		else {
			RequestDispatcher rd = req.getRequestDispatcher("registration.jsp");
			rd.forward(req, resp);
		}
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

}
