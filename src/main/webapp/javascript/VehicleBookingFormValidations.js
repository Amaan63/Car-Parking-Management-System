// Function to validate form inputs
function validateForm() {
	let isValid = true;

	// Name validation
	const customerName = document.getElementById('customerName').value;
	if (customerName === '') {
		alert('Please enter your name.');
		isValid = false;
	}

	// Email validation
	const email = document.getElementById('email').value;
	const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	if (!emailPattern.test(email)) {
		alert('Please enter a valid email address.');
		isValid = false;
	}

	// Vehicle name validation
	const vehicleName = document.getElementById('vehicleName').value;
	if (vehicleName === '') {
		alert('Please enter the vehicle name.');
		isValid = false;
	}

	// Vehicle number plate validation
	const numberPlate = document.getElementById('numberPlate').value;
	if (numberPlate === '') {
		alert('Please enter the vehicle number plate.');
		isValid = false;
	}

	// Vehicle type validation
	const vehicleType = document.querySelector('input[name="vehicleType"]:checked');
	if (vehicleType === null) {
		alert('Please select a vehicle type.');
		isValid = false;
	}

	// Booking date validation - should not be before today
	const bookingDate = new Date(document.getElementById('bookingDate').value);
	const today = new Date();
	if (bookingDate < today) {
		alert('Booking date cannot be before today.');
		isValid = false;
	}

	// Time duration validation
	const timeDuration = document.getElementById('inputState').value;
	if (timeDuration === 'Choose...') {
		alert('Please select a time duration.');
		isValid = false;
	}

	// Car company validation - dropdown and manual entry
	const carCompany = document.getElementById('carCompany').value;
	const otherCarCompany = document.getElementById('otherCarCompany').value.trim();
	if (carCompany === 'Other' && otherCarCompany === '') {
		alert('Please enter your car company.');
		isValid = false;
	}

	return isValid;
}