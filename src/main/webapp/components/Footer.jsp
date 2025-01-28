<style>
.footer {
	background: linear-gradient(to right, #1a1c1f, #2d3436);
	color: #a8b2bd;
}

.footer-title {
	color: #ffffff;
	font-weight: 600;
	margin-bottom: 1.2rem;
}

.footer-link {
	color: #a8b2bd;
	text-decoration: none;
	transition: color 0.3s;
}

.footer-link:hover {
	color: #ffffff;
}

.social-icon {
	width: 35px;
	height: 35px;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.1);
	border-radius: 50%;
	margin-right: 10px;
	transition: all 0.3s;
}

.social-icon:hover {
	background: #007bff;
	transform: translateY(-3px);
}

.footer-bottom {
	background: rgba(0, 0, 0, 0.2);
}

.app-badge {
	height: 40px;
	margin-right: 10px;
	opacity: 0.8;
	transition: opacity 0.3s;
}

.app-badge:hover {
	opacity: 1;
}

.emergency-contact {
	background: rgba(255, 255, 255, 0.05);
	border-radius: 8px;
	padding: 15px;
	border: 1px solid rgba(255, 255, 255, 0.1);
}
</style>
<footer class="footer pt-5">
	<div class="container">
		<div class="row gy-4">
			<!-- Company Info -->
			<div class="col-lg-4 col-md-6">
				<h5 class="footer-title">
					<i class="fas fa-parking me-2"></i>Car Parking Management Sytem
				</h5>
				<p class="mb-4">Making parking hassle-free with smart solutions.
					Find, book, and manage parking spaces with ease.</p>
				<div class="mb-4">
					<a href="#" class="social-icon footer-link"> <i
						class="fab fa-facebook-f"></i>
					</a> <a href="#" class="social-icon footer-link"> <i
						class="fab fa-twitter"></i>
					</a> <a href="#" class="social-icon footer-link"> <i
						class="fab fa-instagram"></i>
					</a> <a href="#" class="social-icon footer-link"> <i
						class="fab fa-linkedin-in"></i>
					</a>
				</div>
			</div>

			<!-- Quick Links -->
			<div class="col-lg-3 col-md-6">
				<h5 class="footer-title">Quick Links</h5>
				<ul class="list-unstyled">
					<li class="mb-2"><a href="#" class="footer-link"> <i
							class="fas fa-angle-right me-2"></i>Find Parking
					</a></li>
					<li class="mb-2"><a href="#" class="footer-link"> <i
							class="fas fa-angle-right me-2"></i>Book a Spot
					</a></li>
					<li class="mb-2"><a href="#" class="footer-link"> <i
							class="fas fa-angle-right me-2"></i>My Bookings
					</a></li>
					<li class="mb-2"><a href="#" class="footer-link"> <i
							class="fas fa-angle-right me-2"></i>Pricing
					</a></li>
					<li class="mb-2"><a href="#" class="footer-link"> <i
							class="fas fa-angle-right me-2"></i>FAQs
					</a></li>
				</ul>
			</div>

			<!-- Contact Info -->
			<div class="col-lg-3 col-md-6">
				<h5 class="footer-title">Contact Info</h5>
				<ul class="list-unstyled">
					<li class="mb-3"><i class="fas fa-map-marker-alt me-2"></i>
						123 Parking Street, City, Country</li>
					<li class="mb-3"><i class="fas fa-phone me-2"></i> +1 234 567
						8900</li>
					<li class="mb-3"><i class="fas fa-envelope me-2"></i>
						support@smartpark.com</li>
					<li class="mb-3"><i class="fas fa-clock me-2"></i> 24/7
						Customer Support</li>
				</ul>
			</div>

			<!-- Emergency Support -->
			<div class="col-lg-2 col-md-6">
				<h5 class="footer-title">24/7 Support</h5>
				<div class="emergency-contact mb-4">
					<h6 class="text-white mb-3">Emergency Support</h6>
					<p class="mb-2">
						<i class="fas fa-phone-alt me-2"></i>Emergency: 911
					</p>
					<p class="mb-2">
						<i class="fas fa-wrench me-2"></i>Breakdown: +1 555-0123
					</p>
					<p class="mb-0">
						<i class="fas fa-shield-alt me-2"></i>Security: +1 555-0124
					</p>
				</div>
				<div>
					<h6 class="text-white mb-3">Mobile Apps</h6>
					<img src="/api/placeholder/120/40" alt="Download on App Store"
						class="app-badge" /> <img
						src="/api/placeholder/120/40" alt="Get it on Google Play"
						class="app-badge" />
				</div>
			</div>
		</div>
	</div>

	<!-- Bottom Bar -->
	<div class="footer-bottom mt-5">
		<div class="container">
			<div class="row py-3">
				<div class="col-md-6 text-center text-md-start">
					<small>&copy; 2025 SmartPark. All rights reserved.</small>
				</div>
				<div class="col-md-6 text-center text-md-end">
					<a href="#" class="footer-link me-3"> <small>Privacy
							Policy</small>
					</a> <a href="#" class="footer-link me-3"> <small>Terms of
							Service</small>
					</a> <a href="#" class="footer-link"> <small>Sitemap</small>
					</a>
				</div>
			</div>
		</div>
	</div>
</footer>