<div class="card mt-4 mb-4 bg-dark" id="user-guide">
	<div class="card-header custom-header">
		<h3 class="text-center text-white">
			<i class="fas fa-book-reader"></i> User Guide
		</h3>
	</div>
	<div class="card-body text-white">
		<div class="overflow-auto">
			<ul class="nav nav-tabs mb-3 d-flex flex-nowrap" id="userTabs"
				role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active highlight" id="booking-tab"
						data-bs-toggle="tab" data-bs-target="#booking" type="button"
						role="tab" aria-controls="booking" aria-selected="true">
						Booking</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link highlight" id="account-tab"
						data-bs-toggle="tab" data-bs-target="#account" type="button"
						role="tab" aria-controls="account" aria-selected="false">
						Account</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link highlight" id="payments-tab"
						data-bs-toggle="tab" data-bs-target="#payments" type="button"
						role="tab" aria-controls="payments" aria-selected="false">
						Payments</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link highlight" id="features-tab"
						data-bs-toggle="tab" data-bs-target="#features" type="button"
						role="tab" aria-controls="features" aria-selected="false">
						Features</button>
				</li>
			</ul>
		</div>

		<div class="tab-content" id="userTabsContent">
			<!-- Booking Tab -->
			<div class="tab-pane fade show active" id="booking" role="tabpanel"
				aria-labelledby="booking-tab">
				<h5 class="mb-3">How to Book a Parking Slot</h5>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-sign-in-alt fa-lg text-success"></i>
					</div>
					<div>
						<strong>Log in</strong> - Enter your registered email and
						password.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-map-marker-alt fa-lg text-primary"></i>
					</div>
					<div>
						<strong>Select a slot</strong> - View available slots on the
						dashboard and choose your preferred one.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-calendar-check fa-lg text-light"></i>
					</div>
					<div>
						<strong>Choose time duration</strong> - Set the booking start and
						end time.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-car fa-lg text-info"></i>
					</div>
					<div>
						<strong>Enter vehicle details</strong> - Provide your vehicle
						number, type, and model.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-check-circle fa-lg text-success"></i>
					</div>
					<div>
						<strong>Confirm booking</strong> - Submit the details and get
						confirmation.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-qrcode fa-lg text-warning"></i>
					</div>
					<div>
						<strong>QR Code</strong> - Your booking confirmation includes a QR
						code for entry and exit.
					</div>
				</div>

				<h5 class="mt-4">Availability Status</h5>
				<ul>
					<li><span class="text-success">Green</span>: Available Slots</li>
					<li><span class="text-warning">Yellow</span>: Reserved Slots</li>
					<li><span class="text-danger">Red</span>: Occupied Slots</li>
				</ul>

			</div>

			<!-- Account Tab -->
			<div class="tab-pane fade" id="account" role="tabpanel"
				aria-labelledby="account-tab">
				<h5>Manage Account</h5>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-user-edit fa-lg text-success"></i>
					</div>
					<div>
						<strong>Profile Settings</strong> - Edit your name, email, contact
						info, etc.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-key fa-lg text-light"></i>
					</div>
					<div>
						<strong>Change Password</strong> - Easily update your login
						password.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-car-side fa-lg text-danger"></i>
					</div>
					<div>
						<strong>Vehicle List</strong> - Save vehicle info for faster
						booking.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-history fa-lg text-warning"></i>
					</div>
					<div>
						<strong>Booking History</strong> - View all your past bookings and
						activity.
					</div>
				</div>
			</div>

			<!-- Payments Tab -->
			<div class="tab-pane fade" id="payments" role="tabpanel"
				aria-labelledby="payments-tab">
				<h5>Payment Options</h5>
				<ul>
					<li><strong>UPI / Net Banking</strong> (based on your
						integration)</li>
					<li><strong>Credit/Debit Cards</strong> (if enabled)</li>
				</ul>

				<h5 class="mt-4">Invoices</h5>
				<p>Every successful booking generates an invoice available in
					your dashboard.</p>
			</div>

			<!-- Features Tab -->
			<div class="tab-pane fade" id="features" role="tabpanel"
				aria-labelledby="features-tab">
				<h5>Features</h5>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-bell fa-lg text-warning"></i>
					</div>
					<div>
						<strong>Alerts</strong> - Get notified before your slot time ends.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-clock fa-lg text-success"></i>
					</div>
					<div>
						<strong>Extend Time</strong> - If needed, extend your parking time
						before it ends.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-map fa-lg text-info"></i>
					</div>
					<div>
						<strong>Live Map View</strong> - Dashboard shows slot availability
						in real-time.
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
