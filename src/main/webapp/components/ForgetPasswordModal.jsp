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
				<form id="forgotPasswordForm">
					<div class="mb-3">
						<label for="securityQuestion" class="form-label text-dark">Security
							Question</label> <input type="text" class="form-control"
							id="securityQuestion" placeholder="Enter the answer" required />
					</div>
					<div class="mb-3">
						<label for="answer" class="form-label text-dark">Your Answer</label> <input
							type="text" class="form-control" id="answer"
							placeholder="Enter your answer" required />
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</div>
</div>
