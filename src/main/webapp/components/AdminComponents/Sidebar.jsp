<style>
.sidebar {
	min-height: 100vh;
	box-shadow: inset -1px 0 0 rgba(0, 0, 0, 0.1);
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

.stats-card {
	transition: transform 0.2s;
}

.stats-card:hover {
	transform: translateY(-5px);
}

.parking-slot {
	width: 60px;
	height: 80px;
	margin: 5px;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	border-radius: 8px;
	cursor: pointer;
}
</style>

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
		<li class="nav-item"><a class="nav-link " href="../AdminPages/AdminDashBoard.jsp"> <i
				class="fas fa-dashboard me-2"></i> Dashboard
		</a></li>
		<li class="nav-item"><a class="nav-link" href="../AdminPages/ManageUsers.jsp">
				<i class="fas fa-users me-2"></i> Users
		</a></li>
		<li class="nav-item"><a class="nav-link"> <i
				class="fas fa-car me-2"></i> Parking Slots
		</a></li>
		<li class="nav-item"><a class="nav-link"> <i
				class="fas fa-ticket me-2"></i> Bookings
		</a></li>
		<li class="nav-item"><a class="nav-link"> <i
				class="fas fa-chart-bar me-2"></i> Reports
		</a></li>
		<li class="nav-item"><a class="nav-link"> <i
				class="fas fa-cog me-2"></i> Settings
		</a></li>
	</ul>
</div>
<script>
document.addEventListener("DOMContentLoaded", function () {
    let navLinks = document.querySelectorAll(".nav-link");

    navLinks.forEach(link => {
        link.addEventListener("click", function () {
            // Remove active class from all links
            navLinks.forEach(nav => nav.classList.remove("active"));

            // Add active class to the clicked link
            this.classList.add("active");

            // Store active link in localStorage to persist after page reload
            localStorage.setItem("activeNav", this.href);
        });
    });

    // Apply active class from localStorage on page load
    let activeNav = localStorage.getItem("activeNav");
    if (activeNav) {
        navLinks.forEach(link => {
            if (link.href === activeNav) {
                link.classList.add("active");
            }
        });
    }
});
</script>