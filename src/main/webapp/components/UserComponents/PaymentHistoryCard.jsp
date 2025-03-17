<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.PaymentDao"%>
<%@page import="com.entities.Payment"%>
<%@page import="com.entities.User"%>
<%@page import="java.util.List"%>

<%
Object userObj = session.getAttribute("userForPaymentHistory");
User userEmailForPaymentHistory = null;
if (userObj instanceof User) {
	userEmailForPaymentHistory = (User) userObj;
}

// Check if the user is logged in
List<Payment> payments = null;
if (userEmailForPaymentHistory != null) {
	// Retrieve the user's email
	String userEmail = userEmailForPaymentHistory.getUserEmail();

	// Fetch payment history using DAO
	PaymentDao paymentDao = new PaymentDao(FactoryProvider.getFactory());
	payments = paymentDao.getPaymentsByEmail(userEmail);
}
%>

<div class="container pt-3">
	<div class="row">
		<%
		if (payments != null && !payments.isEmpty()) {
			for (Payment payment : payments) {
				long amountInRupees = payment.getAmount() / 100; // Corrected long usage
		%>
		<div class="col-md-4 mb-4">
			<div class="payment-card">
				<div class="glow glow-1"></div>
				<div class="glow glow-2"></div>
				<div
					class="payment-header d-flex justify-content-between align-items-center">
					<div>
						<h5 class="payment-title mb-0">Payment Receipt</h5>
						<small class="opacity-75">Thank you for your payment</small>
					</div>
					<span class="payment-badge"><i
						class="fas fa-check-circle me-1"></i>SUCCESS</span>
				</div>
				<div class="card-body p-4">
					<div class="payment-detail">
						<span class="detail-label"><i class="fa-solid fa-envelope"></i>
							Email Id</span> <span class="detail-value"><%=payment.getEmail()%></span>
					</div>
					<div class="payment-detail">
						<span class="detail-label"><i class="fas fa-hashtag"></i>
							Order ID</span> <span class="detail-value"><%=payment.getOrderId()%></span>
					</div>
					<div class="payment-detail">
						<span class="detail-label"><i class="fas fa-rupee-sign"></i>
							Amount</span> <span class="detail-value">&#8377; <%=amountInRupees%></span>
					</div>
					<div class="payment-detail">
						<span class="detail-label"><i class="far fa-calendar-alt"></i>
							Date</span> <span class="detail-value"><%=payment.getPaymentDate()%></span>
					</div>
					<div class="payment-detail">
						<span class="detail-label"><i class="fas fa-car"></i>
							Vehicle</span> <span class="detail-value"><%=payment.getVehicleNumber()%></span>
					</div>
					<div class="payment-detail">
						<span class="detail-label"><i class="fas fa-ticket-alt"></i>
							Parking Token</span> <span class="detail-value"><%=payment.getParkingToken()%></span>
					</div>
				</div>
				<div class="payment-footer text-center">
					<div class="d-flex align-items-center justify-content-center">
						<span class="transaction-id"> <i
							class="fas fa-fingerprint me-2" style="color: #16d756"></i>
							Transaction ID: <%=payment.getRazorpayPaymentId()%>
						</span>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		} else {
		%>
		<!-- Info Alert -->
		<div class="container d-flex justify-content-center">
			<div class="alert alert-danger mt-3 mb-0 col-md-10 text-center">
				<i class="fas fa-info-circle me-1"></i> No Payment have done till
				now
			</div>
		</div>

		<%
		}
		%>
	</div>
</div>
