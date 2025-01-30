<%@page import="com.entities.User"%>
<%
// Retrieve the user object from the session
User userDetailForBooking = (User) session.getAttribute("userDetailForBooking");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Form</title>
<%@include file="../css/bootstrapCDN.jsp"%>
<link rel="stylesheet" href="../css/global.css">
<link rel="icon" type="image/x-icon" href="../images/Logo/Logo2.png">
<link rel="stylesheet" href="../css/BookingFormDesign.css" />
</head>
<body>
	<%@include file="../components/UserComponents/UserHomeNavBar.jsp"%>

	<div class="container mt-5">
		<div class="form-container">
			<h2 class="text-center mb-4 highlight">Vehicle Booking Form</h2>
			<form action="../SaveVehicleBooking"
				method="post" onsubmit="return validateForm()">
				
				<input type="hidden" name="userId" value="<%=userDetailForBooking.getUserId()%>">
				<!-- Customer Name -->
				<div class="form-group m-3">
					<label for="customerName" class="form-label h3">Customer
						Name</label> <input type="text" class="form-control " id="customerName"
						placeholder="Enter your name" name="userName"
						value="<%=userDetailForBooking.getUserFullName()%>" required />
				</div>

				<!-- Contact Number -->
				<div class="form-group m-3">
					<label for="email" class="form-label">Email Address</label> <input
						type="text" class="form-control" id="email"
						placeholder="Enter your email number" name="userEmail"
						value="<%=userDetailForBooking.getUserEmail()%>" required />
				</div>

				<!-- Vehicle Company -->
				<div class="form-group m-3">
					<label for="carCompany" class="form-label">Automobile Brand
						Company</label> <select id="carCompany" class="form-select"
						name="vehicleCompany" required>
						<option selected>Choose...</option>
						<option value="Toyota">Toyota</option>
						<option value="Honda">Honda</option>
						<option value="Ford">Ford</option>
						<option value="Chevrolet">Chevrolet</option>
						<option value="Nissan">Nissan</option>
						<option value="BMW">BMW</option>
						<option value="Mercedes">Mercedes</option>
						<option value="Hyundai">Hyundai</option>
						<option value="Kia">Kia</option>
						<option value="Volkswagen">Volkswagen</option>
						<option value="Other">Other</option>
					</select>

					<!-- Input field for typing manually -->
					<input type="text" id="otherCarCompany" class="form-control mt-2"
						placeholder="Type your car company" name="otherCompany"
						style="display: none;" />
				</div>

				<!-- Vehicle Name -->
				<div class="form-group m-3">
					<label for="vehicleName" class="form-label">Vehicle Name</label> <input
						type="text" class="form-control" id="vehicleName"
						name="vehicleName" placeholder="Enter vehicle name" required />
				</div>

				<!-- Number Plate -->
				<div class="form-group m-3">
					<label for="numberPlate" class="form-label">Number Plate</label> <input
						type="text" class="form-control" id="numberPlate"
						name="vehicleNumberPlate" placeholder="Enter vehicle number plate"
						required />
				</div>


				<!-- Vehicle Type -->
				<div class="form-group m-3">
					<label class="form-label">Vehicle Type</label>
					<div class="row text-center">
						<div class="col-md-3 col-6 mb-4">
							<div class="radio-item">
								<input type="radio" name="vehicleType" id="bike" value="Bike"
									required /> <label for="bike"> <img
									src="../images/RadioButtonImage/Bike.jpeg" alt="Bike" /> <span>Bike</span>
								</label>
							</div>
						</div>

						<div class="col-md-3 col-6 mb-4">
							<div class="radio-item">
								<input type="radio" name="vehicleType" id="bus" value="Bus" />
								<label for="bus"> <img
									src="../images/RadioButtonImage/Bus.jpeg" alt="Bus" /> <span>Bus</span>
								</label>
							</div>
						</div>

						<div class="col-md-3 col-6 mb-4">
							<div class="radio-item">
								<input type="radio" name="vehicleType" id="miniVan"
									value="MiniVan" /> <label for="miniVan"> <img
									src="../images/RadioButtonImage/MiniVan.jpeg" alt="MiniVan" />
									<span>Mini Van</span>
								</label>
							</div>
						</div>

						<div class="col-md-3 col-6 mb-4">
							<div class="radio-item">
								<input type="radio" name="vehicleType" id="pickup"
									value="Pick Up" /> <label for="pickup"> <img
									src="../images/RadioButtonImage/Pick Up.jpeg" alt="Pick Up" />
									<span>Pick Up</span>
								</label>
							</div>
						</div>

						<div class="col-md-3 col-6 mb-4">
							<div class="radio-item">
								<input type="radio" name="vehicleType" id="Scooter"
									value="Scooter" /> <label for="Scooter"> <img
									src="../images/RadioButtonImage/Scooter.jpeg" alt="Scooter" />
									<span>Scooter</span>
								</label>
							</div>
						</div>

						<div class="col-md-3 col-6 mb-4">
							<div class="radio-item">
								<input type="radio" name="vehicleType" id="sedan" value="Sedan" />
								<label for="sedan"> <img
									src="../images/RadioButtonImage/Sedan.jpeg" alt="Sedan" /> <span>Sedan</span>
								</label>
							</div>
						</div>

						<div class="col-md-3 col-6 mb-4">
							<div class="radio-item">
								<input type="radio" name="vehicleType" id="suv" value="SUV" />
								<label for="suv"> <img
									src="../images/RadioButtonImage/SUV.jpeg" alt="SUV" /> <span>SUV</span>
								</label>
							</div>
						</div>

						<div class="col-md-3 col-6 mb-4">
							<div class="radio-item">
								<input type="radio" name="vehicleType" id="truck" value="Truck" />
								<label for="truck"> <img
									src="../images/RadioButtonImage/Truck.jpeg" alt="Truck" /> <span>Truck</span>
								</label>
							</div>
						</div>
					</div>
				</div>

				<div class="row ">
					<div class="form-group m-3 flex-1  col ">
						<label for="bookingDate" class="form-label">Booking Date</label> <input
							type="date" class="form-control" id="bookingDate"
							name="bookingDate" required />
					</div>
					<div class="col m-3 ">
						<label for="inputState" class="form-label">Time Duration</label> <select
							id="inputState" class="form-select " name="timeDuration" required>
							<option selected>Choose...</option>
							<option value="1 hour">1 hour</option>
							<option value="2 hour">2 hours</option>
							<option value="3 hour">3 hours</option>
							<option value="4 hour">4 hours</option>
							<option value="6 hour">6 hours</option>
						</select>
					</div>
				</div>



				<!-- Submit Button -->
				<div class="btn col-md-12 mt-3 m-3">
					<button type="submit" class="btn btn-success col-md-12">Book
						Vehicle</button>
				</div>
			</form>
		</div>
	</div>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const otherOption = document.getElementById('carCompany');
			const otherInput = document.getElementById('otherCarCompany');

			otherOption.addEventListener('change', function() {
				if (otherOption.value === 'Other') {
					otherInput.style.display = 'block';
				} else {
					otherInput.style.display = 'none';
				}
			});
		});
	</script>
	<script type="text/javascript"
		src="../javascript/VehicleBookingFormValidations.js"></script>
</body>
</html>