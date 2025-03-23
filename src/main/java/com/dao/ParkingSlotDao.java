package com.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Slot;
import com.entities.Vehicle;

public class ParkingSlotDao {
	private SessionFactory factory;
	private VehicleDao vehicleDao;

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

	// Method to check if slot name already exists
	public boolean isSlotNameExists(String slotName) {
		Session session = this.factory.openSession();
		boolean exists = false;
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query<Long> query = session.createQuery("SELECT COUNT(s) FROM Slot s WHERE s.slotName = :slotName",
					Long.class);
			query.setParameter("slotName", slotName);

			Long count = query.uniqueResult();
			exists = count != null && count > 0;

			if (exists) {
				System.out.println("Slot name already exists in the database.");
			}

			transaction.commit();
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
		}
		return exists;
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
				slot.setAssignedVehicle(vehicle);

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

			// First, deallocate slots for completed vehicles
			deallocateSlotsAutomatically();

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
				slot.setAssignedVehicle(vehicle);

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

	// Getting Slot to make A parking Map
	public List<Slot> getAllSlots() {
		Session session = this.factory.openSession();
		Transaction transaction = null;
		List<Slot> slots = null;

		try {
			transaction = session.beginTransaction();

			Query<Slot> query = session.createQuery("FROM Slot", Slot.class);
			slots = query.list();

			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}

		return slots;
	}

	public String deallocateSlotsAutomatically() {
		// Open a Hibernate session
		Session session = this.factory.openSession();
		Transaction transaction = null;

		try {
			// Begin transaction
			transaction = session.beginTransaction();

			// Fetch vehicles with status "COMPLETED" and have an assigned slot
			List<Vehicle> completedVehicles = session
					.createQuery("FROM Vehicle v WHERE v.status = 'Completed' AND v.slot IS NOT NULL", Vehicle.class)
					.getResultList();

			// If no completed vehicles found, return message
			if (completedVehicles.isEmpty()) {
				return "No slots to deallocate.";
			}

			// Counter for deallocated slots
			int deallocatedCount = 0;

			// Iterate through completed vehicles and deallocate slots
			for (Vehicle vehicle : completedVehicles) {
				Slot slot = vehicle.getSlot();
				if (slot != null) {
					// Set slot as available and remove assigned vehicle
					slot.setStatus("AVAILABLE");
					slot.setAssignedVehicle(null);

					// Remove slot reference from vehicle
					vehicle.setSlot(null);

					// Update slot and vehicle in the database
					session.update(slot);
					session.update(vehicle);

					deallocatedCount++;
				}
			}

			// Commit transaction
			transaction.commit();
			return deallocatedCount + " slots successfully deallocated.";
		} catch (Exception e) {
			// Roll back transaction in case of error
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error occurred during slot deallocation.";
		} finally {
			// Close session
			session.close();
		}
	}

}
