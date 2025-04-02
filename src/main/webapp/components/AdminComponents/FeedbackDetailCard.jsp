
<%@page import="com.utils.TimeUtils"%>
<%@page import="com.entities.Feedback"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.FeedbackDao"%>
<link rel="stylesheet" href="../css/FeedbackCardStyle.css">
<div class="container-fluid py-2">
	<div class="row justify-content-center g-4">

		<%
		TimeUtils timeUtils = new TimeUtils();
		FeedbackDao feedbackDao = new FeedbackDao(FactoryProvider.getFactory());
		List<Feedback> feedbackList = feedbackDao.getAllFeedback();

		if (feedbackList != null && !feedbackList.isEmpty()) {
			for (Feedback feedback : feedbackList) {
				String addedAt = feedback.getFeedbackTime(); 
				String timeElapsed = timeUtils.getTimeElapsedWithTime(addedAt);
		%>

		<!-- Feedback Card -->
		<div class="col-lg-4 col-md-6 col-12">
			<div class="feedback-card card">
				<div class="card-header">
					<i class="fas fa-comments me-2"></i> User Feedback
				</div>
				<div class="card-body">
					<div class="field-container">
						<div class="field-label">
							<span class="icon"><i class="fas fa-envelope"></i></span> Email
						</div>
						<div class="field-value"><%=feedback.getEmail()%></div>
					</div>
					<div class="field-container">
						<div class="field-label">
							<span class="icon"><i class="fas fa-star"></i></span> Rating
						</div>
						<div class="field-value">
							<span class="rating-value"> <%
 for (int i = 1; i <= 5; i++) {
 %>
								<i
								class="fas <%=(i <= feedback.getRating()) ? "fa-star" : "far fa-star"%>"></i>
								<%
								}
								%> <span class="ms-2"><%=feedback.getRating()%>/5</span>
							</span>
						</div>
					</div>
					<div class="field-container">
						<div class="field-label">
							<span class="icon"><i class="fas fa-lightbulb"></i></span>
							Suggestion
						</div>
						<div class="field-value"><%=feedback.getSuggestion()%></div>
					</div>
					<div class="field-container">
						<div class="field-label">
							<span class="icon"><i class="fas fa-comment-alt"></i></span>
							Feedback
						</div>
						<div class="field-value"><%=feedback.getFeedback()%></div>
					</div>
				</div>
				<div class="card-footer">
					<i class="fas fa-calendar-alt me-1"></i> Submitted
					<%=timeElapsed%>
				</div>
			</div>
		</div>
		<%
		}
		} else {
		%>
		<h4 class="text-center text-danger">No feedback available.</h4>
		<%
		}
		%>




	</div>
</div>
