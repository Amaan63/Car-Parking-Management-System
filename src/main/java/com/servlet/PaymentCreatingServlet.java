package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;

import io.github.cdimascio.dotenv.Dotenv;

@WebServlet("/PaymentServlet")
public class PaymentCreatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Load dotenv File
	private static final Dotenv dotenv = Dotenv.load();
    private static final String RAZORPAY_KEY_ID;
    private static final String RAZORPAY_SECRET_ID;

    static {
        if (System.getenv("RENDER") != null) {
            // Running on Render, use system environment variables
            RAZORPAY_KEY_ID = System.getenv("RAZORPAY_KEY_ID");
            RAZORPAY_SECRET_ID = System.getenv("RAZORPAY_SECRET_KEY");
        } else {
            // Running locally, load from .env
            Dotenv dotenv = Dotenv.load();
            RAZORPAY_KEY_ID = dotenv.get("RAZORPAY_KEY_ID");
            RAZORPAY_SECRET_ID = dotenv.get("RAZORPAY_SECRET_KEY");
        }
    }

	public PaymentCreatingServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setHeader("Access-Control-Allow-Origin", "*");
	    response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
	    response.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");
	    
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    System.out.println("Using Razorpay Key: " + RAZORPAY_KEY_ID);

		try {
			long amountInPaise = Long.parseLong(request.getParameter("amount")); // Amount in paise
			String email = request.getParameter("email"); // Fetch user email
			String vehicleNumber = request.getParameter("vehicleNumber");
			String parkingToken = request.getParameter("parkingToken");

			
			
			System.out.println(vehicleNumber+" "+parkingToken+" "+amountInPaise+" "+email+" ");
			

			// Initialize Razorpay Client
			RazorpayClient razorpay = new RazorpayClient(RAZORPAY_KEY_ID, RAZORPAY_SECRET_ID);

			// Create Order Request
			JSONObject orderRequest = new JSONObject();
			orderRequest.put("amount", amountInPaise);
			orderRequest.put("currency", "INR");
			orderRequest.put("receipt", "txn_" + System.currentTimeMillis());

			// Create Order
			Order order = razorpay.orders.create(orderRequest);
			String orderId = order.get("id");

			// Sending the data to Verification Servlet to Verify
			HttpSession session = request.getSession();
			session.setAttribute("paymentEmail", email);
			session.setAttribute("payingVehicleNumber", vehicleNumber);
			session.setAttribute("parkingToken", parkingToken);
			session.setAttribute("amount", amountInPaise);
			session.setAttribute("order_id", orderId);
			

			// Send Order Details to Front-End
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", true);
			jsonResponse.put("key", RAZORPAY_KEY_ID);
			jsonResponse.put("amount", amountInPaise);
			// System.out.println(order.get("id").getClass().getName());
			jsonResponse.put("orderId", orderId);
			// System.out.println("Finished Payment");

			out.print(jsonResponse.toString());
			
	        
	    


		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			// System.out.println("Error in Payment");
			out.print("{\"success\": false}");

		}

	}
	// Optional: Override doGet to show a clear message instead of 405
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Use POST instead of GET");
    }

}
