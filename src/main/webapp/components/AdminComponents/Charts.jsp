<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
<!-- Charts Row -->
<div class="row g-4 mb-4">
	<div class="col-md-8">
		<div class="card bg-dark text-light border border-secondary">
			<div class="card-header border-secondary">
				<h5 class="card-title mb-0">Parking Usage Analytics</h5>
			</div>
			<div class="card-body">
				<canvas id="usageChart" height="200"></canvas>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="card bg-dark text-light border border-secondary">
			<div class="card-header border-secondary">
				<h5 class="card-title mb-0">Occupancy Rate</h5>
			</div>
			<div class="card-body">
				<canvas id="occupancyChart" height="200"></canvas>
			</div>
		</div>
	</div>
</div>
<script>
	const usageCtx = document.getElementById("usageChart").getContext("2d");
	new Chart(usageCtx, {
		type : "line",
		data : {
			labels : [ "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun" ],
			datasets : [ {
				label : "Weekly Usage",
				data : [ 65, 59, 80, 81, 56, 55, 40 ],
				fill : true,
				borderColor : "#0d6efd",
				backgroundColor : "rgba(13, 110, 253, 0.1)",
				tension : 0.4,
			}, ],
		},
		options : {
			responsive : true,
			maintainAspectRatio : false,
			plugins : {
				legend : {
					display : false,
				},
				tooltip : {
					mode : "index",
					intersect : false,
					backgroundColor : "rgba(0, 0, 0, 0.8)",
					titleColor : "#fff",
					bodyColor : "#fff",
					borderColor : "rgba(255, 255, 255, 0.1)",
					borderWidth : 1,
				},
			},
			scales : {
				y : {
					beginAtZero : true,
					grid : {
						color : "rgba(255, 255, 255, 0.1)",
					},
					ticks : {
						color : "#ffffff80",
					},
				},
				x : {
					grid : {
						color : "rgba(255, 255, 255, 0.1)",
					},
					ticks : {
						color : "#ffffff80",
					},
				},
			},
		},
	});

	// Occupancy Chart - Current parking space distribution
	const occupancyCtx = document.getElementById("occupancyChart").getContext(
			"2d");
	new Chart(occupancyCtx, {
		type : "doughnut",
		data : {
			labels : [ "Available", "Occupied", "Reserved" ],
			datasets : [ {
				data : [ 65, 25, 10 ],
				backgroundColor : [ "#198754", // success
				"#dc3545", // danger
				"#ffc107", // warning
				],
				borderWidth : 0,
			}, ],
		},
		options : {
			responsive : true,
			maintainAspectRatio : false,
			plugins : {
				legend : {
					position : "bottom",
					labels : {
						color : "#ffffff80",
						padding : 10,
						usePointStyle : true,
						pointStyle : "circle",
					},
				},
				tooltip : {
					backgroundColor : "rgba(0, 0, 0, 0.8)",
					titleColor : "#fff",
					bodyColor : "#fff",
					borderColor : "rgba(255, 255, 255, 0.1)",
					borderWidth : 1,
				},
			},
			cutout : "65%",
		},
	});
</script>