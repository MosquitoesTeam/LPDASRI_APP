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

@WebServlet(name = "ServModify", urlPatterns = { "/servmodify" })
public class ServModify extends HttpServlet {
	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			/* TODO output your page here. You may use following sample code. */
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Modification des infos</title>");
			out.println("</head>");
			out.println("<body>");
			HttpSession session = request.getSession();
			Candidat candidat = (Candidat) session.getAttribute("candidat");
			String ancienEmail = (String) session.getAttribute("ancienEmail");
			candidat.setEmail(request.getParameter("email"));
			candidat.setNom(request.getParameter("nom"));
			candidat.setPrenom(request.getParameter("prenom"));
			candidat.setNote(Double.parseDouble(request.getParameter("note")));
			candidat.setMotPasse(request.getParameter("motPasse"));
			int resOpe = DBCandidat.update(candidat, ancienEmail);
			session.setAttribute("operation", "Modification");
			session.setAttribute("resultatOperation", new Integer(resOpe));
			this.getServletContext().getRequestDispatcher("/operes.jsp")
					.forward(request, response);
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