package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.VehicleDao;
import com.entities.User;
import com.entities.Vehicle;
import com.helper.FactoryProvider;

@WebServlet("/fetchVehicles")
public class FetchVehicleByEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FetchVehicleByEmail() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = null; // Initialize the email variable
		List<Vehicle> vehicles = null; // Initialize the vehicles list

		VehicleDao vehicleDao = new VehicleDao(FactoryProvider.getFactory());
		
		HttpSession session = request.getSession(false); // Get the existing session without creating a new one

		if (session != null) {
			// Retrieve user details from session
			User userDetailForFetchingVehicle = (User) session.getAttribute("userForFetchingVehicleByEmail");
			if (userDetailForFetchingVehicle != null) {
				email = userDetailForFetchingVehicle.getUserEmail();
				System.out.println(email);
			}
		}

		if (email != null && !email.isEmpty()) {
			try {
			    // Fetch the list of vehicles by email
			    vehicles = vehicleDao.getAllVehicleByEmailId(email);
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("index.jsp");
				return; // Exit the method to prevent further execution
			}
		} else {
			// If email is null or empty, redirect to an appropriate page
			response.sendRedirect("User-Registration&Login.jsp");
			return; // Exit the method
		}

		// Set the vehicles list as a request attribute
		request.setAttribute("vehicles", vehicles);

		// Forward the request to the JSP page
		request.getRequestDispatcher("UserPages/ParkingHistory.jsp").forward(request, response);
	}

}
