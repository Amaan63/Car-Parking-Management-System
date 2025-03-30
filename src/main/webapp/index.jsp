<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Landing Page</title>
<%@include file="css/bootstrapCDN.jsp"%>
<link rel="stylesheet" href="css/LandingPage-Css.css" />
<link rel="stylesheet" href="css/global.css" />
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="images/Logo/Logo2.png" />
</head>
<body class="d-flex flex-column min-vh-100">
	<%@include file="components/Navbar-for-LandingPage.jsp"%>
	<%@include file="components/HeroSection.jsp"%>
	<%@include file="components/ImageSection.jsp"%>
	<%@include file="components/Stats.jsp"%>
	<%@include file="components/ShortBio.jsp"%>
	<%@include file="components/Features.jsp"%>
	<%@include file="components/Services.jsp"%>
	<%@include file="components/AdditionalContent.jsp"%>
	<jsp:include page="components/FeedbackAndReviewForm.jsp" />
	<%@include file="components/Footer.jsp"%>
	<%
	// Get the logout message from the session
	String userLogout = (String) session.getAttribute("userLogoutMessage");

	// Check if the logout message is set
	if (userLogout != null && userLogout.equals("Logout Successfully")) {
	%>
	<%@ include file="components/popups/UserLogoutPopup.jsp"%>
	<%
	// Remove the logout message from the session to prevent the popup from showing on reload
	session.removeAttribute("userLogoutMessage");
	}
	%>
	<%
	String adminLogout = (String) session.getAttribute("adminLogoutMessage");
	if (adminLogout != null && adminLogout.equals("Admin Logout Successfully")) {
	%>
	<%@ include file="components/popups/AdminLogoutPopup.jsp"%>
	<%
	session.removeAttribute("adminLogoutMessage");
	}
	%>
	<%
	String authenticationError = (String) session.getAttribute("notAuthenticated");
	if (authenticationError != null && authenticationError.equals("Please login to access this page.")) {
	%>
	<%@ include file="components/popups/AuthenticationErrorPopup.jsp"%>
	<%
	session.removeAttribute("notAuthenticated");
	}
	%>
	<%
	String feedbackStatus = (String) session.getAttribute("feedbackStatus");
	if (feedbackStatus != null && feedbackStatus.equals("Feedback submitted successfully!")) {
	%>
	<%@ include file="components/popups/FeedbackFormSuccessfulPopup.jsp"%>
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
