package com.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/FAQ")
public class FAQ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FAQ() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        String accountType = (String) session.getAttribute("accountType");
        
        if (accountType.equals("patient")) {
        	
        	request.getRequestDispatcher("/WEB-INF/faq/faqPatient.jsp").forward(request, response);
        	
		}else if (accountType.equals("dentiste")) {
			
			request.getRequestDispatcher("/WEB-INF/faq/faqDentiste.jsp").forward(request, response);
			
		}else if (accountType.equals("admin")) {
			
			request.getRequestDispatcher("/WEB-INF/faq/faqAdmin.jsp").forward(request, response);
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
