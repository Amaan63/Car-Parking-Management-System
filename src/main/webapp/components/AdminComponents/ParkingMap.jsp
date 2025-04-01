
<%@page import="com.entities.Slot"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.ParkingSlotDao"%>
<%@ page import="java.util.List"%>


<%
ParkingSlotDao dao = new ParkingSlotDao(FactoryProvider.getFactory());
List<Slot> slots = dao.getAllSlots(); // Directly fetching all slots
%>

<div class="card bg-dark text-light border border-secondary mb-4">
	<div
		class="card-header border-secondary d-flex justify-content-between align-items-center">
		<h5 class="card-title mb-0">Parking Slots Status</h5>
	</div>
	<div class="card-body">
		<div class="d-flex flex-wrap justify-content-center">
			<%
			if (slots != null && !slots.isEmpty()) {
				for (Slot slot : slots) {
					String bgColor = "bg-success"; // Default: AVAILABLE
					if (slot.getStatus().equalsIgnoreCase("OCCUPIED")) {
				bgColor = "bg-danger";
					} else if (slot.getStatus().equalsIgnoreCase("RESERVED")) {
				bgColor = "bg-warning";
					}
			%>
			<div class="parking-slot <%=bgColor%>"><%=slot.getSlotName()%></div>
			<%
			}
			} else {
			%>
			<p class="text-center fs-2 text-warning">No slots have been added
				yet.</p>
			<%
			}
			%>
		</div>
		<div class="mt-3 text-center">
			<span class="badge bg-success me-2">Available</span> <span
				class="badge bg-danger me-2">Occupied</span> <span
				class="badge bg-warning">Reserved</span>
		</div>
	</div>
</div>

<style>
.parking-slot {
	width: 60px;
	height: 80px;
	margin: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 8px;
	cursor: pointer;
	text-align: center;
	font-size: 14px;
	font-weight: bold;
	color: white;
}

@media ( max-width : 576px) {
	.parking-slot {
		width: 50px;
		height: 70px;
		font-size: 12px;
	}
	.fs-2 {
		font-size: 1.5rem !important;
	}
}
</style>


