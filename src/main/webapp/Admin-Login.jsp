<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<%@include file="css/bootstrapCDN.jsp"%>
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/Admin-Login-Css.css">
<link rel="icon" type="image/x-icon" href="images/Logo/Logo2.png">
</head>
<body>
	<div class="admin-header">Admin Portal</div>

	<div class="container">
		<div class="form-wrapper">
			<img src="images/Login&Registration/AdminLogin.svg"
				alt="Admin Login Image" />
			<form class="form" action="AdminLoginServlet" method="post">
				<h2>Admin Login</h2>
				<div class="mb-3">
					<label for="adminEmail" class="form-label">Admin Email</label> <input
						type="email" class="form-control" id="adminEmail"
						placeholder="Enter admin email" name="adminEmail" required />
				</div>
				<div class="mb-3">
					<label for="adminPassword" class="form-label">Password</label> <input
						type="password" class="form-control" id="adminPassword"
						placeholder="Enter admin password" name="adminPassword" required />
				</div>
				<div class="forgot-password">
					<a href="admin-reset-password.jsp">Forgot Password?</a>
				</div>
				<button type="submit" class="btn mt-3">Login as Admin</button>
			</form>
		</div>
	</div>
	<%
	// Get the logout message from the session
	String loginStatus = (String) session.getAttribute("loginStatus");

	// Check if the logout message is set
	if (loginStatus != null && loginStatus.equals("Invalid Admin Credentials")) {
	%>
	<%@ include file="components/popups/AdminInvalidPopup.jsp"%>
	<%
	// Remove the logout message from the session to prevent the popup from showing on reload
	session.removeAttribute("loginStatus");
	} else if (loginStatus != null && loginStatus.equals("Please use the Admin Login Page.")) {
	%>
		<script type="text/javascript">
		 alert('Please use the Admin Login Page.');
		</script>
	<%
	// Remove the logout message from the session to prevent the popup from showing on reload
	session.removeAttribute("loginStatus");
	}
	%>
</body>
</html>