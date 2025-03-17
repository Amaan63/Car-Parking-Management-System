package com.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.User;
import com.entities.Vehicle;

public class VehicleDao {

	private SessionFactory factory;

	public VehicleDao(SessionFactory factory) {
		this.factory = factory;
	}

	public boolean saveVehicle(Vehicle vehicle) {
		Session session = this.factory.openSession();
		Transaction transaction = null;
		LocalDate today = LocalDate.now();

		try {
			transaction = session.beginTransaction();

			session.save(vehicle);
			vehicle.updateStatus(today);
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
				// System.out.println("Vehicles found: " + vehicles.size());
			}
		} catch (Exception e) {
			e.printStackTrace(); // Print the exception for debugging
		} finally {
			session.close();
		}
		return vehicles;
	}

	// To get all the vehicle to update the Rates
	public List<Vehicle> getAllVehicles() {
		List<Vehicle> vehicles = new ArrayList<>();
		Session session = null;

		try {
			session = this.factory.openSession();
			Transaction transaction = session.beginTransaction();

			Query<Vehicle> query = session.createQuery("FROM Vehicle", Vehicle.class);
			vehicles = query.list();

			LocalDate today = LocalDate.now();

			for (Vehicle vehicle : vehicles) {
				String oldStatus = vehicle.getStatus(); // Store old status
				vehicle.updateStatus(today); // Update status dynamically

				if (!oldStatus.equals(vehicle.getStatus())) {
					session.update(vehicle); // Only update if status changed
				}
			}

			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null && session.isOpen()) {
				session.close();
			}
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
	 * Extracts the numeric value from a time duration string (e.g., "3 Hours"or "3
	 * hours").
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
			// System.out.println(ratePerHour);
			int totalHours = extractHours(savedVehicle.getTimeDuration());
			// String Time = (String) savedVehicle.getTimeDuration();
			// System.out.println(Time);
			// System.out.println(totalHours);
			long totalCost = ratePerHour * totalHours;
			// System.out.println(totalCost);

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

	// This for Pie Chart in Admin Panel
	public List<Object[]> getVehicleCounts() {
		Session session = this.factory.openSession();
		Transaction transaction = null;
		List<Object[]> vehicleCounts = null;
		try {
			transaction = session.beginTransaction();

			// Query to fetch vehicle type counts
			String hql = "SELECT v.vehicleType, COUNT(v) FROM Vehicle v GROUP BY v.vehicleType";
			Query<Object[]> query = session.createQuery(hql, Object[].class);
			vehicleCounts = query.getResultList();

			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return vehicleCounts;
	}

	// This check whether the Vehicle Already Exist or Not
	// Method in VehicleDao to check if a vehicle number exists
	public boolean isVehicleNumberExists(String vehicleNumber) {
		Session session = null;
		boolean exists = false;
		try {
			session = this.factory.openSession();
			Query query = session.createQuery("SELECT COUNT(v) FROM Vehicle v WHERE v.vehicleNumberPlate = :vNumber");
			query.setParameter("vNumber", vehicleNumber);
			Long count = (Long) query.uniqueResult();

			System.out.println("Checking vehicleNumber: " + vehicleNumber + ", Found count: " + count);

			exists = (count != null && count > 0);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return exists;
	}

	// Manually update all vehicle statuses (Optional: Call this on a button click)
	public String updateAllVehicleStatuses() {
		Session session = this.factory.openSession();
		Transaction transaction = null;
		int updatedCount = 0;
		try {
			transaction = session.beginTransaction();

			List<Vehicle> vehicles = session.createQuery("FROM Vehicle", Vehicle.class).list();
			LocalDate today = LocalDate.now();

			for (Vehicle vehicle : vehicles) {
				String oldStatus = vehicle.getStatus();
				vehicle.updateStatus(today);

				if (!oldStatus.equals(vehicle.getStatus())) {
					session.update(vehicle);
					updatedCount++;
				}
			}
			transaction.commit();
			return "✅ Updated " + updatedCount + " vehicle statuses successfully.";
		} catch (Exception e) {
			e.printStackTrace();
			return "❌ Error updating vehicle statuses: " + e.getMessage();
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	public List<Vehicle> getUpcomingReservations(int userId) {
		List<Vehicle> reservations = null;
		Session session = this.factory.openSession();
		Transaction tx = null;

		try  {
			tx = session.beginTransaction();

			// Fetch only the logged-in user's upcoming reservations (limit 6)
			Query<Vehicle> query = session.createQuery(
					"FROM Vehicle v LEFT JOIN FETCH v.slot WHERE v.status = :status AND v.user.id = :userId ORDER BY v.BookingDate ASC",
					Vehicle.class);
			query.setParameter("status", "Upcoming");
			query.setParameter("userId", userId);
			query.setMaxResults(6); // Limit to top 6 upcoming reservations

			reservations = query.getResultList();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}

		return reservations;
	}
	
	 /**
     * Retrieves the count of vehicles based on their time duration.
     * @return A map where keys are time durations and values are vehicle counts.
     */
    public Map<String, Long> getVehicleCountByTimeDuration() {
        Map<String, Long> durationMap = new HashMap<>();
        
        // Open a Hibernate session
        try (Session session = this.factory.openSession()) {

            // HQL query to count vehicles for each time duration
            String hql = "SELECT v.timeDuration, COUNT(v) FROM Vehicle v GROUP BY v.timeDuration ORDER BY v.timeDuration";
            Query<Object[]> query = session.createQuery(hql, Object[].class);
            
            // Process the query result
            for (Object[] row : query.getResultList()) {
                durationMap.put((String) row[0], (Long) row[1]); // Store data in the map
            }

        } catch (Exception e) {
            e.printStackTrace(); // Print any errors
        }
        
        return durationMap; // Return the final map
    }

}
