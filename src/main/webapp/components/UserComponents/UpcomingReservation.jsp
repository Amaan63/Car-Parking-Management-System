<%@page import="com.entities.Vehicle"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.VehicleDao"%>
<%
int userId = (Integer) session.getAttribute("userIdForUpcomingReservation"); // Get logged-in user's ID
VehicleDao vehicleDao = new VehicleDao(FactoryProvider.getFactory());
List<Vehicle> upcomingReservations = vehicleDao.getUpcomingReservations(userId);
%>


<!-- Upcoming Reservations -->
<div class="container py-2">
	<div class="row g-3">
		<div class="col-md-12 mx-auto">
			<!-- Matches Parking Rate Card width -->
			<div class="card bg-dark text-white">
				<div class="card-header bg-info">
					<h5 class="card-title mb-0 text-dark fs-3">Upcoming
						Reservations</h5>
				</div>
				<div class="card-body">
					<div class="row g-4">
						<%
						if (upcomingReservations != null && !upcomingReservations.isEmpty()) {
						%>
						<%
						for (Vehicle v : upcomingReservations) {
						%>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="border rounded p-3 bg-dark text-white h-100">
								<h6 class="mb-2">
									<%=v.getBookingDate()%>, Time Duration
									<%=v.getTimeDuration()%>
								</h6>
								<div class="small text-muted">
									Slot Allocated is <i class="fas fa-map-marker-alt me-1"></i> <span
										class="text-light"> <%
 if (v.getSlot() != null && v.getSlot().getSlotName() != null) {
 %> <%=v.getSlot().getSlotName()%>
										<%
										} else {
										%> Slot not allocated yet <%
										}
										%>
									</span>
								</div>
								<div class="mt-2">
									<%
									if ("Upcoming".equals(v.getStatus())) {
									%>
									<span class="badge bg-success">Upcoming</span>
									<%
									} else {
									%>
									<span class="badge bg-warning">Pending</span>
									<%
									}
									%>
								</div>
							</div>
						</div>
						<%
						}
						%>
						<%
						} else {
						%>
						<p class="text-center text-muted">No upcoming reservations.</p>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

