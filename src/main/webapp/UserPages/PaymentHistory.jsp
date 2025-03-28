<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Payment History</title>

<%@include file="../css/bootstrapCDN.jsp"%>
<link rel="stylesheet" href="../css/global.css">
<link rel="stylesheet" href="../css/PaymentHistory.css" />
<link rel="icon" type="image/x-icon" href="../images/Logo/Logo2.png">
</head>
<body>
	<%@include file="../components/UserComponents/UserHomeNavBar.jsp"%>
	
	<%@include file="../components/UserComponents/PaymentHistoryCard.jsp"%>
<%
	String paymentStatus = (String) session.getAttribute("paymentStatus"); // Use session
	if (paymentStatus != null) {
		if ("done".equals(paymentStatus)) {
	%>
	<%@include file="../components/popups/PaymentSuccessfulPopup.jsp"%>
	<%
	} else if ("failed".equals(paymentStatus)) {
	%>
	<%@include file="../components/popups/PaymentRejectedPopup.jsp"%>
	<%
	}
	// Remove after displaying
	session.removeAttribute("paymentStatus");
	}
	%>

</body>
</html>
