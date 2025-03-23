package com.servlet;

import javax.annotation.PostConstruct;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.dao.ParkingSlotDao;
import com.dao.VehicleDao;
import com.helper.FactoryProvider;

@WebServlet(name = "SlotAssignmentServlet", urlPatterns = {}, loadOnStartup = 1)
public class SlotAssignmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	private ParkingSlotDao parkingSlotDao;
	private VehicleDao vehicleDao;

	@PostConstruct //It allows you to initialize resources or perform setup tasks when the bean is created.
	public void init() {

		parkingSlotDao = new ParkingSlotDao(FactoryProvider.getFactory());
		assignSlotsOnStartup();
		vehicleDao = new VehicleDao(FactoryProvider.getFactory());
		updateStatusOfVehicleOnStartup();
		deallocateSlotsOnStartup();
		
	}

	public void assignSlotsOnStartup() {
		try {
			System.out.println("Server startup: Assigning slots to vehicles...");
			String result = parkingSlotDao.allocateSlotsAutomatically();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("Error during automatic slot assignment: " + e.getMessage());
		}
	}
	public void updateStatusOfVehicleOnStartup() {
		try {
			System.out.println("Server startup: Assigning Statuses to vehicles...");
			String result = vehicleDao.updateAllVehicleStatuses();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("Error during automatic Status assignment: " + e.getMessage());
		}
	}
	public void deallocateSlotsOnStartup() {
		try {
			System.out.println("Server startup: Deallocating slots to vehicles...");
			String result = parkingSlotDao.deallocateSlotsAutomatically();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("Error during automatic slot Deallocation: " + e.getMessage());
		}
	}
}
