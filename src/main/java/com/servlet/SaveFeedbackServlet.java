package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		PrintWriter out = response.getWriter();

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

			// Displaying the retrieved data
			out.println("<html><head><title>Feedback Details</title></head><body>");
			out.println("<h2>Feedback Details</h2>");
			out.println("<p><strong>Email:</strong> " + email + "</p>");
			out.println("<p><strong>Feedback Message:</strong> " + feedbackMessage + "</p>");
			out.println("<p><strong>Rating:</strong> " + rating + " Star(s)</p>");
			out.println("<p><strong>Suggestions:</strong> " + (suggestions.isEmpty() ? "No suggestions" : suggestions)
					+ "</p>");
			out.println("<p><strong>Feedback Time:</strong> " + feedbackTime + "</p>");
			out.println("<a href='feedback_form.jsp'>Go Back</a>"); // Link to feedback form
			out.println("</body></html>");
		} catch (NumberFormatException e) {
			out.println("<h3>Error: Invalid rating value</h3>");
		}

	}

}
