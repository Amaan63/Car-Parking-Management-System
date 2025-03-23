package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.entities.User;
import com.helper.FactoryProvider;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserLoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String emailAddress = request.getParameter("userEmail");
			String password = request.getParameter("userPassword");
			

			// Initialize session
			HttpSession session = request.getSession();

			// Check if the user is trying to log in as admin from the wrong page
			if ("admin@gmail.com".equals(emailAddress) && "admin123".equals(password)) {
				session.setAttribute("loginStatus", "Please use the Admin Login Page.");
				response.sendRedirect("Admin-Login.jsp"); // Redirect to admin login page
				return;
			}

			// Validations
			UserDao userDao = new UserDao(FactoryProvider.getFactory());
			User user = userDao.getUserByEmail(emailAddress);

			// Check if the user exists
			if (user == null) {
				// Email does not exist
				session.setAttribute("loginStatus", "Email is incorrect.");
				response.sendRedirect("User-Registration&Login.jsp");
			} else {
				// Email exists, now check the password
				if (user.getUserPassword().equals(password)) {
					// Password is correct
					int userId = (Integer)user.getUserId();
					session.setAttribute("loginStatus", "Successfully Logged In");
					session.setAttribute("userForBanner", user); // Store the user object in session
					session.setAttribute("userForProfile", user); // For Profile
					session.setAttribute("userDetailForBooking", user); // For Booking Form Details
					session.setAttribute("userForFetchingVehicleByEmail", user); // For Fetching user Booked Vehicle
					session.setAttribute("currentUserForValidations", user); //For user Logout
					session.setAttribute("userForAuthentication", user); // For Security
					session.setAttribute("userIdForUpcomingReservation",userId); // For Fetching Upcoming Booking for particular user
					session.setAttribute("userForPaymentHistory",user); // For Fetching Payment History for particular user
					response.sendRedirect("UserPages/UserDashBoard.jsp");

				} else {
					// Password is incorrect
					session.setAttribute("loginStatus", "Password is incorrect.");
					response.sendRedirect("User-Registration&Login.jsp");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
