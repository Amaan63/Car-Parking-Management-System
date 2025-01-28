<style>
.feature-card {
	transition: transform 0.3s;
}

.feature-card:hover {
	transform: translateY(-5px);
}

.icon-circle {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 1rem;
}
</style>
<!-- Main Content -->
<div class="container py-5">
	<!-- Quick Actions -->
	<div class="row g-4">
		<!-- Book a Slot -->
		<div class="col-md-6 col-lg-3">
			<div class="card h-100 feature-card bg-dark text-white">
				<div class="card-body text-center">
					<div class="icon-circle bg-primary text-white">
						<i class="fas fa-bookmark fa-2x"></i>
					</div>
					<h5 class="card-title">Book a Slot</h5>
					<p class="card-text">Reserve your parking spot in advance</p>
					<a href="BookingForm.jsp" class="btn btn-primary">Book Now</a>
				</div>
			</div>
		</div>

		<!-- Active Booking -->
		<div class="col-md-6 col-lg-3">
			<div class="card h-100 feature-card bg-dark text-white">
				<div class="card-body text-center">
					<div class="icon-circle bg-success text-white">
						<i class="fas fa-clock fa-2x"></i>
					</div>
					<h5 class="card-title">Active Booking</h5>
					<p class="card-text">View or manage current booking</p>
					<a href="../UserPages/ParkingHistory.jsp" class="btn btn-success">View Details</a>
				</div>
			</div>
		</div>

		<!-- My Vehicles -->
		<div class="col-md-6 col-lg-3">
			<div class="card h-100 feature-card bg-dark text-white">
				<div class="card-body text-center">
					<div class="icon-circle bg-info text-white">
						<i class="fas fa-car fa-2x"></i>
					</div>
					<h5 class="card-title">My Vehicles</h5>
					<p class="card-text">Manage your registered vehicles</p>
					<a href="#" class="btn btn-info text-white">Manage</a>
				</div>
			</div>
		</div>

		<!-- Payment History -->
		<div class="col-md-6 col-lg-3">
			<div class="card h-100 feature-card bg-dark text-white">
				<div class="card-body text-center">
					<div class="icon-circle bg-warning text-white">
						<i class="fas fa-receipt fa-2x"></i>
					</div>
					<h5 class="card-title">Payment History</h5>
					<p class="card-text">View your payment history</p>
					<a href="#" class="btn btn-warning text-white">View History</a>
				</div>
			</div>
		</div>
	</div>
</div>
