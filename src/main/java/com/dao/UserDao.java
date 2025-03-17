package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.User;

public class UserDao {
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		this.factory = factory;
	}

	public boolean saveUser(User user) {
		Session session = this.factory.openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();
			session.save(user); // Save the user object to the database
			transaction.commit();
			return true; // Return true if the operation is successful
		} catch (Exception e) {
			e.printStackTrace();
			return false; // Return false if there was an error
		} finally {
			session.close();
		}
	}

	public User getUserByEmail(String email) {
		Session session = this.factory.openSession();
		try {
			// HQL query to fetch user by email
			String hql = "FROM User WHERE userEmail = :email";
			Query<User> query = session.createQuery(hql, User.class);
			query.setParameter("email", email);
			User user = query.uniqueResult(); // returns null if no result found
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public boolean updateUserById(int userId, String name, String phoneNumber, String address, String password,
			String email) {
		Transaction transaction = null;
		try (Session session = this.factory.openSession()) {
			transaction = session.beginTransaction();

			// Fetch user by ID
			User user = session.get(User.class, userId);
			if (user != null) {
				// Update user details
				user.setUserFullName(name);
				user.setUserPhoneNumber(phoneNumber);
				user.setUserAddress(address);
				user.setUserPassword(password);
				user.setUserEmail(email);

				session.update(user);
				transaction.commit();
				return true; // Update successful
			}
			return false; // User not found
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
			return false;
		}
	}

	public User getUserById(int userId) {
		try (Session session = this.factory.openSession()) {
			return session.get(User.class, userId);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
