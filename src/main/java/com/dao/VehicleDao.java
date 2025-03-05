package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.User;
import com.entities.Vehicle;

public class VehicleDao {

	private SessionFactory factory;
	private ParkingSlotDao parkingSlotDao;

	public VehicleDao(SessionFactory factory) {
		this.factory = factory;
	}

	public boolean saveVehicle(Vehicle vehicle) {
		Session session = this.factory.openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();

			session.save(vehicle);
			transaction.commit();
			
			// After saving, allocate a slot to this vehicle if available
			List<Vehicle> unassignedVehicles = getUnassignedVehicles();
			if (!unassignedVehicles.isEmpty()) {
				ParkingSlotDao parkingSlotDao = new ParkingSlotDao(factory);
				parkingSlotDao.allocateSlotsToUnassignedVehicles(unassignedVehicles);
			}
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			if (session != null && session.isOpen()) {
	            session.close();
	        }
		}
	}

	public User getUserById(int userId) {
		User user = null;
		try {
			Session session = this.factory.openSession();
			user = session.get(User.class, userId);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	// Method to get all vehicles by email
	public List<Vehicle> getAllVehicleByEmailId(String email) {
		Session session = this.factory.openSession();
		List<Vehicle> vehicles = null;
		try {
			String hql = "FROM Vehicle WHERE userEmailId = :email";
			Query<Vehicle> query = session.createQuery(hql, Vehicle.class);
			query.setParameter("email", email);
			vehicles = query.list();

			if (vehicles != null && !vehicles.isEmpty()) {
				//System.out.println("Vehicles found: " + vehicles.size());
			}
		} catch (Exception e) {
			e.printStackTrace(); // Print the exception for debugging
		} finally {
			session.close();
		}
		return vehicles;
	}

	public List<Vehicle> getUnassignedVehicles() {
		Session session = this.factory.openSession();
		List<Vehicle> unassignedVehicles = new ArrayList<>();

		try {
			// Fetch vehicles without assigned slots
			unassignedVehicles = session.createQuery("FROM Vehicle v WHERE v.slot IS NULL", Vehicle.class)
					.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return unassignedVehicles;
	}

	public long getRatePerHour() {
		Session session = this.factory.openSession();
		long ratePerHour = 0L;

		try {
			// Fetch the single rate per hour from the Rates table
			// Ensure only one rate is fetched
			ratePerHour = session.createQuery("SELECT r.ratePerHour FROM Rates r", Long.class).setMaxResults(1) 
					.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return ratePerHour;
	}

	/**
	 * Extracts the numeric value from a time duration string (e.g., "3 Hours"or "3 hours").
	 */
	public int extractHours(String timeDuration) {
	    if (timeDuration != null && timeDuration.matches("\\d+\\s*[Hh]ours?")) {
	        return Integer.parseInt(timeDuration.replaceAll("[^0-9]", ""));
	    }
	    return 0; // Default to 0 if format is invalid
	}

	
	// New Method to calculate and update total cost
	public void calculateAndUpdateCost(int vehicleId) {
	    Session session = this.factory.openSession();
	    Transaction transaction = null;

	    try {
	        transaction = session.beginTransaction();

	        // Step 3: Fetch the saved vehicle
	        Vehicle savedVehicle = session.get(Vehicle.class, vehicleId);
	        if (savedVehicle == null) {
	            System.out.println("Vehicle not found after save!");
	            return;
	        }

	        // Step 4: Calculate total cost
	        long ratePerHour = getRatePerHour();
	        //System.out.println(ratePerHour);
	        int totalHours = extractHours(savedVehicle.getTimeDuration());
	        String Time = (String)savedVehicle.getTimeDuration();
	        //System.out.println(Time);
	        //System.out.println(totalHours);
	        long totalCost = ratePerHour * totalHours;
	        //System.out.println(totalCost);

	        // Step 5: Update vehicle with total cost
	        savedVehicle.setTotalCost(totalCost);
	        session.update(savedVehicle);
	        transaction.commit();

	       // System.out.println("Total cost updated successfully: " + totalCost);
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (session != null && session.isOpen()) {
	            session.close();
	        }
	    }
	}
}
