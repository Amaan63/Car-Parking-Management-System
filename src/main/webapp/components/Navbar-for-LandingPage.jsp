<style>
@media ( min-width : 768px) {
	/* Apply styles for tablets and larger screens */
	.navbar-brand i {
		font-size: 1.5rem; /* Bigger icon */
	}
	.navbar-brand span {
		font-size: 1.25rem; /* Bigger text */
	}
	.btn-custom {
		font-size: 1rem; /* Increase button text size */
		padding: 6px 12px; /* More padding */
	}
}
</style>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
	<div
		class="container-fluid d-flex justify-content-between align-items-center">
		<!-- Brand Logo and Name -->
		<a class="navbar-brand d-flex align-items-center" href="#"> <i
			class="fas fa-parking fs-4 text-success me-2"></i> <span
			class="fs-4 fw-bold">ParkEase</span>
		</a>

		<!-- Sign In Buttons (Always Visible) -->
		<div class="d-flex gap-2 flex-shrink-0">
			<a class="btn btn-custom text-nowrap"
				href="User-Registration&Login.jsp">User</a> <a
				class="btn btn-custom text-nowrap" href="Admin-Login.jsp">Admin</a>
		</div>
	</div>
</nav>


