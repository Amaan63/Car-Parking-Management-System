package com.dao;

import java.util.List;

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

		try {
			transaction = session.beginTransaction();
			session.save(vehicle);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			session.close();
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
		Session session = factory.openSession();
		List<Vehicle> vehicles = null;
		try {
			String hql = "FROM Vehicle WHERE userEmailId = :email";
			Query<Vehicle> query = session.createQuery(hql, Vehicle.class);
			query.setParameter("email", email);
			vehicles = query.list();

			if (vehicles != null && !vehicles.isEmpty()) {
				System.out.println("Vehicles found: " + vehicles.size());
			}
		} catch (Exception e) {
			e.printStackTrace(); // Print the exception for debugging
		} finally {
			session.close();
		}
		return vehicles;
	}

}
