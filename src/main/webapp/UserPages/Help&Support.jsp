<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Help and Support</title>
<%@include file="../css/bootstrapCDN.jsp"%>
<link rel="stylesheet" href="../css/global.css">
<link rel="icon" type="image/x-icon" href="../images/Logo/Logo2.png">

<link rel="stylesheet" href="../css/Help&SupportStyle.css" />
<link rel="stylesheet" href="../css/global.css" />
</head>
<body class="min-vh-100">
	<%@include file="../components/UserComponents/UserHomeNavBar.jsp"%>
	<div class="container">
		<%@include file="../components/UserComponents/Help&SupportHeader.jsp"%>
		<%@include file="../components/UserComponents/Help&SupportQuickLinks.jsp"%>
		<%@include file="../components/UserComponents/UserGuide.jsp"%>
		<%@include file="../components/UserComponents/AdminGuide.jsp"%>
		<%@include file="../components/UserComponents/CommonIssues&Solutions.jsp"%>
	</div>
	<%@include file="../components/Footer.jsp"%>
</body>
</html>