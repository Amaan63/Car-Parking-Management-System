package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AdminDao;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class DeleteUserByIdServlet
 */
@WebServlet("/DeleteUserByIdServlet")
public class DeleteUserByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Retrieve user ID from request
        String userIdStr = request.getParameter("id");
        
        

        if (userIdStr != null) {
            try {
                int userId = Integer.parseInt(userIdStr); // Convert to int if needed
                
                // Call DAO method to delete user by ID
                AdminDao adminDAO = new AdminDao(FactoryProvider.getFactory());
                boolean deleted = adminDAO.deleteUserById(userId);
                
                if (deleted) {
                    //response.sendRedirect("userList.jsp?msg=UserDeleted");
                	
                	System.out.println("Deleted User Id");
                } else {
                    //response.sendRedirect("userList.jsp?msg=ErrorDeletingUser");
                	System.out.println("Error in Deleting User");
                }
            } catch (NumberFormatException e) {
                //response.sendRedirect("userList.jsp?msg=InvalidUserId");
            	System.out.println("Invalid User Id");
            }
        } else {
            //response.sendRedirect("userList.jsp?msg=UserIdMissing");
        	System.out.println("Missing User Id");
        }
		
	}


	

}
