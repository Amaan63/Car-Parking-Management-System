package com.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PaymentDao;
import com.helper.FactoryProvider;

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

		// Debugging: Print full query string
		System.out.println("Query String: " + request.getQueryString());

		String paymentId = request.getParameter("payment_id");
		System.out.println("Received Payment ID: " + paymentId); // Debugging Payment ID

		HttpSession session = request.getSession(false); // false prevents creating a new session if it doesn't exist

		// Declare variables before the if block
		String paymentEmail = null;
		String vehicleNumber = null;
		String parkingToken = null;
		String orderId = null;
		long amount = 0L;

		// Get current date-time as a formatted String
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String paymentDate = now.format(formatter);

		if (session != null) {
			// Debugging: Print all session attributes
			Enumeration<String> attributeNames = session.getAttributeNames();
			System.out.println("Session Attributes:");
			while (attributeNames.hasMoreElements()) {
				String attributeName = attributeNames.nextElement();
				System.out.println(attributeName + " = " + session.getAttribute(attributeName));
			}

			// Fetch session attributes
			paymentEmail = (String) session.getAttribute("paymentEmail");
			vehicleNumber = (String) session.getAttribute("payingVehicleNumber");
			parkingToken = (String) session.getAttribute("parkingToken");
			orderId = (String) session.getAttribute("order_id");

			// Fix type casting issue for amount
			Object amountObj = session.getAttribute("amount");
			if (amountObj instanceof Number) {
				amount = ((Number) amountObj).longValue();
			} else {
				amount = 0L;
			}

			System.out.println("Extracted Session Data: " + paymentEmail + " " + vehicleNumber + " " + parkingToken
					+ " " + paymentDate + " " + amount);
			System.out.println("Order  ID: " + orderId); // Debugging OrderId ID
		} else {
			System.out.println("Session is null or expired.");
		}

		String status;
		if (paymentId != null && !paymentId.trim().isEmpty()) {
			System.out.println("Payment Not Null");
			status = "SUCCESSFUL";
		} else {
			System.out.println("Payment Failed");
			status = "FAILED";
			paymentId = "N/A"; // Store "N/A" for failed transactions
		}

		// **Update payment status in the database**
		PaymentDao paymentDao = new PaymentDao(FactoryProvider.getFactory());
		boolean isUpdated = false;

		try {
			if (paymentEmail == null || paymentEmail.isEmpty()) {
				System.out.println("Error: Email is null before inserting into the database.");
			} else {
				System.out.println("Email before insertion: " + paymentEmail);
				isUpdated = paymentDao.storePayment(paymentEmail, amount, status, vehicleNumber, paymentDate,
						parkingToken, paymentId, orderId);
			}

		} catch (Exception e) {
			System.out.println("Error in PaymentDao.storePayment:");
			e.printStackTrace(); // Print SQL Exception
		}

		System.out.println("Before Payment Updation");
		System.out.println(paymentId + " " + paymentEmail + " " + vehicleNumber + " " + parkingToken + " " + paymentDate
				+ " " + amount);

		if (isUpdated) {
			System.out.println("Payment Successfully Stored in DB");
			session.setAttribute("paymentStatus", "done");
		} else {
			System.out.println("Payment Storage Failed");
			session.setAttribute("paymentStatus", "failed");
		}

		response.sendRedirect("UserPages/ParkingHistory.jsp");
	}

}
