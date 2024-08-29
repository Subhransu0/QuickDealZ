package in.sonu.Filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
@WebFilter("/MyregisterServlet")
public class RegistrationFilter implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter initialized");
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain fc)
			throws IOException, ServletException {
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html");

		String name = req.getParameter("name");
		String gmail = req.getParameter("gmail");
		String password = req.getParameter("password");

		if (name == null || name.trim().isEmpty()) {
			out.println("<h4>Name can't be empty</h4>");
			RequestDispatcher rd = req.getRequestDispatcher("registration.html");
			rd.include(req, resp);
		} else if (gmail == null || !gmail.endsWith("@gmail.com") || gmail.endsWith(".in")) {
			out.println("<h4>Enter a valid Gmail</h4>");
			RequestDispatcher rd = req.getRequestDispatcher("registration.jsp");
			rd.include(req, resp);
		} else if (password == null || password.length() <= 6) {
			out.println("<h4>Password must be greater than 6 characters</h4>");
			RequestDispatcher rd = req.getRequestDispatcher("registration.jsp");
			rd.include(req, resp);
		} else {
			fc.doFilter(req, resp);
		}
	}

	
}
