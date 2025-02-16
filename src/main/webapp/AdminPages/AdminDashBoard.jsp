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