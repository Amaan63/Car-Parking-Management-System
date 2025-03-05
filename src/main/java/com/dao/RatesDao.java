package com.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Rates;

public class RatesDao {
	private SessionFactory factory;

	public RatesDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public boolean saveOrUpdateRate(Rates rate) {
		Session session = factory.openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();

			// Check if rate already exists
			// Creating an HQL query to fetch the hourly parking rate from the database
			// Assuming there is only ONE row in the Rates table, identified by id = 1
			Query<Rates> query = session.createQuery("FROM Rates r WHERE r.id = 1", Rates.class);
			Rates existingRate = query.uniqueResult();

			if (existingRate != null) {
				// Update existing rate
				existingRate.setRatePerHour(rate.getRatePerHour());
				session.update(existingRate);
			} else {
				// Save new rate
				session.save(rate);
			}

			transaction.commit();
			return true;

		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return false;

		} finally {
			session.close();
		}
	}
	
	// Get the fixed rate per hour (ID = 1)
    public double getFixedRatePerHour() {
    	Session session = factory.openSession();
    	double ratePerHour = 0.0;
        try {
            Rates rate = session.get(Rates.class, 1L); // Always fetch rate with ID = 1
            if (rate != null) {
                ratePerHour = rate.getRatePerHour();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ratePerHour;
    }
}
