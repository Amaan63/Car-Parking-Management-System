package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Feedback;

public class FeedbackDao {

	private SessionFactory factory;

	public FeedbackDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public boolean saveFeedback(Feedback feedback) {
		Session session = this.factory.openSession();
		Transaction transaction = null;
		try {
			session = factory.openSession();
			transaction = session.beginTransaction();

			// If suggestion is blank, set it to "N/A"
			if (feedback.getSuggestion() == null || feedback.getSuggestion().trim().isEmpty()) {
				feedback.setSuggestion("No suggestion provided");
			}

			session.save(feedback);
			transaction.commit();
			return true; // Success
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
			return false; // Failure
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

}
