<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.VehicleDao"%>
<%
//Fetch data from DAO
VehicleDao vehicleDAO = new VehicleDao(FactoryProvider.getFactory());
%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
<!-- Charts Row -->
<div class="row g-4 mb-4">
	<div class="col-md-8">
		<div class="card bg-dark text-light border border-secondary">
			<div class="card-header border-secondary">
				<h5 class="card-title mb-0">Vehicle Booking Hour Analytics</h5>
			</div>
			<div class="card-body">
				<canvas id="usageChart" height="200"></canvas>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="card bg-dark text-light border border-secondary">
			<div class="card-header border-secondary">
				<h5 class="card-title mb-0">Vehicle Types Occupancy</h5>
			</div>
			<div class="card-body occupancyChartContainer">
				<canvas id="occupancyChart" height="200"></canvas>
			</div>
		</div>
	</div>
</div>
<%
Map<String, Long> vehicleCount = vehicleDAO.getVehicleCountByTimeDuration();
%>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const chartContainer = document.getElementById("usageChart").parentElement;

    if (!chartContainer) {
        console.error("Chart container not found!");
        return;
    }

    const vehicleData = [
        <%if (vehicleCount != null && !vehicleCount.isEmpty()) {
	for (Map.Entry<String, Long> entry : vehicleCount.entrySet()) {
		String duration = entry.getKey();
		long count = entry.getValue();%>
                { label: "<%=duration%>", value: <%=count%> },
        <%}
}%>
    ];

    if (vehicleData.length === 0) {
        chartContainer.innerHTML = 
            "<p style='color: white; text-align: center; font-size: 16px;'>No vehicles added yet.</p>";
        return;
    }

    const labels = vehicleData.map(item => item.label);
    const dataValues = vehicleData.map(item => item.value);
    const barColors = ["#0d6efd", "#dc3545", "#ffc107", "#28a745", "#6610f2", "#fd7e14", "#20c997", "#6610f2"];

    const usageCtx = document.getElementById("usageChart")?.getContext("2d");
    if (!usageCtx) {
        console.error("Chart canvas not found!");
        return;
    }

    new Chart(usageCtx, {
        type: "bar",
        data: {
            labels: labels,
            datasets: [{
                label: "Number of Vehicles",
                data: dataValues,
                backgroundColor: barColors.slice(0, labels.length)
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { display: false },
                tooltip: {
                    backgroundColor: "rgba(0, 0, 0, 0.8)",
                    titleColor: "#fff",
                    bodyColor: "#fff",
                    borderColor: "rgba(255, 255, 255, 0.1)",
                    borderWidth: 1
                }
            },
            scales: {
                y: { 
                    beginAtZero: true, 
                    ticks: { stepSize: 1 },
                    grid: { color: "rgba(255, 255, 255, 0.2)" }
                },
                x: { 
                    grid: { display: true, color: "rgba(255, 255, 255, 0.2)" }
                }
            }
        }
    });
});
</script>



<script>
	
<%// Call DAO directly inside JSP
List<Object[]> vehicleCounts = vehicleDAO.getVehicleCounts();%>

document.addEventListener("DOMContentLoaded", function () {
    const vehicleData = [
        <%if (vehicleCounts != null && !vehicleCounts.isEmpty()) {
	for (Object[] row : vehicleCounts) {
		String vehicleType = (String) row[0];
		long count = (Long) row[1];%>
                { label: "<%=vehicleType%>", value: <%=count%> },
        <%}
}%>
    ];

    const chartContainer = document.querySelector(".occupancyChartContainer");

    if (vehicleData.length === 0) {
        // Remove the chart and show the message
        chartContainer.innerHTML = 
            "<p style='color: white; text-align: center; font-size: 16px;'>No vehicles added yet.</p>";
    } else {
        // Render the chart if data is available
        const labels = vehicleData.map(item => item.label);
        const dataValues = vehicleData.map(item => item.value);

        const occupancyCtx = document.getElementById("occupancyChart").getContext("2d");
        new Chart(occupancyCtx, {
            type: "doughnut",
            data: {
                labels: labels,
                datasets: [{
                    data: dataValues,
                    backgroundColor: ["#198754", "#dc3545", "#ffc107", "#0d6efd", "#6f42c1", "#fd7e14", "#20c997", "#6610f2"],
                    borderWidth: 0,
                }],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: "bottom",
                        labels: {
                            color: "#ffffff80",
                            padding: 10,
                            usePointStyle: true,
                            pointStyle: "circle",
                        },
                    },
                    tooltip: {
                        backgroundColor: "rgba(0, 0, 0, 0.8)",
                        titleColor: "#fff",
                        bodyColor: "#fff",
                        borderColor: "rgba(255, 255, 255, 0.1)",
                        borderWidth: 1,
                    },
                },
                cutout: "65%",
            },
        });
    }
});


</script>