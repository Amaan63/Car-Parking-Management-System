package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AdminDao;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class DeleteUserByIdServlet
 */
@WebServlet("/DeleteUserByIdServlet")
public class DeleteUserByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Retrieve user ID from request
		String userIdStr = request.getParameter("id");

		HttpSession session = request.getSession();

		if (userIdStr != null) {
			try {
				int userId = Integer.parseInt(userIdStr); // Convert to int if needed

				// Call DAO method to delete user by ID
				AdminDao adminDAO = new AdminDao(FactoryProvider.getFactory());
				boolean deleted = adminDAO.deleteUserById(userId);

				if (deleted) {
					// response.sendRedirect("userList.jsp?msg=UserDeleted");
					session.setAttribute("deleteUserStatus", "Successfully Deleted");

				} else {
					// response.sendRedirect("userList.jsp?msg=ErrorDeletingUser");
					session.setAttribute("deleteUserStatus", "Error in Deleting the User");

				}
			} catch (NumberFormatException e) {
				// response.sendRedirect("userList.jsp?msg=InvalidUserId");
				session.setAttribute("deleteUserStatus", "Invalid User");

			}
		} else {
			// response.sendRedirect("userList.jsp?msg=UserIdMissing");
			System.out.println("Missing User Id");
		}
		response.sendRedirect("AdminPages/ManageUsers.jsp");

	}

}
