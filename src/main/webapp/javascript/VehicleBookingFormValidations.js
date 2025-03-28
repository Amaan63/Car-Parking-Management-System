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
	const numberPlate = document.getElementById('numberPlate').value.trim();
	const regex = /^[A-Z]{2}[-\s]?\d{1,2}[-\s]?[A-Z]{1,2}[-\s]?\d{4}$/; // Accepts spaces or hyphens

	if (numberPlate === '') {
		alert('Please enter the vehicle number plate.');
		isValid = false;
	} else if (!regex.test(numberPlate)) {
		alert('Invalid vehicle number plate. Please enter a valid Indian vehicle number plate.');
		console.log('Numberplate is wrong');
		isValid = false;
	}

	// Vehicle type validation
	const vehicleType = document.querySelector('input[name="vehicleType"]:checked');
	if (vehicleType === null) {
		alert('Please select a vehicle type.');
		isValid = false;
	}


	// Get the selected booking date from the input field
	const bookingDate = new Date(document.getElementById('bookingDate').value);

	// Get today's date
	const today = new Date();

	// Reset the time of today's date to midnight (00:00:00) to ensure only the date part is compared
	today.setHours(0, 0, 0, 0);

	// Validate that the selected booking date is not before today
	if (bookingDate < today) {
		alert('Booking date cannot be before today.'); // Show an error message if the date is invalid
		isValid = false; // Set validation flag to false
	}


	// Time duration validation
	const timeDuration = document.getElementById('inputState').value;
	if (timeDuration === 'Choose...') {
		alert('Please select a time duration.');
		isValid = false;
	}


	// Car company validation - dropdown and manual entry
	const carCompany = carCompanyElement.value;
	const otherCarCompany = document.getElementById('otherCarCompany').value.trim();

	if (carCompany === 'Choose...') {
		alert('Please select a valid car brand.');
		isValid = false;
	} else if (carCompany === 'Other' && otherCarCompany === '') {
		alert('Please enter your car company.');
		isValid = false;
	}

	return isValid;
}