<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>User Registration and Login</title>
<%@include file="css/bootstrapCDN.jsp"%>
<link rel="stylesheet" href="css/User-Register&Login-Css.css">
<link rel="stylesheet" href="css/global.css">
<link rel="icon" type="image/x-icon" href="images/Logo/Logo2.png">

</head>
<body class="min-vh-100">


	<!-- Toggle Buttons -->
	<div class="toggle mt-3">
		<button id="loginToggle" class="btn active">Login</button>
		<button id="registerToggle" class="btn">Register</button>

	</div>

	<!-- Form Container -->
	<div class="container custom-container m-3 ">
		<div class="form-container w-70" id="formContainer">
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
					<!-- Forgot Password Link -->
					<div class="text-right mt-4">
						<a href="#" data-bs-toggle="modal"
							data-bs-target="#forgotPasswordModal" class="customHover">
							Forgot Password? </a>

					</div>


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

					<!-- Security Question Dropdown -->
					<div class="mb-3">
						<label for="securityQuestion" class="form-label">Security
							Question</label> <select class="form-select" id="securityQuestion"
							name="securityQuestion" required>
							<option value="" disabled selected>Select a security
								question</option>
							<option value="What is your favorite food?">What is your
								favorite food?</option>
							<option value="What is the name of your
								first friend?">What
								is the name of your first friend?</option>
							<option value="What is the name of your first
								pet?">What
								is the name of your first pet?</option>
							<option value="What is your mother's
								name?">What
								is your mother's name?</option>
							<option value="What is your favorite
								color?">What
								is your favorite color?</option>
						</select>
					</div>

					<!-- Answer to Security Question -->
					<div class="mb-3">
						<label for="securityAnswer" class="form-label">Answer</label> <input
							type="text" class="form-control" id="securityAnswer"
							name="securityAnswer"
							placeholder="Enter Answer to Security Question" required />
					</div>


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
	} else if ("Failed".equals(registrationStatus)) {
	%>
	<h1>Registration failed</h1>
	<%
	} else if ("Email already exists".equals(registrationStatus)) {
	%><div class="modal fade" id="registerModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content bg-dark">
				<div class="modal-header">
					<h5 class="modal-title text-danger">Email already registered!</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>

	<%
	} else if ("Phone number already exists".equals(registrationStatus)) {
	%>
	<div class="modal fade" id="registerModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content bg-dark">
				<div class="modal-header">
					<h5 class="modal-title text-danger">Phone Number Already
						Exist!</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
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
		if ("Email is incorrect.".equals(loginStatus)) {
	%>
	<div class="modal fade" id="loginUserModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content bg-dark">
				<div class="modal-header">
					<h5 class="modal-title text-danger">Email is Incorrect</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
	<%
	} else if ("Password is incorrect.".equals(loginStatus)) {
	%>
	<div class="modal fade" id="loginUserModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content bg-dark">
				<div class="modal-header">
					<h5 class="modal-title text-danger">Password is Incorrect</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
	<%
	} else {
	%>
	<div class="modal fade" id="loginUserModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content bg-dark">
				<div class="modal-header">
					<h5 class="modal-title text-danger">Unexpected Error</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
	<%
	}

	// Remove the attribute to prevent the message from appearing again
	session.removeAttribute("loginStatus");
	}
	%>
	<script src="javascript/Registration_Validation.js"></script>
	<script src="javascript/Login_Register_toggle.js"></script>
	<%@include file="components/ForgetPasswordModal.jsp"%>
	<script>
		var registerUserModal = new bootstrap.Modal(document
				.getElementById('registerModal'));
		registerUserModal.show();
	</script>

	<script>
		var loginUserModal = new bootstrap.Modal(document
				.getElementById('loginUserModal'));
		loginUserModal.show();
	</script>


	<%
	String ShowResetModal = (String) session.getAttribute("ShowResetModal");

	if ("visible".equalsIgnoreCase(ShowResetModal)) {
	%>
	<%@ include file="components/ResetPasswordModal.jsp"%>

	<script>
		window.onload = function() {
			var resetModal = new bootstrap.Modal(document
					.getElementById('resetPasswordModal'));
			resetModal.show();
		}
	</script>
	<%
	// Clear the session attribute after showing it once
	session.removeAttribute("ShowResetModal");
	}
	%>



	<%
	String passwordErrorModal = (String) session.getAttribute("PasswordStatus");
	if (passwordErrorModal != null && passwordErrorModal.equals("Reset The Password Successfully")) {
	%>
	<div class="modal fade" id="passwordErrorModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content bg-dark">
				<div class="modal-header">
					<h5 class="modal-title text-success">Password has been Reseted
						Succesfully</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
	<%
	} else if (passwordErrorModal != null && passwordErrorModal.equals("Both the password does not match")) {
	%><div
		class="modal fade" id="passwordErrorModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content bg-dark">
				<div class="modal-header">
					<h5 class="modal-title text-danger">Password Does Not Match With each other</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	session.removeAttribute("PasswordStatus");
	%>
	<script>
		var passwordErrorModal = new bootstrap.Modal(document
				.getElementById('passwordErrorModal'));
		passwordErrorModal.show();
	</script>




</body>
</html>