package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PaymentVerificationServlet
 */
@WebServlet("/PaymentVerificationServlet")
public class PaymentVerificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PaymentVerificationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String paymentId = request.getParameter("payment_id");
		
		HttpSession session =  request.getSession();
		//System.out.println(paymentId);

		if (paymentId != null) {
			// Here, you can update the database for payment success
			session.setAttribute("paymentStatus", "done");
			response.sendRedirect("UserPages/ParkingHistory.jsp");
			//System.out.print("Successfull Payment");
		} else {
			session.setAttribute("paymentStatus", "failed");
			response.sendRedirect("UserPages/ParkingHistory.jsp");
			//System.out.print("Error or Failed Payment");
		}
	}

}
