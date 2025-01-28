package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.VehicleDao;
import com.entities.User;
import com.entities.Vehicle;
import com.helper.FactoryProvider;

public class SaveVehicleBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
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
//		out.println("Booking Details");
//		out.println(userName);
//		out.println(userEmail);
//		out.println(vehicleCompany);
//		out.println(vehicleName);
//		out.println(vehicleNumber);
//		out.println(vehicleType);
//		out.println(bookingDate);
//		out.println(timeDuration);
		
		
		HttpSession session = request.getSession();
		
		Vehicle vehicle = new Vehicle(userName, userEmail, vehicleCompany, vehicleName, vehicleNumber, vehicleType, bookingDate, timeDuration);
		
		VehicleDao vehicleDao = new VehicleDao(FactoryProvider.getFactory());
		User user =  vehicleDao.getUserById(userId);
		vehicle.setUser(user);
		
		boolean status = vehicleDao.saveVehicle(vehicle);
		if (status) {
			session.setAttribute("bookingStatus", "Successfully Booked the Parking Spot");
			response.sendRedirect("UserPages/UserDashBoard.jsp");
		} else {
			session.setAttribute("bookingStatus", "Failed Booking");
			response.sendRedirect("UserPages/UserDashBoard.jsp");
		}
		
	}
}
