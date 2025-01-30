package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UserLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserLogout() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get the current session, if it exists
		HttpSession session = request.getSession(false);

		if (session != null) {
			// Optional: Remove attributes related to the user
			session.removeAttribute("currentuser");

//			// Set a logout message BEFORE invalidating the session
//			request.setAttribute("userLogoutMessage", "Logout Successfully");

			// Invalidate the session to log out the user
			session.invalidate();
			
			HttpSession s = request.getSession();
			s.setAttribute("userLogoutMessage", "Logout Successfully");
		}

		// Redirect to the login or home page
		response.sendRedirect("index.jsp");
	}
}
