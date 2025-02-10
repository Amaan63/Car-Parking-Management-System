package com.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Slot;
import com.entities.Vehicle;

public class ParkingSlotDao {
	private SessionFactory factory;
	VehicleDao vehicleDao;

	public ParkingSlotDao(SessionFactory factory) {
		this.factory = factory;
		this.vehicleDao = new VehicleDao(factory); // Initialize after factory assignment
	}

	public boolean addSlot(Slot slot) {
		Session session = this.factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.save(slot);
			transaction.commit();
			// Fetch unassigned vehicles and allocate slots
			List<Vehicle> unassignedVehicles = vehicleDao.getUnassignedVehicles();
			if (!unassignedVehicles.isEmpty()) {
				allocateSlotsToUnassignedVehicles(unassignedVehicles);
			}
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			session.close();
		}
	}

	public String allocateSlotsAutomatically() {
		// Open a Hibernate session to interact with the database
		Session session = this.factory.openSession();
		Transaction transaction = null;

		try {
			// Begin the transaction
			transaction = session.beginTransaction();

			// Fetch vehicles that do not have any assigned parking slot (slotId is null)
			List<Vehicle> vehiclesWithoutSlots = session
					.createQuery("FROM Vehicle v WHERE v.slot IS NULL", Vehicle.class).getResultList();

			// Fetch parking slots that are available for use
			List<Slot> availableSlots = session.createQuery("FROM Slot s WHERE s.status = 'AVAILABLE'", Slot.class)
					.getResultList();

			// Handle cases where no vehicle needs a slot or no slots are available
			if (vehiclesWithoutSlots.isEmpty()) {
				return "No vehicles need slot allocation.";
			}
			if (availableSlots.isEmpty()) {
				return "No available slots to allocate.";
			}

			// Counter to keep track of allocated slots
			int slotCount = 0;

			// Iterate through each vehicle that needs a slot
			for (Vehicle vehicle : vehiclesWithoutSlots) {
				// Stop if there are no more available slots
				if (slotCount >= availableSlots.size()) {
					break;
				}

				// Get the next available parking slot
				Slot slot = availableSlots.get(slotCount);

				// Set the slot for the vehicle
				vehicle.setSlot(slot);

				// Update slot status and associate vehicle
				slot.setStatus("OCCUPIED");
				slot.setAssignedVehicleId(vehicle);

				// Save the updated vehicle and slot data to the database
				session.update(vehicle);
				session.update(slot);

				// Move to the next available slot for the next vehicle
				slotCount++;
			}

			// Commit the transaction to save the changes in the database
			transaction.commit();
			return slotCount + " slots successfully allocated.";
		} catch (Exception e) {
			// Roll back the transaction if an error occurs
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error occurred during slot allocation.";
		} finally {
			// Close the session to release database resources
			session.close();
		}
	}

	public void allocateSlotsToUnassignedVehicles(List<Vehicle> unassignedVehicles) {
		Session session = this.factory.openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();

			// Fetch available slots
			List<Slot> availableSlots = session.createQuery("FROM Slot s WHERE s.status = 'AVAILABLE'", Slot.class)
					.getResultList();

			// Use an iterator to track slots
			Iterator<Slot> slotIterator = availableSlots.iterator(); 

			for (Vehicle vehicle : unassignedVehicles) {
				if (!slotIterator.hasNext()) {
					break;
				}

				Slot slot = slotIterator.next();

				// Set the slot for the vehicle and update slot status
				vehicle.setSlot(slot);
				slot.setStatus("OCCUPIED");
				slot.setAssignedVehicleId(vehicle);

				session.update(vehicle);
				session.update(slot);
			}

			transaction.commit();

		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

}
