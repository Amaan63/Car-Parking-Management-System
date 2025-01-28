<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<title>Landing Page</title>
<%@include file="css/bootstrapCDN.jsp"%>
<link rel="stylesheet" href="css/LandingPage-Css.css" />
<link rel="stylesheet" href="css/global.css" />
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="images/Logo/Logo2.png" />
</head>
<body>
	<%@include file="components/Navbar-for-LandingPage.jsp"%>
	<%@include file="components/HeroSection.jsp"%>
	<%@include file="components/ImageSection.jsp"%>
	<%@include file="components/Stats.jsp"%>
	<%@include file="components/ShortBio.jsp"%>
	<%@include file="components/Features.jsp"%>
	<%@include file="components/Services.jsp"%>
	<%@include file="components/AdditionalContent.jsp"%>
	<%@include file="components/Footer.jsp"%>
	<%
	// Get the logout message from the session
	String userLogout = (String) session.getAttribute("userLogoutMessage");

	// Check if the logout message is set
	if (userLogout != null && userLogout.equals("Logout Successfully")) {
	%>
	<%@ include file="components/popups/UserLogoutPopup.jsp"%>
	<%
	// Remove the logout message from the session to prevent the popup from showing on reload
	session.removeAttribute("userLogoutMessage");
	}
	%>

</body>
</html>
