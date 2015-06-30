package myservlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import myhelpers.Candidat;
import myhelpers.DBCandidat;

@WebServlet(name = "ServLogin", urlPatterns = { "/servlogin" })
public class ServLogin extends HttpServlet {
	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			/* TODO output your page here. You may use following sample code. */
			String email, motPasse;
			HttpSession session = request.getSession();
			email = request.getParameter("email");
			motPasse = request.getParameter("motPasse");
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet MyServlet</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet MyServlet at " + request.getContextPath()
					+ "</h1>");
			out.println("<h2>email : " + email + "</h2>");
			out.println("<h2>Mat de passe : " + motPasse + "</h2>");
			boolean candidateExiste = DBCandidat.loginExists(email, motPasse);
			if (candidateExiste) {
				Candidat candidat = DBCandidat.selectCandidat(email);
				session.setAttribute("candidat", candidat);
				this.getServletContext().getRequestDispatcher("/trouve.jsp")
						.forward(request, response);
			} else {
				this.getServletContext().getRequestDispatcher("/nontrouve.jsp")
						.forward(request, response);
			}
		} catch (Exception e) {
			out.println("Exception : " + e.getMessage());
		} finally {
			out.println("</body>");
			out.println("</html>");
		}
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}