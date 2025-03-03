package com.servlet;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ParkingSlotDao;
import com.helper.FactoryProvider;

import io.github.cdimascio.dotenv.Dotenv;


@WebServlet(name = "SlotAssignmentServlet", urlPatterns = {}, loadOnStartup = 1)
public class SlotAssignmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Dotenv dotenv = Dotenv.load(); // Loads from .env file

	private ParkingSlotDao parkingSlotDao;

	@PostConstruct //It allows you to initialize resources or perform setup tasks when the bean is created.
	public void init() {

		parkingSlotDao = new ParkingSlotDao(FactoryProvider.getFactory());
		assignSlotsOnStartup();
		
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
		String dbUrl = dotenv.get("DB_URL");
        String dbUser = dotenv.get("DB_USER");

        System.out.println("Database URL: " + dbUrl);
        System.out.println("Database User: " + dbUser);
	}
}
