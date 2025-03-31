package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

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

	// For Admin Panel
	public List<Feedback> getAllFeedback() {
		Session session = null;
		List<Feedback> feedbackList = null;
		try {
			session = factory.openSession();
			Query<Feedback> query = session.createQuery("FROM Feedback", Feedback.class);
			feedbackList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return feedbackList;
	}

}
