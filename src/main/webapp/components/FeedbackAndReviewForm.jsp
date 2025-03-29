<!-- Bootstrap & Custom Styling -->
<link rel="stylesheet" href="./css/FeedbackFormStyle.css">
<!-- Feedback and Rating Form -->
<div class="container d-flex justify-content-center mb-3"
	id="FeedbackForm">
	<div class="card p-4 shadow-lg border-0 mx-auto"
		style="width: 80%; background: #1B1B1B !important;">

		<!-- Images side by side (Always stay in one row) -->
		<div class="image-container mb-3">
			<img src="images/FeedbackAndReview/Rating1.png" alt="Rating Image"
				class="img-fluid feedback-img"> <img
				src="images/FeedbackAndReview/Rating2.png" alt="Rating Image"
				class="img-fluid feedback-img"> <img
				src="images/FeedbackAndReview/Rating3.png" alt="Rating Image"
				class="img-fluid feedback-img">
		</div>

		<form action="SaveFeedbackServlet" method="post">
			<h2 class="text-center text-white">Give Your Feedback</h2>

			<!-- Date  -->
			<input type="hidden" name="feedbackTime"
				value="<%=new java.util.Date()%>">


			<!-- Email Input -->
			<div class="mb-3">
				<label for="email" class="form-label fw-bold text-white">Your
					Email</label> <input type="email" class="form-control" id="email"
					name="email" placeholder="Enter your email" required>
			</div>

			<!-- Feedback Message -->
			<div class="mb-3">
				<label for="feedbackMessage" class="form-label fw-bold text-white">Your
					Feedback</label>
				<textarea class="form-control" id="feedbackMessage"
					name="feedbackMessage" placeholder="Share your experience..."
					rows="4" required></textarea>
			</div>

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

			<!-- Suggestions -->
			<div class="mb-3">
				<label for="suggestions" class="form-label fw-bold text-white">Any
					Suggestions?</label>
				<textarea class="form-control" id="suggestions" name="suggestions"
					placeholder="How can we improve?" rows="2"></textarea>
			</div>


			<!-- Submit Button -->
			<button type="submit" class="btn btn-success w-100">Submit
				Feedback</button>
		</form>
	</div>
</div>


