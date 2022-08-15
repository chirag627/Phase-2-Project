package academy3;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import academy3.domain.User;

public class userLogin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User u = new User();
		HttpSession session = req.getSession();
		u.setEmail(req.getParameter("email"));
		u.setPassword(req.getParameter("password"));

		if (u.authenticate()) {
			session.setAttribute("email", u.getEmail());
			resp.sendRedirect("./web/home.jsp");

		} else {
			PrintWriter pw=resp.getWriter();
			pw.println("Invalid user name and password");
			
		}

	}
}
