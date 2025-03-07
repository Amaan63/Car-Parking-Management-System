<%@page import="com.entities.Slot"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.ParkingSlotDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Slots</title>
<%@include file="../css/bootstrapCDN.jsp"%>
<link rel="stylesheet" href="../css/global.css">
<link rel="icon" type="image/x-icon" href="../images/Logo/Logo2.png">
<link rel="stylesheet" href="../css/Admin-Management.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<%@include file="../components/AdminComponents/Sidebar.jsp"%>
			<%@include file="../components/AdminComponents/AdminNavBar.jsp"%>
			<!-- Main Content -->

			<div
				class="page-header d-flex justify-content-between align-items-start  mt-4 pt-3 pb-2 px-3 shadow-sm bg-warning rounded ">
				<h2 class=" fw-bold text-dark ">Manage Slots</h2>
			</div>
			<%
			ParkingSlotDao slotDao = new ParkingSlotDao(FactoryProvider.getFactory());
			List<Slot> slots = slotDao.getAllSlots();
			%>

			<!-- Slots Table -->
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>Slot Name</th>
							<th>Status</th>
							<th>Vehicle Number Plate</th>
							<th>Vehicle Type</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<%
						if (slots != null && !slots.isEmpty()) {
							for (Slot slot : slots) {
						%>
						<tr>
							<td><%=slot.getSlotName()%></td>
							<td><%=slot.getStatus()%></td>
							<td><%=(slot.getAssignedVehicle() != null && slot.getAssignedVehicle().getVehicleNumberPlate() != null)
		? slot.getAssignedVehicle().getVehicleNumberPlate()
		: "Slot is Not Assigned Yet"%></td>
							<td><%=(slot.getAssignedVehicle() != null && slot.getAssignedVehicle().getVehicleType() != null)
		? slot.getAssignedVehicle().getVehicleType()
		: "Slot is Not Assigned Yet"%></td>
							<td>
								<div class="d-flex gap-2">
									<button class="btn btn-action btn-delete"
										onclick="confirmDelete('<%=slot.getSlotId()%>')">
										<i class="fas fa-trash"></i>
									</button>
									<script>
										function confirmDelete(slotId) {
											if (confirm("Are you sure you want to delete this slot?")) {
												// Redirect to servlet with slotId as query parameter
												window.location.href = "../DeleteSlotByIdServlet?slotId="
														+ slotId;
											}
										}
									</script>
								</div>
							</td>
						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td colspan="6" class="text-center alert text-danger">
								<h1>No Slots Found</h1>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>

		</div>
	</div>
	<%
	System.out.println("Manage SLot FIrst");
	String deleteSlotStatus = (String) session.getAttribute("slotStatus");
	System.out.println("Received Session");
	if (deleteSlotStatus != null && deleteSlotStatus.equals("Deleted Successfully")) {
		System.out.println("Success");
	%>
	<!-- Bootstrap Modal -->
	<div class="modal fade" id="deleteSlotModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content bg-dark">
				<div class="modal-header">
					<h5 class="modal-title text-success">Slot Is Deleted
						Successfully</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
	<%
	System.out.println("Showed Model");
	} else if (deleteSlotStatus != null && deleteSlotStatus.equals("Deletion Failed")) {
	%><!-- Bootstrap Modal -->
	<div class="modal fade" id="deleteSlotModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content bg-dark">
				<div class="modal-header">
					<h5 class="modal-title text-danger">Error in Deleting the Slot</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	session.removeAttribute("slotStatus");
	%>

	<script>
		var deleteSlotModal = new bootstrap.Modal(document
				.getElementById('deleteSlotModal'));
		deleteSlotModal.show();
	</script>


</body>
</html>