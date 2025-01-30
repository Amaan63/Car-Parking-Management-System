package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.entities.User;
import com.helper.FactoryProvider;

@WebServlet("/UserRegistrationServlet")
public class UserRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserRegistrationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		 	throws ServletException, IOException {
		//PrintWriter out = response.getWriter();
		String userFullName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");
		String userPhoneNumber = request.getParameter("userPhoneNumber");
		String userAddress = request.getParameter("userAddress");
		HttpSession session = request.getSession();
		
		User user = new User(userFullName, userEmail, userPassword, userAddress, userPhoneNumber);

		UserDao userdao = new UserDao(FactoryProvider.getFactory());
		boolean status = userdao.saveUser(user);
		if (status) {
			session.setAttribute("UserRegistration", "Successfull");
			response.sendRedirect("User-Registration&Login.jsp");
		} else {
			session.setAttribute("UserRegistration", "Failed");
			response.sendRedirect("User-Registration&Login.jsp");
		}

	}
}
