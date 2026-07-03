package com.filters;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entities.Admin;
import com.entities.Dentiste;
import com.entities.Patient;

/**
 * Filtre d'autorisation : contrôle l'accès aux servlets selon le rôle
 * de l'utilisateur connecté (Patient, Dentiste ou Admin).
 *
 * - URL publique : accès libre.
 * - URL protégée sans session : redirection vers la page de choix d'espace.
 * - URL protégée avec un rôle non autorisé : erreur 403 (page d'erreur personnalisée).
 * - URL inconnue : laissée au conteneur qui renvoie un 404 (page d'erreur personnalisée).
 */
@WebFilter("/*")
public class AuthorizationFilter implements Filter {

	private static final Set<String> PUBLIC_PATHS = new HashSet<String>(Arrays.asList(
			"", "/", "/index.jsp", "/espace-page.jsp",
			"/Login", "/Registration", "/VerificationOTP", "/Logout"));

	private static final Set<String> PATIENT_PATHS = new HashSet<String>(Arrays.asList(
			"/AccueilPatient", "/NouveauRDV", "/MonHistorique", "/MonDossierMedical", "/Contact"));

	private static final Set<String> DENTISTE_PATHS = new HashSet<String>(Arrays.asList(
			"/AccueilDentiste", "/MesRendezVous", "/ListePatients", "/DossierMedical"));

	private static final Set<String> ADMIN_PATHS = new HashSet<String>(Arrays.asList(
			"/Dashboard", "/Planning", "/ListeDentistes", "/ListePatients", "/DossierMedical"));

	private static final Set<String> SHARED_PATHS = new HashSet<String>(Arrays.asList(
			"/Profile", "/FAQ"));

	public void init(FilterConfig filterConfig) throws ServletException {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		// Chemin relatif au contexte, réduit à son premier segment
		// (ex : /ListePatients/supprimer -> /ListePatients)
		String path = request.getRequestURI().substring(request.getContextPath().length());
		int slash = path.indexOf('/', 1);
		String base = (slash == -1) ? path : path.substring(0, slash);

		if (PUBLIC_PATHS.contains(base) || base.equals("/resources") || base.equals("/favicon.ico")) {
			chain.doFilter(req, res);
			return;
		}

		// URL qui ne correspond à aucun servlet connu : le conteneur renverra un 404
		boolean known = PATIENT_PATHS.contains(base) || DENTISTE_PATHS.contains(base)
				|| ADMIN_PATHS.contains(base) || SHARED_PATHS.contains(base);
		if (!known) {
			chain.doFilter(req, res);
			return;
		}

		HttpSession session = request.getSession(false);
		Object user = (session == null) ? null : session.getAttribute("user");

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/espace-page.jsp");
			return;
		}

		boolean allowed = SHARED_PATHS.contains(base)
				|| (user instanceof Patient && PATIENT_PATHS.contains(base))
				|| (user instanceof Dentiste && DENTISTE_PATHS.contains(base))
				|| (user instanceof Admin && ADMIN_PATHS.contains(base));

		if (allowed) {
			chain.doFilter(req, res);
		} else {
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
		}
	}

}
