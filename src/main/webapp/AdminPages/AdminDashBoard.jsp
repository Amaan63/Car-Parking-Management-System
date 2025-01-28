<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin DashBoard</title>
<%@include file="../css/bootstrapCDN.jsp"%>
<link rel="stylesheet" href="../css/global.css">
<link rel="icon" type="image/x-icon" href="../images/Logo/Logo2.png">
</head>
<body>
	<h1>Welcome Admin</h1>

	<%
	// Get the logout message from the session
	String adminLoggedIn = (String) session.getAttribute("loginStatus");

	// Check if the logout message is set
	if (adminLoggedIn != null && adminLoggedIn.equals("Successfully Logged In as Admin")) {
	%>
	<%@ include file="../components/popups/AdminLoginPopup.jsp"%>
	<%
	// Remove the logout message from the session to prevent the popup from showing on reload
	session.removeAttribute("loginStatus");
	}
	%>
</body>
</html>