<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration and Login</title>
<%@include file="css/bootstrapCDN.jsp"%>
<link rel="stylesheet" href="css/User-Register&Login-Css.css">
<link rel="stylesheet" href="css/global.css">
<link rel="icon" type="image/x-icon" href="images/Logo/Logo2.png">
</head>
<body>

	<!-- Toggle Buttons -->
	<div class="toggle">
		<button id="loginToggle" class="btn active">Login</button>
		<button id="registerToggle" class="btn">Register</button>
	</div>

	<!-- Form Container -->
	<div class="container">
		<div class="form-container" id="formContainer">
			<!-- Login Form -->
			<div class="form-wrapper">
				<img src="images/Login&Registration/UserLogin.svg" alt="Login Image" />
				<form class="form" action="UserLoginServlet" method="post">
					<h2>User Login</h2>
					<div class="mb-3">
						<label for="loginEmail" class="form-label">Email</label> <input
							type="email" class="form-control" id="loginEmail"
							placeholder="Enter your email" name="userEmail" required />
					</div>
					<div class="mb-3">
						<label for="loginPassword" class="form-label">Password</label> <input
							type="password" class="form-control" id="loginPassword"
							placeholder="Enter your password" name="userPassword" required />
					</div>
					<button type="submit" class="btn mt-3">Login</button>
				</form>
			</div>
			<!-- Registration Form -->
			<div class="form-wrapper">
				<img src="images/Login&Registration/UserRegistration.svg"
					alt="Register Image" />
				<form class="form" onsubmit="return validateForm();" novalidate
					action="UserRegistrationServlet" method="post">
					<h2>Register</h2>
					<div class="mb-3">
						<label class="form-label">Full Name</label> <input type="text"
							class="form-control" id="userFullName"
							placeholder="Enter your full name" name="userName" required />
					</div>
					<div class="mb-3">
						<label for="registerEmail" class="form-label">Email</label> <input
							type="email" class="form-control" id="userEmail" name="userEmail"
							placeholder="Enter your email" required />
					</div>
					<div class="mb-3">
						<label for="registerPassword" class="form-label">Password</label>
						<input type="password" class="form-control" id="userPassword"
							name="userPassword" placeholder="Enter your password" required />
					</div>
					<div class="mb-3">
						<label for="registerPhone" class="form-label">Phone Number</label>
						<input type="tel" class="form-control" id="userPhoneNumber"
							name="userPhoneNumber" placeholder="Enter your phone number"
							style="flex: 1" required />

					</div>

					<div class="mb-3">
						<label for="registerAddress" class="form-label">Address</label>
						<textarea class="form-control" id="userAddress" name="userAddress"
							rows="3" placeholder="Enter your address" required></textarea>
					</div>
					<script src="javascript/UserRegistrationValidation.js"></script>
					<button type="submit" class="btn mt-3">Register</button>
				</form>
			</div>
		</div>
	</div>

	<%
	// Retrieve the session attribute
	String registrationStatus = (String) session.getAttribute("UserRegistration");

	// Check if the attribute is null
	if (registrationStatus != null) {
		if ("Successfull".equals(registrationStatus)) {
			// Include the popup for successful registration
	%>
	<%@ include file="components/popups/UserRegistrationPopup.jsp"%>
	<%
	} else {
	%>
	<h1>Registration failed</h1>
	<%
	}
	// Remove the attribute to prevent the message from appearing again
	session.removeAttribute("UserRegistration");
	}
	%>

	<%
	// Retrieve the session attribute
	String loginStatus = (String) session.getAttribute("loginStatus");

	// Check if the attribute is not null
	if (loginStatus != null) {
		if ("Username is incorrect.".equals(loginStatus)) {
	%>
	<script type="text/javascript">
            alert("<%=loginStatus%>");
        </script>
	<%
	} else if ("Password is incorrect.".equals(loginStatus)) {
	%>
	<script type="text/javascript">
            alert("<%=loginStatus%>");
        </script>
	<%
	} else {
	%>
	<script type="text/javascript">
            alert("Unexpected status: <%=loginStatus%>
		");
	</script>
	<%
	}

	// Remove the attribute to prevent the message from appearing again
	session.removeAttribute("loginStatus");
	}
	%>
	<script src="javascript/UserRegistration&Login.js"></script>
</body>
</html>