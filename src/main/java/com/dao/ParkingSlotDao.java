package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Slot;

public class ParkingSlotDao {
	private SessionFactory factory;

	public ParkingSlotDao(SessionFactory factory) {
		this.factory = factory;
	}

	public boolean addSlot(Slot slot) {
		Session session = this.factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.save(slot);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			session.close();
		}
	}
}
