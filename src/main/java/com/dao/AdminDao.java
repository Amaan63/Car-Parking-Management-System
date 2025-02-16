package com.dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.User;

public class AdminDao {
	private SessionFactory factory;

	public AdminDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public List<User> getAllUsers(){
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
		}
		finally {
			session.close();
		}
		return users;
	}
}
