<!-- Sidebar -->
<div class="col-md-3 col-lg-2 px-0 bg-dark sidebar">
	<div class="p-3">
		<a class="d-flex align-items-center text-light text-decoration-none">
			<i class="fas fa-parking fs-4 text-success me-2"></i> <span
			class="fs-4">ParkEase</span>
		</a>
	</div>
	<hr class="text-secondary" />
	<ul class="nav flex-column mb-2 px-2">
		<li class="nav-item"><a class="nav-link"
			href="../AdminPages/AdminDashBoard.jsp"> <i
				class="fas fa-dashboard me-2"></i> Dashboard
		</a></li>
		<li class="nav-item"><a class="nav-link"
			href="../AdminPages/ManageUsers.jsp"> <i
				class="fas fa-users me-2"></i> Users
		</a></li>
		<li class="nav-item"><a class="nav-link"
			href="../AdminPages/ManageSlots.jsp"> <i class="fas fa-car me-2"></i>
				Parking Slots
		</a></li>
		<li class="nav-item"><a class="nav-link"
			href="../AdminPages/ManageVehicle.jsp"> <i
				class="fas fa-ticket me-2"></i> Vehicle Bookings
		</a></li>
		<li class="nav-item"><a class="nav-link"> <i
				class="fas fa-chart-bar me-2"></i> Reports
		</a></li>
		<li class="nav-item"><a class="nav-link"> <i
				class="fas fa-cog me-2"></i> Settings
		</a></li>
	</ul>
</div>

<!-- Sidebar Toggle Button in Navbar -->
<button class="btn btn-dark sidebar-toggle" onclick="toggleSidebar()">
	<i class="fas fa-bars"></i>
</button>

<!-- CSS for Sidebar -->
<style>
.sidebar {
	min-height: 100vh;
	transition: transform 0.3s ease-in-out;
}

.sidebar .nav-link {
	padding: 1rem;
	color: #ffffff80;
	border-radius: 8px;
	margin: 4px 0;
}

.sidebar .nav-link:hover, .sidebar .nav-link.active {
	color: white;
	background: rgba(255, 255, 255, 0.1);
}

.sidebar-toggle {
	display: none;
	background: none;
	border: none;
	color: white;
	font-size: 24px;
	cursor: pointer;
}

@media ( max-width : 768px) {
	.sidebar {
		position: fixed;
		left: -250px;
		top: 0;
		width: 250px;
		height: 100%;
		background: #343a40;
		z-index: 1000;
		padding-top: 20px;
	}
	.sidebar.show {
		left: 0;
	}
	.sidebar-toggle {
		display: block;
	}
}
</style>

<!-- JavaScript for Sidebar Toggle -->
<script>
	function toggleSidebar() {
		document.querySelector('.sidebar').classList.toggle('show');
	}
</script>
