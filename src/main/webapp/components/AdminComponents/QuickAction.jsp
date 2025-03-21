<style>
.custom-img {
	width: 70px;
	height: 70px;
}

.feature-card {
	transition: transform 0.5s;
}

.feature-card:hover {
	transform: translateY(-10px);
}
</style>

<div class="card bg-dark text-light border border-secondary mb-3">
	<div class="card-header border-secondary">
		<h5 class="card-title mb-0 text-center">
			<b>Quick Actions</b>
		</h5>
	</div>
	<div class="card-body">
		<div class="row g-3">
			<!-- Row 1 -->
			<div class="col-md-4 feature-card">
				<div class="d-grid ">
					<button class="btn btn-light p-4" data-bs-toggle="modal"
						data-bs-target="#SlotCreatingModal">
						<!--  <i class="fas fa-car-side fa-2x mb-2"></i> -->
						<img alt="Slot Icon"
							src="../images/QuickActions/ParkingSlot.png"
							class="mb-2 custom-img"><br /> <b> Slot Creating </b>
					</button>
				</div>
			</div>
			<div class="col-md-4 feature-card">
				<div class="d-grid">
					<button class="btn btn-danger p-4"
						onclick="window.location.href='../AdminPages/ManageUsers.jsp'">
						<!--   <i class="fas fa-clock fa-2x mb-2"></i> -->
						<img alt="Manage Users"
							src="../images/QuickActions/ManageUser.png"
							class="mb-2 custom-img"> <br /> <b> Manage Users </b>
					</button>
				</div>
			</div>
			<div class="col-md-4 feature-card">
				<div class="d-grid">
					<button class="btn btn-warning p-4"
						onclick="window.location.href='../AdminPages/ManageVehicle.jsp'">
						<!-- <i class="fas fa-map-marker-alt fa-2x mb-2"></i> -->
						<img alt="Manage Vehicles"
							src="../images/QuickActions/ManageVehicle.png"
							class="mb-2 custom-img"> <br /> <b> Manage Vehicles </b>
					</button>
				</div>
			</div>

			<!-- Row 2 -->
			<div class="col-md-4 feature-card" data-bs-toggle="modal"
				data-bs-target="#parkingRateFormModal">
				<div class="d-grid">
					<button class="btn btn-success p-4">
						<!--   <i class="fas fa-car-crash fa-2x mb-2"></i> -->
						<img alt="Manage Parking Rates"
							src="../images/QuickActions/ManagePrice.png"
							class="mb-2 custom-img"> <br /> <b> Manage Parking
							Rates </b>
					</button>
				</div>
			</div>
			<div class="col-md-4 feature-card">
				<div class="d-grid">
					<button class="btn btn-primary p-4"
						onclick="window.location.href='../AdminPages/ManageSlots.jsp'">
						<img alt="Manage Parking Rates"
							src="../images/QuickActions/ManageSlot.png"
							class="mb-2 custom-img"> <br /> <b> Manage Slot </b>
					</button>
				</div>
			</div>
			<div class="col-md-4 feature-card">
				<div class="d-grid">
					<button class="btn btn-info p-4">
						<!--   <i class="fas fa-receipt fa-2x mb-2"></i><br /> -->
						<img alt="View FeedBack and Complaints"
							src="../images/QuickActions/Feedback&Review.png"
							class="mb-2 custom-img"> <br /> <b> View Feedback and
							Complaint </b>
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Add the Modal Here After Creating It  -->
<%@include file="SlotBookingFormModal.jsp"%>
<%@include file="ParkingRateFormModal.jsp"%>


