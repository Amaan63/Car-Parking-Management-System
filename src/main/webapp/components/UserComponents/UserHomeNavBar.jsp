<!-- Your existing navigation HTML -->
<style>
/* Change hover effect for dropdown items */
.dropdown-menu .dropdown-item:hover {
	background-color: black !important; /* Your custom color */
	color: #1db954 !important; /* Ensure text is visible */
}
/* Hover effect for collapsible navigation links */
.navbar-nav .nav-item .nav-link {
	transition: transform 0.2s ease-in-out, background-color 0.2s
		ease-in-out;
	padding: 8px 15px;
	border-radius: 5px;
}

.navbar-nav .nav-item .nav-link:hover, .navbar-nav .nav-item .nav-link.active
	{
	transform: scale(1.1); /* Slightly increase size */
	background-color: black !important; /* Change background */
	color: #1db954 !important; /* Ensure text is visible */
}
</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
	<div class="container-fluid">
		<!-- Brand logo and name -->
		<a class="navbar-brand d-flex align-items-center"
			href="../UserPages/UserDashBoard.jsp"> <i
			class="fas fa-parking fs-4 text-success me-2"></i> <span class="fs-4">ParkEase</span>
		</a>
		<!-- Hamburger menu button for mobile -->
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- Collapsible navigation links -->
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item"><a class="nav-link"
					href="../UserPages/UserDashBoard.jsp">Dashboard</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../UserPages/BookingForm.jsp">Book Parking</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../UserPages/ParkingHistory.jsp">Parking History</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../UserPages/PaymentHistory.jsp">Payment History</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Help &
						Support</a></li>
				<li class="nav-item"><a class="nav-link" href="../UserPages/ContactUs.jsp">Contact Us</a></li>
				<!-- Dropdown for user profile -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="fa-solid fa-user"></i> User
				</a>
					<ul class="dropdown-menu dropdown-menu-end bg-dark"
						aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item text-light"
							href="../components/UserComponents/UserProfile.jsp"
							data-bs-toggle="offcanvas" data-bs-target="#userProfileOffcanvas">
								Profile </a></li>
						<li><hr class="dropdown-divider bg-secondary"></li>
						<li><a class="dropdown-item text-light" href="../UserLogout">
								Logout </a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>
<%@include file="UserProfile.jsp"%>

<!-- Improved JavaScript for more reliable active link detection -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Get all nav links
        const navLinks = document.querySelectorAll('.navbar-nav .nav-link');
        
        // Get current page filename
        const currentPagePath = window.location.pathname;
        const currentPageFile = currentPagePath.split('/').pop();
        
        // Set active class based on current URL
        navLinks.forEach(link => {
            const href = link.getAttribute('href');
            if (href) {
                // Extract filename from href
                const linkFile = href.split('/').pop();
                
                // Check if current page matches link destination
                if (currentPageFile === linkFile || 
                    (currentPagePath.includes(linkFile) && linkFile !== '#')) {
                    link.classList.add('active');
                }
            }
        });
        
        // Add click event listener to each nav link
        navLinks.forEach(link => {
            link.addEventListener('click', function(e) {
                // For links with actual destinations (not #)
                if (this.getAttribute('href') !== '#' && 
                    !this.classList.contains('dropdown-toggle')) {
                    // Remove active class from all links
                    navLinks.forEach(l => l.classList.remove('active'));
                    // Add active class to clicked link
                    this.classList.add('active');
                    
                    // Store the clicked link in localStorage to persist across page loads
                    if (this.getAttribute('href')) {
                        localStorage.setItem('activeNavLink', this.getAttribute('href'));
                    }
                }
            });
        });
        
        // Additional check for localStorage (fallback method)
        const storedActiveLink = localStorage.getItem('activeNavLink');
        if (storedActiveLink) {
            navLinks.forEach(link => {
                if (link.getAttribute('href') === storedActiveLink) {
                    link.classList.add('active');
                }
            });
        }
    });
</script>