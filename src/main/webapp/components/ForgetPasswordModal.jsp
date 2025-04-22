<style>
.customBtn{
	width: 100%; /* Full-width button */
	background: #1db954; /* Green background */
	color: #ffffff; /* White text */
	border: none;
	transition: background 0.3s ease; /* Smooth hover effect */
}
</style>

<!-- Modal -->
<div class="modal fade" id="forgotPasswordModal" tabindex="-1"
	aria-labelledby="forgotPasswordModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-dark" id="forgotPasswordModalLabel">Forgot
					Password?</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="forgotPasswordForm" action="VerifySecurityQuestion"
					method="post">
					<div class="mb-3">
						<label for="forgotPasswordEmail" class="form-label text-dark">Email</label>
						<input type="email" class="form-control" id="forgotPasswordEmail"
							name="email" placeholder="Enter your email" required />
					</div>

					<div class="mb-3">
						<label for="forgotPassword_securityQuestion"
							class="form-label text-dark">Security Question</label> <select
							class="form-select" id="forgotPassword_securityQuestion"
							name="forgotPasswordSecurityQuestion" required>
							<option value="" disabled selected>Select a security
								question</option>
							<option value="What is your favorite food?">What is your
								favorite food?</option>
							<option value="What is the name of your
								first friend?">What
								is the name of your first friend?</option>
							<option value="What is the name of your first
								pet?">What
								is the name of your first pet?</option>
							<option value="What is your mother's
								name?">What
								is your mother's name?</option>
							<option value="What is your favorite
								color?">What
								is your favorite color?</option>
						</select> 
					</div>
					<div class="mb-3">
						<label for="forgotPasswordAnswer" class="form-label text-dark">Your
							Answer</label> <input type="text" class="form-control"
							id="forgotPasswordAnswer" name="forgotPasswordAnswer" placeholder="Enter your answer"
							required />
					</div>
					<button type="submit" class="btn customBtn">Submit</button>
				</form>
			</div>
		</div>
	</div>
</div>
