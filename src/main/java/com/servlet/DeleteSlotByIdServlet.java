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

@WebServlet("/DeleteSlotByIdServlet")
public class DeleteSlotByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AdminDao adminDao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int slotId = Integer.parseInt(request.getParameter("slotId"));

		adminDao = new AdminDao(FactoryProvider.getFactory());
		boolean isDeleted = adminDao.deleteSlotById(slotId);

		HttpSession session = request.getSession();
		
		if (isDeleted) {
			session.setAttribute("slotStatus", "Deleted Successfully");
			System.out.println("Deleted Slot");
			response.sendRedirect("AdminPages/ManageSlots.jsp");
		} else {
			session.setAttribute("slotStatus", "Deletion Failed");
			response.sendRedirect("AdminPages/ManageSlots.jsp");
		}
	}

}
