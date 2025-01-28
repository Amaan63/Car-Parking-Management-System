<%@page import="com.entities.User"%>
<%
// Retrieve the user object from the session
User userDetailsForProfile = (User) session.getAttribute("userForProfile");
%>

<link rel="stylesheet" href="../css/userProfileDesign.css" />

<!-- Offcanvas for User Profile -->
<div class="offcanvas offcanvas-end bg-dark" tabindex="-1"
	id="userProfileOffcanvas" aria-labelledby="userProfileLabel"
	data-bs-backdrop="true">
	<div class="offcanvas-header">
		<h5 class="offcanvas-title text-center" id="userProfileLabel">
			<i class="fa-solid fa-user-pen"></i> Your Profile Overview
		</h5>
		<button type="button" aria-label="Close" data-bs-dismiss="offcanvas"
			class="custom-icon ">
			<i class="fa-solid fa-xmark "></i>
		</button>
	</div>
	<div class="offcanvas-body">
		<div class="profile-card">
			<%
			// Check if the user is logged in
			if (userDetailsForProfile != null) {
				// Display the user's name (assuming 'getName()' is a method that retrieves the user's name)
				String userName = userDetailsForProfile.getUserFullName();
				String userEmail = userDetailsForProfile.getUserEmail();
				String phoneNumber = userDetailsForProfile.getUserPhoneNumber();
				String userAddress = userDetailsForProfile.getUserAddress();
			%>
			<h2>
				Welcome,
				<%=userName%></h2>
			<p>Manage your car parking details here</p>

			<div class="profile-info">
				<label for="name" class="form-label">Full Name</label> <input
					type="text" class="form-control" id="name" value="<%=userName%>"
					readonly />
			</div>

			<div class="profile-info">
				<label for="email" class="form-label">Email Address</label> <input
					type="email" class="form-control custom-form-control" id="email"
					value="<%=userEmail%>" readonly />
			</div>

			<div class="profile-info">
				<label for="phone" class="form-label">Phone Number</label> <input
					type="tel" class="form-control" id="phone" value="<%=phoneNumber%>"
					readonly />
			</div>

			<div class="profile-info">
				<label for="userAddress" class="form-label">Address</label>
				<textarea class="form-control" id="userAddress" rows="3" readonly><%=userAddress%></textarea>
			</div>
			<%
			}
			%>
			<div class="actions-btns mt-4">
				<button type="button" class="btn btn-success">Edit
					Information</button>
			</div>
		</div>
	</div>
</div>

