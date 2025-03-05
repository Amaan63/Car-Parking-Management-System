package com.dao;

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
			String parkingToken,String paymentId) {
		Session session = this.factory.openSession();
		Transaction transaction = null;
		System.out.println("Dao Start Here");
		try {
			transaction = session.beginTransaction();
			if (email == null) {
			    throw new RuntimeException("Payment email is null. Cannot proceed with database insertion.");
			}

			Payment payment = new Payment(email,amount, status,  paymentDate,vehicleNumber, parkingToken,paymentId);
			session.save(payment);

			transaction.commit();
			System.out.println("Dao End Here syccessfully ");
			return true;
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			System.out.println("Dao End Here Failed ");
			return false;
		}
		
	}

	// Update payment status after verification
//	public  boolean updatePaymentStatus(String orderId, String status, String razorpayPaymentId) {
//		Session session = this.factory.openSession();
//		Transaction transaction = null;
//		
//		try  {
//			transaction = session.beginTransaction();
//			System.out.println("Dao Begins Here");
//			Payment payment = session.createQuery("FROM Payment WHERE orderId = :orderId", Payment.class)
//					.setParameter("orderId", orderId).uniqueResult();
//			System.out.println("Matching Order Id");
//			if (payment != null) {
//				System.out.println("Order id Matched");
//				payment.setStatus(status);
//				payment.setRazorpayPaymentId(razorpayPaymentId); // Store Razorpay Payment ID
//				System.out.println("Saving Payment");
//				session.saveOrUpdate(payment);
//				transaction.commit();
//				System.out.println("Saved Payment");
//				return true;
//			}
//		} catch (Exception e) {
//			if (transaction != null)
//				transaction.rollback();
//			System.out.println("Wrong in Dao");
//			e.printStackTrace();
//		}
//		return false;
//	}
	
}
