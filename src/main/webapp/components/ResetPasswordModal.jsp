
<%
String email = (String) session.getAttribute("passwordVerificationEmail");
if (email != null) {
%>

<!-- Reset Password Modal -->
<div class="modal fade" id="resetPasswordModal" tabindex="-1"
	aria-labelledby="resetPasswordLabel" aria-hidden="true">
	<div class="modal-dialog">
		<form action="ResetPasswordServlet" method="post"
			class="modal-content" onsubmit="return validatePasswords()">
			<div class="modal-header">
				<h5 class="modal-title text-dark">Reset Password</h5>
			</div>
			<div class="modal-body">
				<!-- Hidden field to pass the email -->
				<input type="hidden" name="email" value="<%=email%>">

				<!-- New Password Field -->
				<div class="mb-3">
					<label for="newPassword" class="text-dark">New Password</label> <input
						type="password" id="newPassword" name="newPassword"
						class="form-control" required>
				</div>

				<!-- Confirm Password Field -->
				<div class="mb-3">
					<label for="confirmPassword" class="text-dark">Confirm
						Password</label> <input type="password" id="confirmPassword"
						name="confirmPassword" class="form-control" required>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn customBtn">Update Password</button>
			</div>
		</form>
	</div>
</div>

<script>
	function validatePasswords() {
		const newPassword = document.getElementById("newPassword").value.trim();
		const confirmPassword = document.getElementById("confirmPassword").value
				.trim();

		if (newPassword.length < 6 || confirmPassword.length < 6) {
			alert("Both passwords must be at least 6 characters long.");
			return false;
		}
		return true;
	}
</script>


<%
}
%>
