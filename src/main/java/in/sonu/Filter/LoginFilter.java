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
@WebFilter("/MyLoginS")
public class LoginFilter implements Filter {
	
	 @Override
	    public void init(FilterConfig filterConfig) throws ServletException {
	        System.out.println("Filter initialized");
	    }
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain fc)
			throws IOException, ServletException {
		PrintWriter out = resp.getWriter();
     resp.setContentType("text/html");
     String gmail1 = req.getParameter("email");
     String password1 = req.getParameter("password");
     
     if(gmail1 == null || ! (gmail1.endsWith("@gmail.com") || gmail1.endsWith(".in"))) {
     	out.println("<h4>Give a Valid Email</h4>");
     	RequestDispatcher rd = req.getRequestDispatcher("login.html");
     	rd.include(req, resp);
     }
     if(password1 == null ||  (password1.length() < 6)) {
     	out.println("<h4>Password must be greater than 6 digit</h4>");
     	RequestDispatcher rd = req.getRequestDispatcher("login.html");
     	rd.include(req, resp);
     	
     }
     else {
     	fc.doFilter(req, resp);
     }
		
		
	}
	@Override
 public void destroy() {
     System.out.println("Filter destroyed");
 }
}
