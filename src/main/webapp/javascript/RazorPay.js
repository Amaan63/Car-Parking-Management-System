function payNow(amountInPaise, email,vehicleNumber,parkingToken) {
	console.log(email,vehicleNumber,parkingToken,amountInPaise);
	fetch('../PaymentServlet', {
		method: 'POST',
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		body: `amount=${amountInPaise}&email=${email}&vehicleNumber=${vehicleNumber}&parkingToken=${parkingToken}`
	})
		.then(response => response.json())
		.then(data => {
			if (data.success) {
				/* var options = {
					"key": data.key,
					"amount": data.amount,
					"currency": "INR",
					"name": "Park Ease",
					"description": "Parking Payment",
					"order_id": data.orderId,
					"handler": function (response) {
						alert("Payment Successful! Payment ID: " + response.razorpay_payment_id);
						window.location.href = "../PaymentVerificationServlet?payment_id=" + response.razorpay_payment_id;
					},
					"prefill": {
						"email": email // Prefill customer email
					},
					"theme": { "color": "#1db954" }
				}; */
				var options = {
					"key": data.key,
					"amount": data.amount,
					"currency": "INR",
					"name": "Park Ease",
					"description": "Parking Payment",
					"order_id": data.orderId,
					"handler": function(response) {
						//alert("Payment Successful! Payment ID: " + response.razorpay_payment_id);
						window.location.href = "../PaymentVerificationServlet?payment_id=" + response.razorpay_payment_id ;
					},
					"prefill": {
						"email": email // Prefill customer email
					},
					"theme": { "color": "#8a2be2" },
					"modal": {
						"escape": false,  // Prevents closing on ESC
						"backdropclose": false, // Prevents closing on backdrop click
						"handleback": true // Prevents closing on Android back button
					}
				};

				var rzp1 = new Razorpay(options);
				rzp1.open();
			} else {
				alert("Payment failed! Please try again.");
			}
		})
		.catch(error => console.log('Error:', error));
}