<%@page import="com.entities.Vehicle"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Vehicles</title>
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
				class="page-header d-flex justify-content-between align-items-start mt-4 pt-3 pb-2 px-3 shadow-sm bg-info rounded ">
				<h2 class="fw-bold text-dark">Manage Vehicles</h2>
			</div>

			<%
			AdminDao adminDao = new AdminDao(FactoryProvider.getFactory());
			List<Vehicle> vehicles = adminDao.getAllVehicles();
			%>
			<!-- Vehicles Table -->
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>Company</th>
							<th>Name</th>
							<th>Number Plate</th>
							<th>Type</th>
							<th>Booking Date</th>
							<th>Duration</th>
							<th>Parking Token</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<%
						if (vehicles != null && !vehicles.isEmpty()) {
							for (Vehicle vehicle : vehicles) {
						%>
						<tr>
							<td><%=vehicle.getVehicleCompany() != null ? vehicle.getVehicleCompany() : "N/A"%></td>
							<td><%=vehicle.getVehicleName() != null ? vehicle.getVehicleName() : "N/A"%></td>
							<td><%=vehicle.getVehicleNumberPlate() != null ? vehicle.getVehicleNumberPlate() : "N/A"%></td>
							<td><%=vehicle.getVehicleType() != null ? vehicle.getVehicleType() : "N/A"%></td>
							<td><%=vehicle.getBookingDate() != null ? vehicle.getBookingDate() : "N/A"%></td>
							<td><%=vehicle.getTimeDuration() != null ? vehicle.getTimeDuration() : "N/A"%></td>
							<td><%=vehicle.getParkingTokennumber() != null ? vehicle.getParkingTokennumber() : "N/A"%></td>
							<td>
								<div class="d-flex gap-2">
									<button class="btn btn-action btn-delete"
										onclick="confirmDelete('<%=vehicle.getVehicleId()%>')">
										<i class="fas fa-trash"></i>
									</button>
									<script>
										function confirmDelete(vehicleId) {
											if (confirm("Are you sure you want to delete this Vehicle?")) {
												window.location.href = "../DeleteVehicleByIdServlet?type=vehicle&id="
														+ vehicleId;
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
							<td colspan="8" class="text-center alert text-danger"><h1>No
									Vehicles Found</h1></td>
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
	String deleteVehicleStatus = (String) session.getAttribute("deleteVehicleStatus");
	if (deleteVehicleStatus != null && deleteVehicleStatus.equals("Successfully Deleted")) {
	%>
	<!-- Bootstrap Modal -->
	<div class="modal fade" id="deleteUserModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content bg-dark">
				<div class="modal-header">
					<h5 class="modal-title text-success">Vehicle Is Deleted
						Successfully</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	if (deleteVehicleStatus != null && deleteVehicleStatus.equals("Error in Deleting the User")) {
	%><!-- Bootstrap Modal -->
	<div class="modal fade" id="deleteUserModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content bg-dark">
				<div class="modal-header">
					<h5 class="modal-title text-danger">Error in Deleting the Vehicle</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	session.removeAttribute("deleteVehicleStatus");
	%>

	<script>
		var deleteUserModal = new bootstrap.Modal(document
				.getElementById('deleteUserModal'));
		deleteUserModal.show();
	</script>
</body>
</html>
