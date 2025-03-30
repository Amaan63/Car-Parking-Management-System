
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.VehicleDao"%>
<%@page import="com.entities.User"%>

<%@page import="com.entities.Vehicle"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Parking History</title>
<%@include file="../css/bootstrapCDN.jsp"%>
<link rel="stylesheet" href="../css/global.css">
<link rel="icon" type="image/x-icon" href="../images/Logo/Logo2.png">
</head>
<body class="min-vh-100">
	<%@include file="../components/UserComponents/UserHomeNavBar.jsp"%>

	<%@include file="../components/UserComponents/VehicleDetails.jsp"%>
	<%
	// Retrieve the session attribute
	String bookingStatus = (String) session.getAttribute("bookingStatus");

	if (bookingStatus != null) {
		if ("Successfully Booked the Parking Spot".equals(bookingStatus)) {
			// Include the popup for successful booking
	%>
	<%@include file="../components/popups/VehicleBookingSuccessful.jsp"%>
	<%
	} else if (bookingStatus.equals("Failed Booking")) {
	%>
	<script type="text/javascript">
		alert("Server error! Please try again later.");
	</script>
	<%
	}
	// Remove the attribute to prevent duplicate alerts
	session.removeAttribute("bookingStatus");
	}
	%>


</body>
</html>