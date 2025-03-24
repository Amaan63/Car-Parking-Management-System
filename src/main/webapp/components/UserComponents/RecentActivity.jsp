
<%@page import="com.entities.Payment"%>
<%@page import="com.dao.PaymentDao"%>
<%
String email = (String) session.getAttribute("userForRecentActivity");
%>

<!-- Recent Activity Section -->
<%@page import="com.dao.UtilsDao"%>
<%@page import="com.entities.Vehicle"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.VehicleDao"%>
<%@page import="com.dao.PaymentDao"%>
<div class="col-lg-8 col-md-12">
	<!-- Takes full width on small screens -->
	<div class="card shadow-none border-0">
		<div class="card-header bg-danger">
			<h5 class="card-title mb-0">Recent Activity</h5>
		</div>
		<div class="card-body bg-dark text-light">
			<div class="list-group list-group-flush">
				<!-- 
				<div class="list-group-item bg-dark text-light border-secondary">
					<div class="d-flex w-100 justify-content-between">
						<h6 class="mb-1">Booking #1234 Completed</h6>
						<small class="text-muted">3 days ago</small>
					</div>
					<p class="mb-1">Slot A1, Duration: 2 hours</p>
					<small class="text-success"> <i
						class="fas fa-check-circle me-1"></i> Successfully completed
					</small>
				</div> -->
				<%
				UtilsDao utilsDao = new UtilsDao();
				VehicleDao vDao = new VehicleDao(FactoryProvider.getFactory());
				PaymentDao pDao = new PaymentDao(FactoryProvider.getFactory());
				Vehicle vehicle = vDao.getLatestCompletedBooking(email);
				%>

				<%
				if (vehicle != null) {

					String bookingDate = vehicle.getBookingDate();
					String timeDuration = vehicle.getTimeDuration();

					// Calculate elapsed time dynamically in JSP
					String timeElapsed = utilsDao.getTimeElapsed(bookingDate, timeDuration);
				%>
				<div class="list-group-item bg-dark text-light border-secondary">
					<div class="d-flex w-100 justify-content-between">
						<h6 class="mb-1">
							Booking #<%=vehicle.getParkingTokennumber()%>
							Completed
						</h6>
						<small class="text-muted"><%=timeElapsed%></small>
					</div>
					<p class="mb-1">
						Duration:
						<%=vehicle.getTimeDuration()%>
						hours
					</p>
					<small class="text-success"> <i
						class="fas fa-check-circle me-1"></i> Successfully completed
					</small>
				</div>
				<%
				} else {
				%>
				<div
					class="list-group-item bg-dark text-light border-secondary text-center">
					<p class="mb-1">No completed bookings available.</p>
				</div>
				<%
				}
				%>
				<!-- 
				<div class="list-group-item bg-dark text-light border-secondary">
					<div class="d-flex w-100 justify-content-between">
						<h6 class="mb-1">New Vehicle Added</h6>
						<small class="text-muted">5 days ago</small>
					</div>
					<p class="mb-1">Toyota Camry (ABC 123)</p>
					<small class="text-info"> <i
						class="fas fa-info-circle me-1"></i> Vehicle verified
					</small>
				</div>  -->
				<%
				// Fetch the latest vehicle
				Vehicle latestVehicle = vDao.getLatestVehicleByEmail(email);
				%>
				<%
				if (latestVehicle != null) {

					String bookingDate = latestVehicle.getBookingDate();
					String timeDuration = latestVehicle.getTimeDuration();
				%>
				<div class="list-group-item bg-dark text-light border-secondary">
					<div class="d-flex w-100 justify-content-between">
						<h6 class="mb-1">New Vehicle Added</h6>
						<small class="text-muted"> <%=utilsDao.getTimeElapsed(bookingDate, timeDuration)%>
						</small>
					</div>
					<p class="mb-1">
						<%=latestVehicle.getVehicleCompany()%>
						:
						<%=latestVehicle.getVehicleName()%>
						(<%=latestVehicle.getVehicleNumberPlate()%>)
					</p>
					<small class="text-info"> <i
						class="fas fa-info-circle me-1"></i> Vehicle verified
					</small>
				</div>
				<%
				} else {
				%>
				<div
					class="list-group-item bg-dark text-light border-secondary text-center">
					<p class="mb-1">No recent vehicle added.</p>
				</div>
				<%
				}
				%>

				<%
				// Fetch the latest payment
				Payment latestPayment = pDao.getLatestPaymentByEmail(email);
				%>
				<%
				if (latestPayment != null) {
					String dateTimeStr = latestPayment.getPaymentDate();
					long amount = latestPayment.getAmount()/100;
				%>
				<div class="list-group-item bg-dark text-light border-secondary">
					<div class="d-flex w-100 justify-content-between">
						<h6 class="mb-1">Payment Received</h6>
						<small class="text-muted"> <%=utilsDao.getTimeElapsedWithTime(dateTimeStr)%>
						</small>
					</div>
					<p class="mb-1">
						&#8377; <%=amount%>
						for Booking #<%=latestPayment.getVehicleNumber()%>
					</p>
					<small class="text-success"> <i
						class="fas fa-check-circle me-1"></i> Transaction completed
					</small>
				</div>
				<%
				} else {
				%>
				<div
					class="list-group-item bg-dark text-light border-secondary text-center">
					<p class="mb-1">No recent payments.</p>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
</div>