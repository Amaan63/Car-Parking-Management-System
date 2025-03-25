
<%@ page import="java.text.NumberFormat, java.util.Locale"%>
<%@ page import="com.dao.VehicleDao"%>
<%@ page import="com.helper.FactoryProvider"%>
<%
// Assuming you have the user's email stored in session
String userEmail = (String) session.getAttribute("userForQuickStats");

// Get the Hibernate SessionFactory (Ensure you have a HibernateUtil class managing SessionFactory)
VehicleDao vehicleDAO = new VehicleDao(FactoryProvider.getFactory());

// Fetch stats from DAO
long totalVehiclesParked = vehicleDAO.getTotalVehiclesParked(userEmail);
long totalParkingFeesPaid = vehicleDAO.getTotalParkingFeesPaid(userEmail);
String currentActiveParking = vehicleDAO.getCurrentActiveParkingSlots(userEmail);
int totalHoursParked = vehicleDAO.getTotalHoursParked(userEmail);


String totalParkingFeesPaidInRupees = String.valueOf(totalParkingFeesPaid / 100.0);


// Check if there is no data
boolean isDataAvailable = totalVehiclesParked > 0 || totalParkingFeesPaid > 0 || currentActiveParking != null
		|| totalHoursParked > 0;
%>

<div class="col-lg-4 col-md-12">
	<div class="card shadow-sm bg-dark">
		<div class="card-header bg-primary">
			<h5 class="card-title mb-0">My Parking Stats</h5>
		</div>
		<div class="card-body">
			<%
			if (isDataAvailable) {
			%>
			<div class="d-flex justify-content-between align-items-center mb-3">
				<div>Total Vehicles Parked</div>
				<div>
					<span class="h4 mb-0 text-warning"><%=totalVehiclesParked%></span>
				</div>
			</div>
			<div class="d-flex justify-content-between align-items-center mb-3">
				<div>Total Parking Fees Paid</div>
				<div>
					<span class="h4 mb-0 text-danger">&#8377; <%=totalParkingFeesPaidInRupees%></span>
				</div>
			</div>
			<div class="d-flex justify-content-between align-items-center mb-3">
				<div>Current Active Parking</div>
				<div>
					<span class="h6 mb-0 text-success"><%=currentActiveParking != null ? currentActiveParking : "No Active Parking"%></span>
				</div>
			</div>
			<div class="d-flex justify-content-between align-items-center mb-3">
				<div>Total Hours Parked</div>
				<div>
					<span class="h6 mb-0 text-info"><%=totalHoursParked%>
						hours</span>
				</div>
			</div>
			<%
			} else {
			%>
			<!-- Show this message if no data is available -->
			<div class="text-center">
				<p class="text-muted">No parking activity found.</p>
			</div>
			<%
			}
			%>
		</div>
	</div>
</div>


<!-- My Parking Stats Section
<div class="col-lg-4 col-md-12">
	<!-- Takes full width on small screens 
	<div class="card shadow-sm bg-dark">
		<div class="card-header bg-primary">
			<h5 class="card-title mb-0">My Parking Stats</h5>
		</div>
		<div class="card-body">
			<div class="d-flex justify-content-between align-items-center mb-3">
				<div>Total Vehicles Parked</div>
				<div>
					<span class="h4 mb-0 text-warning">12</span>
				</div>
			</div>
			<div class="d-flex justify-content-between align-items-center mb-3">
				<div>Total Parking Fees Paid</div>
				<div>
					<span class="h4 mb-0 text-danger">₹1200</span>
				</div>
			</div>
			<div class="d-flex justify-content-between align-items-center mb-3">
				<div>Current Active Parking</div>
				<div>
					<span class="h6 mb-0 text-success">Slot A2 (Active)</span>
				</div>
			</div>
			<div class="d-flex justify-content-between align-items-center mb-3">
				<div>Total Hours Parked</div>
				<div>
					<span class="h6 mb-0 text-info">45 hours</span>
				</div>
			</div>
		</div>
	</div>
</div> -->

