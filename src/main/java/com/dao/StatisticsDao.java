package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class StatisticsDao {
	private SessionFactory factory;

	public StatisticsDao(SessionFactory factory) {
		this.factory = factory;
	}

	// Get total slots from Slot table (int)
	public int getTotalSlots() {
		Session session = factory.openSession();
		try {
			Query<Long> query = session.createQuery("SELECT COUNT(s.slotId) FROM Slot s", Long.class);
			return query.uniqueResult().intValue();
		} finally {
			session.close();
		}
	}

	// Get total vehicles from Vehicle table (int)
	public int getTotalVehicles() {
		Session session = factory.openSession();
		try {
			Query<Long> query = session.createQuery("SELECT COUNT(v.vehicleId) FROM Vehicle v", Long.class);
			return query.uniqueResult().intValue();
		} finally {
			session.close();
		}
	}

	// Get total users from User table (int)
	public int getTotalUsers() {
		Session session = factory.openSession();
		try {
			Query<Long> query = session.createQuery("SELECT COUNT(u.userId) FROM User u", Long.class);
			return query.uniqueResult().intValue();
		} finally {
			session.close();
		}
	}

	// Get total revenue from Payment table (long) and format to ₹K, M
	public String getTotalRevenue() {
		Session session = factory.openSession();
		try {
			Query<Long> query = session.createQuery("SELECT SUM(p.amount) FROM Payment p", Long.class);
			Long totalPaise = query.uniqueResult();
			return formatCurrency(totalPaise);
		} finally {
			session.close();
		}
	}

	// Method to format currency (convert paise to rupees, K, M)
	private String formatCurrency(Long paise) {
		if (paise == null || paise == 0)
			return "0";

		double rupees = paise / 100.0;
		if (rupees >= 1_000_000) {
			return String.format("%.1fM", rupees / 1_000_000);
		} else if (rupees >= 1_000) {
			return String.format("%.1fk", rupees / 1_000);
		} else {
			return String.format("%.2f", rupees);
		}
	}
}
