
<div class="card mt-4 mb-4 bg-dark " id="user-guide">
	<div class="card-header custom-header ">
		<h3 class="text-center">
			<i class="fas fa-book-reader"></i> User Guide
		</h3>
	</div>
	<div class="card-body ">
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
						<i class="fas fa-sign-in-alt fa-lg text-primary"></i>
					</div>
					<div>
						<strong>Log in to your account</strong> - Use your email and
						password to access the dashboard.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-map-marker-alt fa-lg text-primary"></i>
					</div>
					<div>
						<strong>Select location and date</strong> - Choose your preferred
						parking location and date/time.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-car fa-lg text-primary"></i>
					</div>
					<div>
						<strong>Enter vehicle details</strong> - Provide your license
						plate, vehicle type, and model.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-check-circle fa-lg text-success"></i>
					</div>
					<div>
						<strong>Confirm and pay</strong> - Review your booking details and
						complete payment.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-ticket-alt fa-lg text-warning"></i>
					</div>
					<div>
						<strong>Receive confirmation</strong> - A QR code will be sent to
						your email for entry/exit.
					</div>
				</div>

				<h5 class="mt-4">Checking Availability</h5>
				<p>The interactive map on the dashboard shows real-time
					availability using color coding:</p>
				<ul>
					<li><span class="text-success">Green</span>: Available slots</li>
					<li><span class="text-warning">Yellow</span>: Limited
						availability (filling up)</li>
					<li><span class="text-danger">Red</span>: Fully booked</li>
				</ul>

				<h5 class="mt-4">Cancellation Policy</h5>
				<p>To cancel a booking:</p>
				<ol>
					<li>Navigate to "My Bookings" in your dashboard</li>
					<li>Select the booking you wish to cancel</li>
					<li>Click the "Cancel Booking" button</li>
					<li>Confirm your cancellation</li>
				</ol>
				<p>
					<strong>Note:</strong> Cancellations made 2+ hours before the
					reservation start time receive a full refund. Cancellations made
					less than 2 hours before receive a 50% refund.
				</p>
			</div>

			<!-- Account Tab -->
			<div class="tab-pane fade" id="account" role="tabpanel"
				aria-labelledby="account-tab">
				<h5>Managing Your Account</h5>
				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-user-edit fa-lg text-info"></i>
					</div>
					<div>
						<strong>Profile Settings</strong> - Update your personal
						information, contact details, and notification preferences.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-key fa-lg text-secondary"></i>
					</div>
					<div>
						<strong>Security</strong> - Change your password or set up
						two-factor authentication for enhanced security.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-car-side fa-lg text-dark"></i>
					</div>
					<div>
						<strong>Saved Vehicles</strong> - Add, edit, or remove your
						vehicles for faster booking in the future.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-history fa-lg text-muted"></i>
					</div>
					<div>
						<strong>Booking History</strong> - View all your past bookings,
						receipts, and parking history.
					</div>
				</div>
			</div>

			<!-- Payments Tab -->
			<div class="tab-pane fade" id="payments" role="tabpanel"
				aria-labelledby="payments-tab">
				<h5>Payment Options</h5>
				<p>We support multiple secure payment methods:</p>
				<ul>
					<li><strong>Credit/Debit Cards</strong> - Visa, Mastercard,
						American Express</li>
					<li><strong>Digital Wallets</strong> - Apple Pay, Google Pay</li>
					<li><strong>ParkSmart Credits</strong> - Pre-load your account
						with parking credits</li>
					<li><strong>Corporate Accounts</strong> - Business billing
						solutions with monthly invoicing</li>
				</ul>

				<h5 class="mt-4">Subscription Plans</h5>
				<p>For frequent parkers, we offer subscription plans with
					special benefits:</p>
				<ul>
					<li><strong>Monthly Pass</strong> - Unlimited parking at your
						designated location</li>
					<li><strong>Flex Pass</strong> - 15 parking sessions per month
						at any location</li>
					<li><strong>Premium Pass</strong> - Priority booking, reserved
						spaces, and no cancellation fees</li>
				</ul>

				<h5 class="mt-4">Receipts & Invoices</h5>
				<p>All payment receipts are automatically emailed to you and
					available in your account dashboard under "Payment History". For
					business users, detailed monthly invoices can be generated.</p>
			</div>

			<!-- Features Tab -->
			<div class="tab-pane fade" id="features" role="tabpanel"
				aria-labelledby="features-tab">
				<h5>Special Features</h5>
				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-bell fa-lg text-warning"></i>
					</div>
					<div>
						<strong>Reminders & Notifications</strong> - Receive alerts before
						your parking time expires.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-calendar-alt fa-lg text-primary"></i>
					</div>
					<div>
						<strong>Recurring Bookings</strong> - Set up daily, weekly, or
						monthly recurring parking reservations.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-clock fa-lg text-success"></i>
					</div>
					<div>
						<strong>Extend Parking Time</strong> - Add extra time to your
						current parking session remotely.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-map fa-lg text-danger"></i>
					</div>
					<div>
						<strong>Navigation</strong> - Get directions to your reserved
						parking spot with our integrated maps.
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<i class="fas fa-tags fa-lg text-info"></i>
					</div>
					<div>
						<strong>Loyalty Program</strong> - Earn points with every booking
						and redeem for free parking.
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

