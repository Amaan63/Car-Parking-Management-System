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
<style>
.sidebar {
	min-height: 100vh;
	box-shadow: inset -1px 0 0 rgba(0, 0, 0, 0.1);
}

.sidebar .nav-link {
	padding: 1rem;
	color: #ffffff80;
	border-radius: 8px;
	margin: 4px 0;
}

.sidebar .nav-link:hover, .sidebar .nav-link.active {
	color: white;
	background: rgba(255, 255, 255, 0.1);
}

.stats-card {
	transition: transform 0.2s;
}

.stats-card:hover {
	transform: translateY(-5px);
}

.parking-slot {
	width: 60px;
	height: 80px;
	margin: 5px;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	border-radius: 8px;
	cursor: pointer;
}
</style>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<%@include file="../components/AdminComponents/Sidebar.jsp"%>
			<%@include file="../components/AdminComponents/AdminNavBar.jsp"%>
			<%@include file="../components/AdminComponents/Cards.jsp"%>
			<%@include file="../components/AdminComponents/QuickAction.jsp"%>
			<%@include file="../components/AdminComponents/Charts.jsp"%>

			<%@include file="../components/AdminComponents/ParkingMap.jsp"%>
		</div>
	</div>
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

	<%
	String slotStatus = (String) session.getAttribute("creatingSlot");
	if (slotStatus != null && slotStatus.equals("Successful")) {
	%>
	<%@ include file="../components/popups/SlotSuccessfulPopup.jsp"%>
	<%
	session.removeAttribute("creatingSlot");
	} else if (slotStatus != null && slotStatus.equals("Rejected")) {
	%>
	<%@ include file="../components/popups/SlotRejectedPopup.jsp"%>
	<%
	}
	session.removeAttribute("creatingSlot");
	%>
</body>
</html>