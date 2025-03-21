<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Admin DashBoard</title>
<%@include file="../css/bootstrapCDN.jsp"%>
<link rel="stylesheet" href="../css/global.css">
<link rel="icon" type="image/x-icon" href="../images/Logo/Logo2.png">

</head>
<body class="min-vh-100">

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
	} else if (slotStatus != null && slotStatus.equals("Duplicate")) {
	%>
	<!-- Bootstrap Modal -->
	<div class="modal fade" id="DuplicateSlotRecordedModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content bg-dark">
				<div class="modal-header">
					<h5 class="modal-title text-danger">Slot Is Already Exist
						Please Use Different Name for a SLot</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>

	<script>
		var DuplicateSlotRecordedModal = new bootstrap.Modal(document
				.getElementById('DuplicateSlotRecordedModal'));
		DuplicateSlotRecordedModal.show();
	</script>

	<%
	session.removeAttribute("creatingSlot");
	}
	%>

	<%
	String parkingRatesStatus = (String) session.getAttribute("parkingRatesStatus");
	if (parkingRatesStatus != null && parkingRatesStatus.equals("Successfully created Parking Rates")) {
	%>
	<%@ include file="../components/popups/ParkingRatesSuccessPopup.jsp"%>
	<%
	session.removeAttribute("creatingSlot");
	} else if (parkingRatesStatus != null && parkingRatesStatus.equals("Failed to Create Parking Rates")) {
	%>
	<%@ include file="../components/popups/ParkingRatesErrorPopup.jsp"%>
	<%
	}
	session.removeAttribute("parkingRatesStatus");
	%>

</body>
</html>