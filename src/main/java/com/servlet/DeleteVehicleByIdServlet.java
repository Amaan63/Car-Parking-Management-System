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
@WebServlet("/DeleteVehicleByIdServlet")
public class DeleteVehicleByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Retrieve user ID from request
		String userIdStr = request.getParameter("id");

		HttpSession session = request.getSession();

		if (userIdStr != null) {
			try {
				int vehicleId = Integer.parseInt(userIdStr); // Convert to int if needed

				// Call DAO method to delete user by ID
				AdminDao adminDAO = new AdminDao(FactoryProvider.getFactory());
				boolean deleted = adminDAO.deleteVehicleById(vehicleId);

				if (deleted) {

					session.setAttribute("deleteVehicleStatus", "Successfully Deleted");

				} else {

					session.setAttribute("deleteVehicleStatus", "Error in Deleting the Vehicle");

				}
			} catch (NumberFormatException e) {

				session.setAttribute("deleteVehicleStatus", "Invalid Vehicle");
				System.out.println("Invalid Vehicle Id");
			}
		} else {

			System.out.println("Missing Vehicle Id");
		}
		response.sendRedirect("AdminPages/ManageVehicle.jsp");

	}

}
