package com.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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

@WebServlet("/SaveVehicleBooking")
public class SaveVehicleBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int userId = Integer.parseInt(request.getParameter("userId"));
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String vehicleCompany = request.getParameter("vehicleCompany");

		if (vehicleCompany.equals("Other")) {
			vehicleCompany = request.getParameter("otherCompany");
		}
		String vehicleName = request.getParameter("vehicleName");
		String vehicleNumber = request.getParameter("vehicleNumberPlate");
		String vehicleType = request.getParameter("vehicleType");
		String bookingDate = request.getParameter("bookingDate");
		String timeDuration = request.getParameter("timeDuration");
		
		// Get current timestamp
	    LocalDateTime createdAt = LocalDateTime.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    String formattedCreatedAt = createdAt.format(formatter); // Format to store in database

		VehicleDao vehicleDao = new VehicleDao(FactoryProvider.getFactory());
		HttpSession session = request.getSession();

		// Validate if vehicle number already exists
		if (vehicleDao.isVehicleNumberExists(vehicleNumber)) {
			session.setAttribute("bookingStatus", "Vehicle number already exists.");
			response.sendRedirect("UserPages/BookingForm.jsp");
			return;
		}

		Vehicle vehicle = new Vehicle(userName, userEmail, vehicleCompany, vehicleName, vehicleNumber, vehicleType,
				bookingDate, timeDuration,formattedCreatedAt);

		User user = vehicleDao.getUserById(userId);
		vehicle.setUser(user);

		boolean status = vehicleDao.saveVehicle(vehicle);
		if (status) {
			// Ensure vehicle ID is generated (if using auto-increment)
			if (vehicle.getVehicleId() > 0) {
				vehicleDao.calculateAndUpdateCost(vehicle.getVehicleId());
				session.setAttribute("bookingStatus", "Successfully Booked the Parking Spot");
			} else {
				System.out.println("Cannot find the Vehicle Id");
				session.setAttribute("bookingStatus", "Failed Booking");
			}

			response.sendRedirect("UserPages/UserDashBoard.jsp");
		} else {
			session.setAttribute("bookingStatus", "Failed Booking");
			response.sendRedirect("UserPages/UserDashBoard.jsp");
		}

	}
}
