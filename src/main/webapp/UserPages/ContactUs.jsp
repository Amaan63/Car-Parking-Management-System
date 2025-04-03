<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@include file="../css/bootstrapCDN.jsp"%>
<link rel="stylesheet" href="../css/global.css">
<link rel="icon" type="image/x-icon" href="../images/Logo/Logo2.png">
</head>
<body class="min-vh-100">
	<%@include file="../components/UserComponents/UserHomeNavBar.jsp"%>

	<div class="container mt-4 text-center">
		<h2 class="fw-bold highlight">Get in Touch with Us</h2>
		<p class="text-light">Have questions or need assistance? Feel free
			to reach out to us. We’re here to help!</p>
	</div>

	<jsp:include page="../components/FeedbackAndReviewForm.jsp" />

	<%@include file="../components/Footer.jsp"%>
	<%
	String feedbackStatus = (String) session.getAttribute("feedbackStatus");
	if (feedbackStatus != null && feedbackStatus.equals("Feedback submitted successfully!")) {
	%>
	<%@ include file="../components/popups/FeedbackFormSuccessfulPopup.jsp"%>
	<%
	session.removeAttribute("feedbackStatus");
	} else if (feedbackStatus != null && feedbackStatus.equals("Failed to submit feedback. Please try again!")) {
	%>
	<script type="text/javascript">
		alert("Server error! Please try again later.");
	</script>
	<%
	session.removeAttribute("feedbackStatus");
	}
	%>
</body>
</html>