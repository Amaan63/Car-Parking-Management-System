<style>
.popup {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5); /* Overlay background */
	align-items: center;
	justify-content: center;
}

.popup-content {
	background-color: white;
	padding: 30px;
	border-radius: 8px;
	text-align: center;
	max-width: 500px;
	width: 100%;
}

.popup-image {
	max-width: 100px;
	margin-bottom: 20px;
}

.popup-close {
	font-size: 30px;
	font-weight: bold;
	color: #aaa;
	float: right;
	cursor: pointer;
}

.popup-close:hover {
	color: red;
}
</style>

<div class="popup" id="popupMessage">
	<div class="popup-content">
		<span class="popup-close" id="popupClose">&times;</span> <img
			src="videos/AnimatedLogo/RegistrationSuccessful.gif" alt="Successfully Registered"
			class="popup-image">
		<h3  style="color: green;">Successfully Registered</h3>
		<p style="color: black;">You have Registered  Successfully</p>
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



