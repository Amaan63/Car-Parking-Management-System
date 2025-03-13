<style>
/* Popup background */
.popup {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5); /* Overlay background */
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 20px;
	z-index: 3;
}

/* Popup container */
.popup-content {
	background-color: white;
	padding: 25px;
	border-radius: 10px;
	text-align: center;
	max-width: 500px;
	width: 90%;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
	position: relative;
}

/* Close button */
.popup-close {
	position: absolute;
	top: 10px;
	right: 15px;
	font-size: 24px;
	font-weight: bold;
	color: #aaa;
	cursor: pointer;
	transition: color 0.3s ease;
}

.popup-close:hover {
	color: red;
}

/* Image styling */
.popup-image {
	max-width: 80px;
	margin-bottom: 15px;
}

/* Responsive adjustments */
@media ( max-width : 480px) {
	.popup-content {
		padding: 20px;
		width: 95%;
	}
	.popup-image {
		max-width: 60px;
	}
	.popup-close {
		font-size: 22px;
	}
}
</style>

<div class="popup" id="popupMessage">
	<div class="popup-content">
		<span class="popup-close" id="popupClose">&times;</span> <img
			src="images/security/authenticationError.png" alt="Admin Logout"
			class="popup-image">
		<h3  style="color: red;">You are Not Authenticated</h3>
		<p style="color: black;">Please Login First</p>
	</div>
</div>
<script>
	// Show the popup when the message is displayed
	document.getElementById('popupMessage').style.display = 'flex';

	// Close the popup when the close button is clicked
	document.getElementById('popupClose').addEventListener('click', function() {
		document.getElementById('popupMessage').style.display = 'none'; // Hide the popup
	});

	// Close the popup when clicking outside the popup content
	window.onclick = function(event) {
		if (event.target == document.getElementById('popupMessage')) {
			document.getElementById('popupMessage').style.display = 'none'; // Hide popup if clicked outside
		}
	}
</script>



