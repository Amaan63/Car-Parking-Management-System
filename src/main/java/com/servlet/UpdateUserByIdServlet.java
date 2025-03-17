package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateUserByIdServlet
 */
@WebServlet("/UpdateUserByIdServlet")
public class UpdateUserByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserByIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String userId =  request.getParameter("userId");
		String userName =  request.getParameter("userName");
		String userEmail =  request.getParameter("userEmail");
		String userPassword =  request.getParameter("userPassword");
		String userPhoneNumber =  request.getParameter("userPhoneNumber");
		String userAddress =  request.getParameter("userAddress");
		
		out.println(userId);
		out.println(userName);
		out.println(userEmail);
		out.println(userPassword);
		out.println(userPhoneNumber);
		out.println(userAddress);
	}

}
