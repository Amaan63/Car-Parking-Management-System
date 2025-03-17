package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class UpdateUserByIdServlet
 */
@WebServlet("/UpdateUserByIdServlet")
public class UpdateUserByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateUserByIdServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		try {
			int userId = Integer.parseInt(request.getParameter("userId"));
			String userName = request.getParameter("userName");
			String userEmail = request.getParameter("userEmail");
			String userPassword = request.getParameter("userPassword");
			String userPhoneNumber = request.getParameter("userPhoneNumber");
			String userAddress = request.getParameter("userAddress");

			HttpSession session = request.getSession();

			UserDao userDao = new UserDao(FactoryProvider.getFactory());
			boolean isUpdated = userDao.updateUserById(userId, userName, userPhoneNumber, userAddress, userPassword, userEmail);

			if (isUpdated) {
			    // Fetch updated user again
			    User updatedUser = userDao.getUserById(userId);
			    session.setAttribute("userForProfile", updatedUser);
			    session.setAttribute("currentUserForValidations", updatedUser);
				session.setAttribute("updateStatus", "Updated Successfully");
				response.sendRedirect(request.getContextPath() + "/UserPages/UserDashBoard.jsp");
			} else {
				session.setAttribute("updateStatus", "Updation Failed");
				response.sendRedirect("../UserPages/UserDashBoard.jsp");
			}
		} catch (NumberFormatException e) {
			out.println("Invalid user ID format.");
			e.printStackTrace();
		} catch (Exception e) {
			out.println("An error occurred while updating user.");
			e.printStackTrace();
		}
	}

}
