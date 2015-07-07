package myservlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import myhelpers.Candidat;
import myhelpers.DBCandidat;

@WebServlet(name = "ServAdmin", urlPatterns = { "/servadmin" })
public class ServAdmin extends HttpServlet {
	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			Candidat candidat = (Candidat) session.getAttribute("candidat");
			String strConBouton = request.getParameter("conbouton");
			if (strConBouton.equals("Modifier vos informations")) {
				this.getServletContext().getRequestDispatcher("/modifier.jsp")
						.forward(request, response);
			} else if (strConBouton.equals("Supprimer vos informations")) {
				int resOpe = DBCandidat.delete(candidat);
				session.setAttribute("operation", "Suppression");
				session.setAttribute("resultatOperation", new Integer(resOpe));
				this.getServletContext().getRequestDispatcher("/operes.jsp")
						.forward(request, response);
			} else if (strConBouton.equals("Consulter tous les inscrits")) {
				ArrayList<Candidat> listeCandidats = DBCandidat
						.selectTousLesCandidats();
				session.setAttribute("listecandidats", listeCandidats);
				this.getServletContext()
						.getRequestDispatcher("/affichetous.jsp")
						.forward(request, response);
			} else if (strConBouton.equals("Consulter tous les selectionnes")) {
				ArrayList<Candidat> listecandidatsselectiones = DBCandidat
						.selectTousLesSelectiones();
				session.setAttribute("listecandidatsselectiones", listecandidatsselectiones);
				this.getServletContext()
						.getRequestDispatcher("/selectionEtudiants.jsp")
						.forward(request, response);
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

	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}