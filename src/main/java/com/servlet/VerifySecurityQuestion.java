package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.entities.User;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class VerifySecurityQuestion
 */
@WebServlet("/VerifySecurityQuestion")
public class VerifySecurityQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve the parameters from the form submission
		String email = request.getParameter("email");
		String question = request.getParameter("forgotPasswordSecurityQuestion");
		String answer = request.getParameter("forgotPasswordAnswer");

		HttpSession session = request.getSession();

		// Create an instance of the UserDao to interact with the database
		UserDao userDao = new UserDao(FactoryProvider.getFactory());

		// Verify the security details (question, answer, and email)
		boolean isVerified = userDao.verifySecurityDetails(question, answer, email);

		if (isVerified) {
			System.out.println("Verified");
			// Set the verified user in the session for further use (e.g., password reset)
			session.setAttribute("ShowResetModal", "visible");
			session.setAttribute("passwordVerificationEmail", email);
			response.sendRedirect("User-Registration&Login.jsp"); // Redirect to the registration page
		} else {
			System.out.println("failed");
			session.setAttribute("ShowResetModal", "Hide");
			response.sendRedirect("index.jsp"); // Redirect back with an error message
		}

	}

}
