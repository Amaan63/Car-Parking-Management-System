<!-- Feedback and Rating Form -->
<div class="container d-flex justify-content-center mb-3"
	id="FeedbackForm">
	<div class="card p-4 shadow-lg border-0 mx-auto"
		style="width: 80%; background: #1B1B1B !important;">

		<!-- Images side by side with responsive size -->
		<div class="d-flex justify-content-center gap-3 mb-3">
			<img src="images/FeedbackAndReview/Feedback.svg" alt="Feedback Image"
				class="img-fluid feedback-img"> <img
				src="images/FeedbackAndReview/Review.svg" alt="Review Image"
				class="img-fluid feedback-img">
		</div>

		<form action="FeedbackServlet" method="post">
			<h2 class="text-center text-white">Give Your Feedback</h2>

			<!-- Star Rating -->
			<div class="mb-3 text-center">
				<label class="form-label fw-bold text-white">Rate Your
					Experience</label>
				<div class="rating">
					<input type="radio" name="rating" id="star5" value="5"><label
						for="star5">&#9733;</label> <input type="radio" name="rating"
						id="star4" value="4"><label for="star4">&#9733;</label> <input
						type="radio" name="rating" id="star3" value="3"><label
						for="star3">&#9733;</label> <input type="radio" name="rating"
						id="star2" value="2"><label for="star2">&#9733;</label> <input
						type="radio" name="rating" id="star1" value="1"><label
						for="star1">&#9733;</label>
				</div>
			</div>

			<!-- Feedback Message -->
			<div class="mb-3">
				<label for="feedbackMessage" class="form-label fw-bold text-white">Your
					Feedback</label>
				<textarea class="form-control" id="feedbackMessage"
					name="feedbackMessage" placeholder="Share your experience..."
					rows="4" required></textarea>
			</div>

			<!-- Submit Button -->
			<button type="submit" class="btn btn-success w-100">Submit
				Feedback</button>
		</form>
	</div>
</div>

<!-- Bootstrap & Custom Styling -->
<style>
.rating {
	direction: rtl;
	display: flex;
	justify-content: center;
	font-size: 2rem;
}

.rating input {
	display: none;
}

.rating label {
	cursor: pointer;
	padding: 5px;
	transition: color 0.3s;
}

.rating input:checked ~ label, .rating label:hover, .rating label:hover 
	 ~ label {
	color: #FFD700;
}

.card {
	border-radius: 10px;
	background: transparent !important;
	/* Ensures the card inherits the global background */
}
/* Responsive Image Sizes */
.feedback-img {
	width: 80px; /* Default for small screens */
}

@media ( min-width : 576px) {
	.feedback-img {
		width: 100px;
	}
}

@media ( min-width : 992px) {
	.feedback-img {
		width: 150px;
	}
}
</style>
