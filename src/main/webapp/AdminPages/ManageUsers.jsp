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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Manage Users</title>
<%@include file="../css/bootstrapCDN.jsp"%>
<link rel="stylesheet" href="../css/global.css">
<link rel="icon" type="image/x-icon" href="../images/Logo/Logo2.png">
<link rel="stylesheet" href="../css/Admin-Management.css">

</head>
<body class="min-vh-100">
	<div class="container-fluid">
		<div class="row">
			<%@include file="../components/AdminComponents/Sidebar.jsp"%>
			<%@include file="../components/AdminComponents/AdminNavBar.jsp"%>
			<!-- Main Content -->

			<!-- Page Header -->
			<div
				class="page-header d-flex justify-content-between align-items-center mt-4 pt-3 pb-2 px-3 shadow-sm bg-warning rounded">
				<h2 class="fw-bold text-dark">Manage Users</h2>
			</div>

			<%
			AdminDao adminDao = new AdminDao(FactoryProvider.getFactory());
			List<User> users = adminDao.getAllUsers();
			%>

			<!-- Responsive Users Table -->
			<div class="table-responsive">
				<table class="table ">
					<thead>
						<tr>
							<th>Name</th>
							<th>Email</th>
							<th>Phone</th>
							<th class="d-none d-md-table-cell">Address</th>
							<!-- Hide on small screens -->
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<%
						if (users != null && !users.isEmpty()) {
							for (User user : users) {
						%>
						<tr class="bg-dark">
							<td><%=user.getUserFullName()%></td>
							<td class="text-truncate" style="max-width: 150px;"><%=user.getUserEmail()%></td>
							<td>+91 <%=user.getUserPhoneNumber()%></td>
							<td class="d-none d-md-table-cell text-truncate"
								style="max-width: 200px;"><%=user.getUserAddress()%></td>
							<td>
								<div class="d-flex justify-content-center gap-2">
									<button class="btn btn-danger btn-sm"
										onclick="confirmDelete('<%=user.getUserId()%>')">
										<i class="fas fa-trash"></i>
									</button>
								</div>
							</td>
						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td colspan="5" class="text-center alert text-danger">
								<h5>No User Found</h5>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>

			<script>
				function confirmDelete(userId) {
					if (confirm("Are you sure you want to delete this user?")) {
						window.location.href = "../DeleteUserByIdServlet?type=user&id="
								+ userId;
					}
				}
			</script>


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
							<h5 class="modal-title text-success">User Is Deleted
								Successfully</h5>
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
							<h5 class="modal-title text-danger">Error in Deleting the
								User</h5>
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