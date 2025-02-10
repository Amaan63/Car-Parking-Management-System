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

	@Column(name = "status", nullable = false)
	private String status;

	@OneToOne
	@JoinColumn(name = "vehicle_id", referencedColumnName = "vehicleId", unique = true)
	private Vehicle assignedVehicleId;

	
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


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Vehicle getAssignedVehicleId() {
		return assignedVehicleId;
	}


	public void setAssignedVehicleId(Vehicle assignedVehicleId) {
		this.assignedVehicleId = assignedVehicleId;
	}


	public Slot() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Slot(String slotName, String status) {
		super();
		this.slotName = slotName;
		this.status = status;
	}
}
