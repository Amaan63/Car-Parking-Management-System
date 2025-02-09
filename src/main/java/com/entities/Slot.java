package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;

@Entity
@Table(name = "parking_slot")
public class Slot {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int slotId;
	
	@Column(length = 100, name = "slot_name")
	private String slotName;

	// Specifies that the SlotStatus field is an enumerated type and should be
	// stored as a String in the database.
	// By using EnumType.STRING, the enum's name (e.g., "AVAILABLE", "OCCUPIED") is
	// persisted in the database rather than its ordinal (0, 1, etc.).
	@Enumerated(EnumType.STRING)
	// Maps the status field to a column in the database with the name "status".
	// The nullable = false constraint ensures that this field cannot be left empty
	// in the database.
	@Column(name = "status", nullable = false)
	private SlotStatus status;

	@OneToOne
	@JoinColumn(name = "vehicle_id", referencedColumnName = "vehicleId", unique = true)
	private Vehicle assignedVehicle;

	// @PrePersist to set default value if not assigned
	@PrePersist
	public void setDefaultStatus() {
		if (status == null) {
			status = SlotStatus.AVAILABLE;
		}
	}

	
	public int getSlotId() {
		return slotId;
	}


	public void setSlotId(int slotId) {
		this.slotId = slotId;
	}


	public String getSlotName() {
		return slotName;
	}


	public void setSlotName(String slotName) {
		this.slotName = slotName;
	}


	public SlotStatus getStatus() {
		return status;
	}


	public void setStatus(SlotStatus status) {
		this.status = status;
	}


	public Vehicle getAssignedVehicle() {
		return assignedVehicle;
	}


	public void setAssignedVehicle(Vehicle assignedVehicle) {
		this.assignedVehicle = assignedVehicle;
	}


	public Slot() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Slot(String slotName, SlotStatus status) {
		super();
		this.slotName = slotName;
		this.status = status;
	}
}
