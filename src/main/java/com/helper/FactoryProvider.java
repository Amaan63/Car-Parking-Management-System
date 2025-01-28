package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	private static SessionFactory factory;

	public static SessionFactory getFactory() {
		try {
			if (factory == null) {
				factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error: Unable to create SessionFactory.");
		}
		return factory;
	}

	public static void closeFactory() {
		if (factory != null && !factory.isClosed()) {
			factory.close(); // Close the SessionFactory if it's not already closed
		}
	}
}
