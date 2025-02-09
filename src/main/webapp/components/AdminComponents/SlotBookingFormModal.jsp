<!-- Modal -->
<div class="modal fade " id="SlotCreatingModal" tabindex="-1"
	aria-labelledby="SlotCreatingModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg ">
		<div class="modal-content bg-dark">
			<div class="modal-header">
				<h5 class="modal-title" id="SlotCreatingModalLabel">Slot
					Creating</h5>
				<button type="button" class="btn-close btn-close-white"
					data-bs-dismiss="modal" aria-label="Close"></button>

			</div>
			<div class="modal-body">
				<form action="../SaveSlot" method="post">
					<div class="mb-3">
						<label for="slotName" class="form-label">Slot Name</label> <input
							type="text" class="form-control" id="slotName"
							placeholder="Enter your Slot Name" name="slotName" required />
					</div>
					<div class="mb-3">
						<label for="slotStatus" class="form-label">Slot Status</label> <select
							id="slotStatus" class="form-select" name="slotStatus" required>
							<option selected>AVAILABLE</option>
							<option value="Toyota">OCCUPIED</option>
							<option value="Honda">RESERVED</option>
						</select>
					</div>
					<div class="btn col-md-12 mt-3">
						<button type="submit" class="btn btn-success col-md-12">Book
							Vehicle</button>
					</div>
				</form>
			</div>
			<!--  
			<div class="modal-footer d-flex justify-content-between w-100">
				<button type="button" class="btn btn-sm btn-secondary col-auto"
					data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-lg btn-primary col-auto">
					Save changes</button>
			</div>
			-->
		</div>
	</div>
</div>