<%@page import="com.entities.Payment"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>PaymentList</title>
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
				class="page-header d-flex justify-content-between align-items-start mt-4 pt-3 pb-2 px-3 shadow-sm bg-info rounded">
				<h2 class="fw-bold text-dark">Payment List</h2>
			</div>

			<%
			AdminDao adminDao = new AdminDao(FactoryProvider.getFactory());
			List<Payment> payments = adminDao.getAllPayment();
			%>

			<!-- Payment Table -->
			<div class="table-responsive">
				<table class="table">
					<thead class="table-dark">
						<tr>
							<th>Email</th>
							<th>Amount</th>
							<th>Parking Token</th>
							<th>Order ID</th>
							<th>Payment Time & Date</th>
							<th>Transaction ID</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<%
						if (payments != null && !payments.isEmpty()) {
							for (Payment payment : payments) {
						%>
						<tr>
							<td class="text-truncate" style="max-width: 100px;"><%=payment.getEmail() != null ? payment.getEmail() : "N/A"%></td>
							<td class="text-truncate" style="max-width: 70px;"><%=payment.getAmount() != 0 ? payment.getAmount() : "N/A"%></td>
							<td class="text-truncate" style="max-width: 100px;"><%=payment.getParkingToken() != null ? payment.getParkingToken() : "N/A"%></td>
							<td style="max-width: 200px;"><%=payment.getOrderId() != null ? payment.getOrderId() : "N/A"%></td>
							<td class="text-truncate" style="max-width: 150px;"><%=payment.getPaymentDate() != null ? payment.getPaymentDate() : "N/A"%></td>
							<td style="max-width: 200px;"><%=payment.getRazorpayPaymentId() != null ? payment.getRazorpayPaymentId() : "N/A"%></td>
							<td>
								<%
								String status = payment.getStatus();
								if (status != null) {
									if (status.equalsIgnoreCase("SUCCESSFUL")) {
								%> <span class="badge bg-success"><%=status%></span> <%
 } else if (status.equalsIgnoreCase("FAILED")) {
 %> <span class="badge bg-danger"><%=status%></span> <%
 }
 } else {
 %> <span class="badge bg-secondary">N/A</span> <%
 }
 %>
							</td>
						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td colspan="8" class="text-center alert text-danger">
								<h5>No Payment Found</h5>
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
</body>
</html>