<%@page import="com.entities.User"%>
<%
// Retrieve the user object from the session
User userNameForBanner = (User) session.getAttribute("userForBanner");

// Check if the user is logged in
if (userNameForBanner != null) {
	// Display the user's name (assuming 'getName()' is a method that retrieves the user's name)
	String userNameForTitle = userNameForBanner.getUserFullName();
%>

<!-- Welcome Banner -->
<div class=" text-white py-4" style="background-color: #1db954">
	<div class="container">
		<h1 class="h3">
			Welcome back,
			<%=userNameForTitle%>!
		</h1>
		<p class="mb-0">Manage your parking needs easily and efficiently</p>
	</div>
</div>

<%
}
%>
