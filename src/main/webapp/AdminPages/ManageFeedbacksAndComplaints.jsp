<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Manage Feedbacks</title>
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
			<div
				class="page-header d-flex justify-content-between align-items-start mt-4 pt-3 pb-2 px-3 shadow-sm bg-warning rounded">
				<h2 class="fw-bold text-dark">Feedback and Complaints</h2>
			</div>

			<!-- Feedback Cards Container -->

			<%@include
				file="../components/AdminComponents/FeedbackDetailCard.jsp"%>
		</div>
	</div>
</body>

</html>