

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UserDashBoard</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@include file="../css/bootstrapCDN.jsp"%>
<link rel="stylesheet" href="../css/global.css">
<link rel="icon" type="image/x-icon" href="../images/Logo/Logo2.png">

</head>
<body class="min-vh-100">
	<%@include file="../components/UserComponents/UserHomeNavBar.jsp"%>
	<%@include file="../components/UserComponents/WelcomeBanner.jsp"%>
	<%@include file="../components/UserComponents/UserMainContent.jsp"%>

	<div class="container py-5">
		<!-- Main row centered horizontally -->
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="row g-4">
					<!-- Including the Recent Activity Section -->
					<%@include file="../components/UserComponents/RecentActivity.jsp"%>

					<!-- Including the Quick Stats Section -->
					<%@include file="../components/UserComponents/QuickStats.jsp"%>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../components/UserComponents/UpcomingReservation.jsp"%>
	<%@include file="../components/UserComponents/ParkingRateCard.jsp"%>
	<%@include file="../components/Footer.jsp"%>

	<%
	// For Logged In Component
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
	
</body>
</html>