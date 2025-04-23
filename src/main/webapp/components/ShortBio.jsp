<style>
/* Make images responsive and ensure they scale properly */
.responsive-img {
	max-width: 100%;
	height: auto;
}

/* Ensuring a uniform image size for larger screens */
@media ( min-width : 768px) {
	.fixed-img-size {
		width: 500px;
		height: auto;
	}
}
</style>

<!-- New Section - Why this is Important -->
<div class="container mt-5" id="Info">
	<div class="row align-items-center">
		<!-- Image Column (Displays first on larger screens) -->
		<div class="col-md-6 text-center text-md-start">
			<img src="images/Why-Important.svg" alt="Why This Is Important"
				class="img-fluid responsive-img fixed-img-size" />
		</div>

		<!-- Text Column -->
		<div class="col-md-6">
			<h2 class="highlight fw-bold">Why This Is Important ?</h2>
			<p>In a world where parking spaces are limited, efficient
				management systems become crucial. Our system provides optimized
				solutions for managing spaces, reducing time spent searching for
				parking and improving overall satisfaction.</p>
		</div>
	</div>
</div>

<!-- New Section - Short Bio -->
<div class="container mt-5">
	<div class="row align-items-center">
		<!-- Text Column (Displays first on larger screens) -->
		<div class="col-md-6">
			<h2 class="highlight fw-bold">Short Bio</h2>
			<p>Parking Management Systems are transforming how cities and
				businesses handle car spaces. Our solution is designed to offer
				seamless user experiences with integrated payment systems and easy
				access to parking slots in real time.</p>
		</div>

		<!-- Image Column -->
		<div class="col-md-6 text-center text-md-end">
			<img src="images/Short-Bio.svg" alt="Short Bio"
				class="img-fluid responsive-img fixed-img-size" />
		</div>
	</div>
</div>

<!-- New Section - Everything is Online -->
<div class="container mt-5">
	<div class="row align-items-center" >
		<!-- Image Column -->
		<div class="col-md-6 text-center text-md-start">
			<img src="images/Everything-Online.svg" alt="Everything-Online"
				class="img-fluid responsive-img fixed-img-size" />
		</div>

		<!-- Text Column -->
		<div class="col-md-6">
			<h2 class="highlight fw-bold">Everything is Online</h2>
			<p>Manage parking space reservations and payments entirely
				online. Access the system from anywhere, book a slot, and complete
				payments effortlessly. All you need is an internet connection.</p>
		</div>
	</div>
</div>
