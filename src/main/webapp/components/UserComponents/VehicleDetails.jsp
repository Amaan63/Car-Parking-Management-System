<%@page import="java.util.Optional"%>
<%@page import="com.dao.RatesDao"%>
<%@page import="com.entities.Slot"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.VehicleDao"%>
<%@page import="com.entities.User"%>
<%@page import="com.entities.Vehicle"%>

<%
// Fetch the single rate per hour (ID = 1)
RatesDao ratesDao = new RatesDao(FactoryProvider.getFactory());
double ratePerHour = ratesDao.getFixedRatePerHour() / 100.0; // Convert paise to rupees
System.out.println(ratePerHour);
%>

<link rel="stylesheet" href="../css/VehicleDetailCardStyle.css">

<div class="card-container mt-5">
	<%
	// Retrieve the user object from the session and extract the email
	User userForFetchingVehicleByEmail = (User) session.getAttribute("userForFetchingVehicleByEmail");
	String email = (userForFetchingVehicleByEmail != null) ? userForFetchingVehicleByEmail.getUserEmail() : "";

	// Initialize VehicleDao and retrieve vehicle details
	VehicleDao vehicledao = new VehicleDao(FactoryProvider.getFactory());
	List<Vehicle> vehicles = vehicledao.getAllVehicleByEmailId(email);
	%>

	<%
	if (vehicles != null && !vehicles.isEmpty()) {
		for (Vehicle vehicle : vehicles) {

			// Converting The Object into Long for TotalCost
			long totalCostInPaise = Optional.ofNullable(vehicle.getTotalCost()).orElse(0L);
			long totalCostInRupees = totalCostInPaise / 100; // Convert paise to rupees
	%>
	<div class="card booking-card">
		<div class="card-header">
			<span>Park Ease</span>
			<%
			Slot slotObj = vehicle.getSlot();
			int slotId = (slotObj != null) ? slotObj.getSlotId() : 0;

			if (slotId > 0) {
			%>
			<!-- Smaller badge in the right corner for "Slot Allocated" -->
			<span
				class="badge bg-success position-absolute top-0 end-0 m-1 p-1 px-2 fs-6 ">Slot
				Allocated</span>
			<%
			} else {
			%>
			<!-- Smaller badge in the right corner for "No Slot Allocated" -->
			<span
				class="badge bg-danger position-absolute top-0 end-0 m-1 p-1 px-2 fs-6">No
				Slot Allocated</span>
			<%
			}
			%>
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-5">Vehicle Company:</div>
				<div class="col-7"><%=vehicle.getVehicleCompany() != null ? vehicle.getVehicleCompany() : "N/A"%></div>
			</div>
			<div class="row">
				<div class="col-5">Vehicle Name:</div>
				<div class="col-7"><%=vehicle.getVehicleName() != null ? vehicle.getVehicleName() : "N/A"%></div>
			</div>
			<div class="row">
				<div class="col-5">Number Plate:</div>
				<div class="col-7"><%=vehicle.getVehicleNumberPlate() != null ? vehicle.getVehicleNumberPlate() : "N/A"%></div>
			</div>
			<div class="row">
				<div class="col-5">Vehicle Type:</div>
				<div class="col-7"><%=vehicle.getVehicleType() != null ? vehicle.getVehicleType() : "N/A"%></div>
			</div>
			<div class="row">
				<div class="col-5 d-flex align-items-center">
					<i class="bi bi-calendar icon me-2"></i> Booking Date:
				</div>
				<div class="col-7"><%=vehicle.getBookingDate() != null ? vehicle.getBookingDate() : "N/A"%></div>
			</div>
			<div class="row">
				<div class="col-5">Duration:</div>
				<div class="col-7"><%=vehicle.getTimeDuration() != null ? vehicle.getTimeDuration() : "N/A"%></div>
			</div>
			<div class="row">
				<div class="col-5">Rate per Hour:</div>
				<div class="col-7">
					&#8377;
					<%=ratePerHour%></div>
			</div>
			<div class="token-highlight">
				<i class="bi bi-credit-card-2-front-fill"></i> Parking Token:
				<%=vehicle.getParkingTokennumber() != null ? vehicle.getParkingTokennumber() : "N/A"%>
			</div>
			<div class="d-flex justify-content-center">
				<button class="cost-highlight" 
					onclick="payNow('<%=totalCostInPaise%>', '<%=vehicle.getUserEmailId()%>')">
					Pay Now: &#8377;<%=totalCostInRupees%>
				</button>
			</div>
		</div>
		<div class="footer">Booked with &#10084; by Park Ease</div>
	</div>
	<%
	}
	} else {
	%>
	<div class="alert alert-info">No vehicles found for this user.</div>
	<%
	}
	%>
</div>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script src="../javascript/RazorPay.js"></script>

