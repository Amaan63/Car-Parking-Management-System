package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminLoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String emailAddress = request.getParameter("adminEmail");
			String password = request.getParameter("adminPassword");
			
			HttpSession session = request.getSession();
			
			// Check for admin login
			if ("admin@gmail.com".equals(emailAddress) && "admin123".equals(password)) {
				session.setAttribute("loginStatus", "Successfully Logged In as Admin");
				response.sendRedirect("AdminPages/AdminDashBoard.jsp");
				return;
			}
			else if (!"admin@gmail.com".equals(emailAddress) || !"admin123".equals(password)) {
			    session.setAttribute("loginStatus", "Invalid Admin Credentials");
			    response.sendRedirect("Admin-Login.jsp");  // You can set your own error or login page
			    return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
