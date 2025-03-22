<!-- 
<section class="hero">
	<!-- Background video 
	<video class="hero-video" autoplay muted loop>
		<source src="videos/HeroSection/Hero2.mp4" type="video/mp4" />
		Your browser does not support the video tag.
	</video> -->

	<!-- Hero content in the front -->
	<!--  
	<div class="hero-content text-center">
		<h1 class="display-4 fw-bold text-white">
			Revolutionize Parking, <span class="highlight" id="typed"></span>
		</h1>
		<p class="lead text-white">Effortless parking management designed
			for modern living. Manage, book, and pay all in one place.</p>
		<div class="mt-4">
			<a href="#features"
				class="btn  btn-outline-light custom-btn  btn-lg me-2">Explore
				Features</a> <a href="#contact" class="btn btn-outline-light btn-lg">Get
				in Touch</a>
		</div>
	</div>
</section>
<script>
	var typed = new Typed("#typed", {
		strings : [ "Effortlessly", "Flawlessly", "Smoothly", "Conveniently",
				"Hassle-Free", "Seamlessly" ],
		typeSpeed : 100, // Typing speed in milliseconds
		backSpeed : 50, // Backspacing speed
		loop : true, // Keep looping
		showCursor : true
	// Show blinking cursor
	});
</script> -->
<section class="hero d-flex align-items-center justify-content-center text-center">
    <!-- Background video that covers the entire hero section -->
    <video class="hero-video" autoplay muted loop>
        <source src="videos/HeroSection/Hero2.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>

    <!-- Bootstrap container to align content properly -->
    <div class="container hero-content">
        <div class="row">
            <!-- Centering content inside the hero section -->
            <div class="col-md-8 mx-auto">
                <h1 class="fw-bold text-white text-md-nowrap text-wrap display-5">
                    Revolutionize Parking, <span class="highlight" id="typed"></span>
                </h1>
                <p class="lead text-white">
                    Effortless parking management designed for modern living. Manage, book, and pay all in one place.
                </p>
                
                <!-- Button container with Bootstrap spacing utilities -->
                <div class="mt-4 d-grid gap-3 d-md-inline-flex">
                    <!-- Buttons with Bootstrap classes for styling -->
                    <a href="#features" class="btn btn-outline-light btn-lg">Explore Features</a>
                    <a href="#FeedbackForm" class="btn btn-outline-light btn-lg">Get in Touch</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Typed.js Typing Effect -->
<script>
    var typed = new Typed("#typed", {
        strings: ["Effortlessly", "Flawlessly", "Smoothly", "Conveniently", "Hassle-Free", "Seamlessly"],
        typeSpeed: 100,
        backSpeed: 50,
        loop: true,
        showCursor: true
    });
</script>


