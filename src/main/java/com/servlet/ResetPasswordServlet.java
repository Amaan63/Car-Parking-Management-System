package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class ResetPasswordServlet
 */
@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String pass1 = request.getParameter("newPassword");
		String pass2 = request.getParameter("confirmPassword");
		HttpSession session = request.getSession();
		if (!pass1.equals(pass2)) {
			session.setAttribute("PasswordStatus", "Both the password does not match");
			response.sendRedirect("User-Registration&Login.jsp");
			return;
		}
		UserDao userDao = new UserDao(FactoryProvider.getFactory());
		boolean status = userDao.resetPassword(email, pass2);
		if (status) {
			session.setAttribute("PasswordStatus", "Reset The Password Successfully");
			response.sendRedirect("User-Registration&Login.jsp");
		} else {
			session.setAttribute("PasswordStatus", "Failed");
			response.sendRedirect("index.jsp");
		}
	}
}
