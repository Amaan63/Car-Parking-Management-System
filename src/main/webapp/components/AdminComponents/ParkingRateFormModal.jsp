<!-- Modal  -->
<div class="modal fade" id="parkingRateFormModal" tabindex="-1"
	aria-labelledby="ParkingRateFormLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content bg-dark">
			<div class="modal-header">
				<h5 class="modal-title" id="ParkingRateFormLabel">Setting Up Parking Rates</h5>
				<button type="button" class="btn-close btn-close-white"
					data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form action="" method="post">
					<div class="mb-3">
						<label for="ratePerHour" class="form-label">Set Hourly
							Rate (&#8377;):</label> <input type="number" step="10"
							class="form-control" id="ratePerHour" name="ratePerHour" required>
					</div>
					<div class="btn col-md-12 mt-3">
						<button type="submit" class="btn btn-success col-md-12">Update
							Rate</button>
					</div>
					<div class="btn col-md-12 mt-3">
						<button type="submit" class="btn btn-success col-md-12">Submit
							Parking Rates</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
