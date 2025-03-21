<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.StatisticsDao"%>
<%
StatisticsDao statisticsDao = new StatisticsDao(FactoryProvider.getFactory());
int totalSlots = statisticsDao.getTotalSlots();
int totalVehicles = statisticsDao.getTotalVehicles();
int totalUsers = statisticsDao.getTotalUsers();
String totalRevenue = statisticsDao.getTotalRevenue(); // Now returns a formatted string
%>

<!-- Statistics Cards -->
<div class="row g-4 mb-4">
	<div class="col-12 col-sm-6 col-md-3">
		<div class="card bg-primary bg-gradient text-white stats-card">
			<div class="card-body">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h6 class="card-title">Total Slots</h6>
						<h2 class="mb-0"><%=totalSlots%></h2>
					</div>
					<i class="fas fa-parking fa-2x opacity-50"></i>
				</div>
			</div>
		</div>
	</div>
	<div class="col-12 col-sm-6 col-md-3">
		<div class="card bg-success bg-gradient text-white stats-card">
			<div class="card-body">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h6 class="card-title">Total Vehicles</h6>
						<h2 class="mb-0"><%=totalVehicles%></h2>
					</div>
					<i class="fa-solid fa-car fa-2x opacity-50"></i>
				</div>
			</div>
		</div>
	</div>
	<div class="col-12 col-sm-6 col-md-3">
		<div class="card bg-warning bg-gradient text-dark stats-card">
			<div class="card-body">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h6 class="card-title">Total Users</h6>
						<h2 class="mb-0"><%=totalUsers%></h2>
					</div>
					<i class="fas fa-users fa-2x opacity-50"></i>
				</div>
			</div>
		</div>
	</div>
	<div class="col-12 col-sm-6 col-md-3">
		<div class="card bg-danger bg-gradient text-white stats-card">
			<div class="card-body">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h6 class="card-title">Revenue</h6>
						<h2 class="mb-0"><%=totalRevenue%></h2>
					</div>
					<i class="fa-solid fa-indian-rupee-sign fa-2x opacity-50"></i>
				</div>
			</div>
		</div>
	</div>
</div>

<style>
.stats-card {
	min-height: 120px;
}

@media ( max-width : 768px) {
	.stats-card h2 {
		font-size: 1.5rem;
	}
	.stats-card i {
		font-size: 1.8rem;
	}
}

@media ( max-width : 576px) {
	.stats-card {
		text-align: center;
	}
	.stats-card .d-flex {
		flex-direction: column;
	}
	.stats-card i {
		margin-top: 10px;
	}
}
</style>
