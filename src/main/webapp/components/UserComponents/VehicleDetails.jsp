<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.VehicleDao"%>
<%@page import="com.entities.User"%>
<%@page import="com.entities.Vehicle"%>

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
	%>
	<div class="card booking-card">
		<div class="card-header">
			<span>Green Rides</span> <i class="bi bi-car-front-fill icon"></i>
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
			<div class="token-highlight">
				<i class="bi bi-qr-code icon"></i> Parking Token:
				<%=vehicle.getParkingTokennumber() != null ? vehicle.getParkingTokennumber() : "N/A"%>
			</div>
		</div>
		<div class="footer">Booked with ❤️ by Green Rides</div>
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
