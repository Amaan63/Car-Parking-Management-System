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
<style type="text/css">

/* Main Content Styling */
.main-content {
	flex: 1;
	padding: 32px;
	background: #1a1a1a;
	color: white;
	overflow-y: auto;
}

/* Page Header */
.page-header {
	margin-bottom: 32px;
	padding-bottom: 16px;
	border-bottom: 1px solid #404040;
	text-align: center;
}

/* Table Styling */
.table {
	color: #ffffff;
	background: #2d2d2d;
	border-radius: 12px;
	overflow: hidden;
}

.table thead th {
	background-color: #1db954;
	color: white;
	border: none;
	padding: 16px;
}

.table tbody td {
	border-color: #404040;
	padding: 16px;
}

/* Action Buttons */
.btn-action {
	padding: 8px 16px;
	border-radius: 6px;
	transition: all 0.3s ease;
}

.btn-edit {
	background: #ffc107;
	color: #000;
}

.btn-delete {
	background: #dc3545;
	color: white;
}

.btn-edit:hover {
	background: #e0a800;
	transform: scale(1.05);
}

.btn-delete:hover {
	background: #c82333;
	transform: scale(1.05);
}
</style>
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
							<th>ID</th>
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
							<td><%=user.getUserId()%></td>
							<td><%=user.getUserFullName()%></td>
							<td><%=user.getUserEmail()%></td>
							<td>+91 <%=user.getUserPhoneNumber()%></td>
							<td class="text-truncate text-wrap"><%=user.getUserAddress()%></td>
							<td>
								<div class="d-flex gap-2">
									<button class="btn btn-action btn-edit">
										<i class="fas fa-edit"></i>
									</button>
									<button class="btn btn-action btn-delete">
										<i class="fas fa-trash"></i>
									</button>
								</div>
							</td>
						</tr>


						<%
						}
						} else {
						%>
						<div class="alert alert-warning">No User Found</div>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>