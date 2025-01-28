<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
	<div class="container-fluid">
		<a class="navbar-brand d-flex align-items-center"
			href="../UserPages/UserDashBoard.jsp"> <%-- <img
			src="../images/Logo/Logo1.svg" alt="Logo"
			style="height: 40px; margin-right: 10px;">
			<h3 class="highlight mb-0">Parking Management</h3> --%> <i
			class="fas fa-parking fs-4 text-success me-2"></i> <span class="fs-4">ParkEase</span>
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav">
			<span class="navbar-toggler-icon">aaa</span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item "><a class="nav-link"
					href="../UserPages/UserDashBoard.jsp">Dashboard</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../UserPages/BookingForm.jsp">Book Parking</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../UserPages/ParkingHistory.jsp">Parking History</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Available
						Parking</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Change
						Password</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Help &
						Support</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="fa-solid fa-user"></i> Users
				</a>
					<ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
						<li class="nav-item "><a class="nav-link"
							href="../components/UserComponents/UserProfile.jsp"
							data-bs-toggle="offcanvas" data-bs-target="#userProfileOffcanvas">Profile</a></li>
						<li class="nav-item "><a class="nav-link"
							href="../UserLogout">Logout</a></li>
					</ul></li>
			</ul>

		</div>

	</div>
</nav>
<%@include file="UserProfile.jsp"%>