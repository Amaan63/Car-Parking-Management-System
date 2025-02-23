package com.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class AuthentificationFilter implements Filter {


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		HttpSession session = httpRequest.getSession(false); // Don't create a new session if none exists
		String requestURI = httpRequest.getRequestURI();

		// Debugging: Log the request URI to make sure it's correct
		// System.out.println("Request URI: " + requestURI);

		boolean isLoggedIn = (session != null && session.getAttribute("userForAuthentication") != null);
		boolean isAdminLoggedIn = (session != null && session.getAttribute("currentAdmin") != null); // Check if admin
																										// is logged in
		// Debugging: Check session attributes
//	    if (session != null) {
//	        System.out.println("Session ID: " + session.getId());
//	        System.out.println("Session Admin: " + session.getAttribute("currentAdmin"));
//	    }
		// Skip filter for login, registration, admin login pages, static resources, or
		// if user/admin is logged in
		if (isLoginRequest(requestURI) || isPublicPage(requestURI) || isStaticResource(requestURI) || isLoggedIn
				|| isAdminLoggedIn) {
			chain.doFilter(request, response); // Let the request pass through if it's a login page, public page, or
												// logged-in user/admin
		} else {
			// Redirect unauthorized user/admin to login page
			if (session == null) {
				session = httpRequest.getSession(true); // Create session if none exists
			}
			session.setAttribute("notAuthenticated", "Please login to access this page.");
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/index.jsp");
		}
	}

	// Method to identify public pages
	private boolean isPublicPage(String uri) {
		return uri.endsWith("index.jsp") || uri.endsWith("/") || uri.endsWith("User-Registration&Login.jsp")
				|| uri.endsWith("Admin-Login.jsp"); // Ensure login pages are public
	}

	// Improved static resource detection (CSS, JS, images)
	private boolean isStaticResource(String uri) {
		return uri.contains("/css/") || uri.contains("/javascript/") || uri.contains("/images/") || uri.contains("/videos/");
	}

	// Check if the request is targeting the login page, login servlet, admin login
	// page, or admin login servlet
	private boolean isLoginRequest(String uri) {
		System.out.println("Checking URI: " + uri); // Add this line to print the URI
		// Ensure this includes both admin login and its servlet
		return uri.endsWith("UserLoginServlet") || uri.endsWith("User-Registration&Login.jsp")
				|| uri.endsWith("UserRegistrationServlet") || uri.endsWith("AdminLoginServlet")
				|| uri.endsWith("Admin-Login.jsp");
	}

}
