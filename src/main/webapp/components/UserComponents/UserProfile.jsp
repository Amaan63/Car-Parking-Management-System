<%@page import="com.entities.User"%>
<%
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


		<%
		String updateStatus = (String) session.getAttribute("updateStatus");
		if (updateStatus != null && updateStatus.equals("Updated Successfully")) {
		%>

		<!-- Updation Details Alert -->
		<div class="container d-flex justify-content-center">
			<div id="alertBox"
				class="alert alert-success alert-dismissible fade show mt-3 mb-0 col-md-10 text-center"
				role="alert">
				<i class="fas fa-info-circle me-1"></i> Details are updated 
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</div>

		<script>
    // Auto-hide alert after 3 seconds
    setTimeout(function () {
        let alertBox = document.getElementById("alertBox");
        if (alertBox) {
            let bsAlert = new bootstrap.Alert(alertBox);
            bsAlert.close();
        }
    }, 5000); // Alert disappears after 3 seconds
</script>
		<%
		session.removeAttribute("updateStatus");
		} else if (updateStatus != null && !updateStatus.equals("Updation Failed")) {
		%>

		<!-- Updation Details Alert -->
		<div class="container d-flex justify-content-center">
			<div id="alertBox"
				class="alert alert-danger alert-dismissible fade show mt-3 mb-0 col-md-10 text-center"
				role="alert">
				<i class="fas fa-info-circle me-1"></i> Details are updated now
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</div>

		<script>
    // Auto-hide alert after 3 seconds
    setTimeout(function () {
        let alertBox = document.getElementById("alertBox");
        if (alertBox) {
            let bsAlert = new bootstrap.Alert(alertBox);
            bsAlert.close();
        }
    }, 5000); // Alert disappears after 3 seconds
</script>
		<%
		session.removeAttribute("updateStatus");
		}
		%>

		<div class="profile-card">
			<%
			if (userDetailsForProfile != null) {
				int userId = userDetailsForProfile.getUserId();
				String userName = userDetailsForProfile.getUserFullName();
				String userEmail = userDetailsForProfile.getUserEmail();
				String userPassword = userDetailsForProfile.getUserPassword();
				String phoneNumber = userDetailsForProfile.getUserPhoneNumber();
				String userAddress = userDetailsForProfile.getUserAddress();
			%>
			<h2>
				Welcome,
				<%=userName%>
			</h2>
			<p>Manage your car parking details here</p>

			<form action="../UpdateUserByIdServlet" method="post">
				<div class="profile-info">
					<input type="hidden" class="form-control" id="userId" name="userId"
						value="<%=userId%>" readonly />
				</div>
				<div class="profile-info">
					<label for="name" class="form-label">Full Name</label> <input
						type="text" class="form-control" id="name" name="userName"
						value="<%=userName%>" readonly />
				</div>

				<div class="profile-info">
					<label for="email" class="form-label">Email Address</label> <input
						type="email" class="form-control " id="email" name="userEmail"
						value="<%=userEmail%>" readonly />
				</div>

				<div class="profile-info">
					<label for="email" class="form-label">Password</label> <input
						type="password" class="form-control " id="password"
						name="userPassword" value="<%=userPassword%>" readonly />
				</div>

				<div class="profile-info">
					<label for="phone" class="form-label">Phone Number</label> <input
						type="tel" class="form-control" id="phone" name="userPhoneNumber"
						value="<%=phoneNumber%>" readonly />
				</div>

				<div class="profile-info">
					<label for="userAddress" class="form-label">Address</label>
					<textarea class="form-control" id="userAddress" rows="3"
						name="userAddress" readonly><%=userAddress%></textarea>
				</div>
				<%
				}
				%>

				<div class="actions-btns mt-4">
					<button type="button" class="btn btn-success" id="editBtn">Edit
						Information</button>
					<button type="submit" class="btn btn-primary d-none" id="updateBtn">Update
						Details</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const editBtn = document.getElementById("editBtn");
    const updateBtn = document.getElementById("updateBtn");
    const inputs = document.querySelectorAll("#name, #email, #phone, #userAddress");

    editBtn.addEventListener("click", function () {
        inputs.forEach(input => input.removeAttribute("readonly")); // Enable editing
        editBtn.classList.add("d-none"); // Hide edit button
        updateBtn.classList.remove("d-none"); // Show update button
    });

    updateBtn.addEventListener("click", function () {
        inputs.forEach(input => input.setAttribute("readonly", true)); // Disable editing
        updateBtn.classList.add("d-none"); // Hide update button
        editBtn.classList.remove("d-none"); // Show edit button
        alert("Details Updated! (You can replace this with an actual update logic)");
    });
});
</script>
