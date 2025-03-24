package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Payment;

public class PaymentDao {

	private SessionFactory factory;

	public PaymentDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	// Store payment when order is created
	public boolean storePayment(String email, long amount, String status, String vehicleNumber, String paymentDate,
			String parkingToken,String paymentId,String orderId) {
		Session session = this.factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			if (email == null) {
			    throw new RuntimeException("Payment email is null. Cannot proceed with database insertion.");
			}

			Payment payment = new Payment(email,amount, status,  paymentDate,vehicleNumber, parkingToken,paymentId,orderId);
			session.save(payment);

			transaction.commit();
			return true;
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return false;
		}
		
	}

	public Payment getPaymentByTokenOrVehicle(String token, String vehicleNumber) {
		Session session = this.factory.openSession();
		Payment payment = null;
        try {
            String queryStr = "from Payment where parkingToken = :token or vehicleNumber = :vehicleNumber";
            Query<Payment> query = session.createQuery(queryStr, Payment.class);
            query.setParameter("token", token);
            query.setParameter("vehicleNumber", vehicleNumber);
            payment = query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return payment;
    }
	
	
	public List<Payment> getPaymentsByEmail(String email) {
        List<Payment> payments = null;
        Session session = this.factory.openSession();
        Transaction transaction = null;
        try  {
            transaction = session.beginTransaction();

            String hql = "FROM Payment WHERE email = :email";
            Query<Payment> query = session.createQuery(hql, Payment.class);
            query.setParameter("email", email);
            
            payments = query.getResultList();

            transaction.commit();
        } catch (Exception e) {
           
            e.printStackTrace();
        }
        finally {
			session.clear();
			session.close();
		}
        return payments;
    }
	
	// Recent Activity for latest Payment fetching
	public Payment getLatestPaymentByEmail(String email) {
	    Session session = factory.openSession();
	    Payment latestPayment = null;
	    try {
	        latestPayment = session.createQuery("FROM Payment WHERE email = :email ORDER BY id DESC", Payment.class)
	                .setParameter("email", email)
	                .setMaxResults(1)
	                .uniqueResult();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }
	    return latestPayment;
	}

	
}
