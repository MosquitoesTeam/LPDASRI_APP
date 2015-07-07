package myservlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import myhelpers.Candidat;
import myhelpers.DBCandidat;

@WebServlet(name = "inscrire", urlPatterns = { "/inscrire" })
public class Inscrire extends HttpServlet {
	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			Candidat c = null;
			HttpSession session = request.getSession();
			String submitVal = request.getParameter("bouton");
			if ((submitVal.equals("Envoyer")) || (submitVal.equals("Modifier"))) {
				c = new Candidat();
				c.setEmail(request.getParameter("email"));
				c.setNom(request.getParameter("nom"));
				c.setPrenom(request.getParameter("prenom"));
				c.setNote(Double.parseDouble(request.getParameter("note")));
				c.setMotPasse(request.getParameter("motPasse"));
				
				System.out.println("motdepasse: " + request.getParameter("motPasse"));
				
				session.setAttribute("candidat", c);
				this.getServletContext().getRequestDispatcher("/confirmer.jsp")
						.forward(request, response);
			} else {
				if (submitVal.equals("Confirmer")) {
					// Inscription du candidat
					c = (Candidat) session.getAttribute("candidat");
					int resOpe = DBCandidat.insert(c);
					session.setAttribute("operation", "Insertion");
					session.setAttribute("resultatOperation", new Integer(resOpe));
					this.getServletContext()
							.getRequestDispatcher("/operes.jsp")
							.forward(request, response);
				} else {
					this.getServletContext()
							.getRequestDispatcher("/annuler.jsp")
							.forward(request, response);
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
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
}
