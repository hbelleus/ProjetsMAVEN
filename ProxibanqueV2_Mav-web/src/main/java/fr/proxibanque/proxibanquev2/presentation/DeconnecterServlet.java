package fr.proxibanque.proxibanquev2.presentation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeconnecterServlet
 * Cette servlet est appel�e lorsque l'utilisateur clique sur "se D�connecter". Elle permet de supprimer
 * le client et le conseiller en session, et redirige ensuite vers la page de login.
 */
@WebServlet("/DeconnecterServlet")
public class DeconnecterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeconnecterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		traitement(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		traitement(request, response);
	}
	
	/**
	 * Cette m�thode permet le traitement de la requ�te selon l'objectif de la servlet. 
	 * Elle permet de supprimer le client et le conseiller en session, et redirige ensuite vers la page de login.
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void traitement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession maSession = request.getSession();
		if (maSession != null) {
			maSession.invalidate();
		}

		RequestDispatcher dispatcher;
		dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);

	}
}
