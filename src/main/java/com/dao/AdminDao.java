package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.User;
import com.entities.Vehicle;

public class AdminDao {
	private SessionFactory factory;

	public AdminDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public List<User> getAllUsers() {
		Session session = this.factory.openSession();
		Transaction transaction = null;
		List<User> users = null;
		try {
			transaction = session.beginTransaction();
			// HQL Query to get all users
			Query<User> query = session.createQuery("FROM User", User.class);
			users = query.list();
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return users;
	}

	public List<Vehicle> getAllVehicles() {
		Session session = this.factory.openSession();
		Transaction transaction = null;
		List<Vehicle> vehicles = null;
		try {
			transaction = session.beginTransaction();
			// HQL Query to get all vehicles
			Query<Vehicle> query = session.createQuery("FROM Vehicle", Vehicle.class);
			vehicles = query.list();
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return vehicles;
	}

	// Delete User by ID
	public boolean deleteUserById(int userId) {
		Session session = this.factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			User user = session.get(User.class, userId);
			if (user != null) {
				session.delete(user);
				transaction.commit();
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;
	}

}
