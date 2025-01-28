function validateForm() {
	let fullName = document.getElementById("userFullName").value;
	let email = document.getElementById("userEmail").value;
	let password = document.getElementById("userPassword").value;
	let phoneNumber = document.getElementById("userPhoneNumber").value;
	let address = document.getElementById("userAddress").value;



	// Validate Full Name
	if (fullName === "") {
		alert("Full Name is required!");
		return false; // Prevent form submission
	}

	// Validate Email
	if (email === "") {
		console.log("Email is invalid");
		alert("Email is required!");
		return false; // Prevent form submission
	}
	// Check if email format is valid
	let emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
	if (!emailPattern.test(email)) {
		console.log("Email Pattern is invalid");
		alert("Please enter a valid email address!");
		return false; // Prevent form submission
	}

	// Validate Password
	if (password === "") {
		alert("Password is required!");
		return false; // Prevent form submission
	}
	// Password length check (minimum 6 characters)
	if (password.length < 6) {
		console.log("Password Length Must Be More");
		alert("Password must be at least 6 characters long!");
		return false; // Prevent form submission
	}

	// Validate Phone Number
	if (phoneNumber === "") {
		alert("Phone Number is required!");
		return false; // Prevent form submission
	}
	// Check if phone number is numeric and 10 digits
	let phonePattern = /^[0-9]{10}$/;
	if (!phonePattern.test(phoneNumber)) {
		console.log("Phone Number SHould be of 10 digit");
		alert("Please enter a valid 10-digit phone number!");
		return false; // Prevent form submission
	}

	// Validate Address
	if (address === "") {
		alert("Address is required!");
		return false; // Prevent form submission
	}

	// If all fields are valid, return true and submit the form
	return true; // Allow form submission
}