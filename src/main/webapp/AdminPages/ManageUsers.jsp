<%@page import="com.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Users</title>
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
				<h2 class=" fw-bold text-dark ">Manage Users</h2>
			</div>

			<!--  <div
				class="page-header d-flex justify-content-between align-items-center highlight">
				<h2>Manage Users</h2>
			</div> -->

			<%
			AdminDao adminDao = new AdminDao(FactoryProvider.getFactory());
			List<User> users = adminDao.getAllUsers();
			%>
			<!-- Users Table -->
			<div class="table-responsive">
				<table class="table ">
					<thead>
						<tr>

							<th>Name</th>
							<th>Email</th>
							<th>Phone</th>
							<th class="w-25">Address</th>

							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<%
						if (users != null && !users.isEmpty()) {
							for (User user : users) {
						%>

						<tr>

							<td><%=user.getUserFullName()%></td>
							<td><%=user.getUserEmail()%></td>
							<td>+91 <%=user.getUserPhoneNumber()%></td>
							<td class="text-truncate text-wrap"><%=user.getUserAddress()%></td>
							<td>
								<div class="d-flex gap-2">
									<!--   <button class="btn btn-action btn-edit">
										<i class="fas fa-edit"></i>
									</button> -->
									<button class="btn btn-action btn-delete"
										onclick="confirmDelete('<%=user.getUserId()%>')">
										<i class="fas fa-trash"></i>
									</button>
									<script>
										function confirmDelete(userId) {
											if (confirm("Are you sure you want to delete this user?")) {
												window.location.href = "../DeleteUserByIdServlet?type=user&id="
														+ userId;
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
						<div class="alert alert-danger">
							<h1>No User Found</h1>
						</div>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%
	String deleteUserStatus = (String) session.getAttribute("deleteUserStatus");
	if (deleteUserStatus != null && deleteUserStatus.equals("Successfully Deleted")) {
	%>
	<!-- Bootstrap Modal -->
	<div class="modal fade" id="deleteUserModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content bg-dark">
				<div class="modal-header">
					<h5 class="modal-title text-success">User Is Deleted Successfully</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	if (deleteUserStatus != null && deleteUserStatus.equals("Error in Deleting the User")) {
	%><!-- Bootstrap Modal -->
	<div class="modal fade" id="deleteUserModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content bg-dark">
				<div class="modal-header">
					<h5 class="modal-title text-danger">Error in Deleting the User</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	session.removeAttribute("deleteUserStatus");
	%>

	<script>
		var deleteUserModal = new bootstrap.Modal(document
				.getElementById('deleteUserModal'));
		deleteUserModal.show();
	</script>
</body>
</html>