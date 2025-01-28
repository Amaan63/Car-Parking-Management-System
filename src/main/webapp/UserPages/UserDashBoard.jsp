

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UserDashBoard</title>

<%@include file="../css/bootstrapCDN.jsp"%>
<link rel="stylesheet" href="../css/global.css">
<link rel="icon" type="image/x-icon" href="../images/Logo/Logo2.png">

</head>
<body>
	<%@include file="../components/UserComponents/UserHomeNavBar.jsp"%>
	<%@include file="../components/UserComponents/WelcomeBanner.jsp"%>
	<%@include file="../components/UserComponents/UserMainContent.jsp"%>
	<%
	// For Logged In COmponent
	// Retrieve the session attribute
	String loginStatus = (String) session.getAttribute("loginStatus");

	// Check if the attribute is null
	if (loginStatus != null) {
		if ("Successfully Logged In".equals(loginStatus)) {
			// Include the popup for successful registration
	%>
	<%@include file="../components/popups/LoginSuccessfulPopup.jsp"%>
	<%
	}
	// Remove the attribute to prevent the message from appearing again
	session.removeAttribute("loginStatus");
	}
	%>
	<%
	//For Booking COnfirmation
	// Retrieve the session attribute
	String bookingStatus = (String) session.getAttribute("bookingStatus");

	// Check if the attribute is null
	if (bookingStatus != null) {
		if ("Successfully Booked the Parking Spot".equals(bookingStatus)) {
			// Include the popup for successful registration
	%>
	<%@include file="../components/popups/VehicleBookingSuccessful.jsp"%>
	<%
	}
	// Remove the attribute to prevent the message from appearing again
	session.removeAttribute("bookingStatus");
	}
	%>
</body>
</html>