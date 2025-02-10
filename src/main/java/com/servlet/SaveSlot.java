package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ParkingSlotDao;
import com.entities.Slot;
import com.helper.FactoryProvider;

@WebServlet("/SaveSlot")
public class SaveSlot extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaveSlot() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String slotName = request.getParameter("slotName");
		String slotStatus = request.getParameter("slotStatus");

		HttpSession session =  request.getSession();
		Slot slot = new Slot(slotName, slotStatus);
		ParkingSlotDao parkingSlotDao = new ParkingSlotDao(FactoryProvider.getFactory());
		
		boolean status;
		
		status = parkingSlotDao.addSlot(slot);
		if(status) {
			session.setAttribute("creatingSlot", "Successful");
			response.sendRedirect("AdminPages/AdminDashBoard.jsp");
		}
		else {
			session.setAttribute("creatingSlot", "Rejected");
			response.sendRedirect("AdminPages/AdminDashBoard.jsp");
		}
	}

}
