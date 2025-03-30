package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.FeedbackDao;
import com.entities.Feedback;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SaveFeedbackServlet
 */
@WebServlet("/SaveFeedbackServlet")
public class SaveFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaveFeedbackServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();

		try {
			// Retrieving form data
			String email = request.getParameter("email");
			String feedbackMessage = request.getParameter("feedbackMessage");
			String suggestions = request.getParameter("suggestions");
			String feedbackTime = request.getParameter("feedbackTime");

			// Convert rating to integer (default to 0 if null)
			int rating = 0;
			String ratingParam = request.getParameter("rating");
			if (ratingParam != null && !ratingParam.isEmpty()) {
				rating = Integer.parseInt(ratingParam);
			}

			// Identify the page from which the request came
			String sourcePage = request.getParameter("sourcePage"); // New hidden field in form

			// Save feedback
			FeedbackDao feedbackDao = new FeedbackDao(FactoryProvider.getFactory());
			Feedback feedback = new Feedback(email, rating, suggestions, feedbackMessage, feedbackTime);
			boolean status = feedbackDao.saveFeedback(feedback);

			if (status) {
				// Set success message in session
				session.setAttribute("feedbackStatus", "Feedback submitted successfully!");
			} else {
				// Set failure message in session
				session.setAttribute("feedbackStatus", "Failed to submit feedback. Please try again!");
			}

			// Redirect back to the page where the form was submitted
			if ("contactus".equalsIgnoreCase(sourcePage)) {
				response.sendRedirect("UserPages/ContactUs.jsp");
			} else {
				response.sendRedirect("index.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

}
