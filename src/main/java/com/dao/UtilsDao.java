package com.dao;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.hibernate.SessionFactory;

public class UtilsDao {

	private SessionFactory factory;

	public String getTimeElapsed(String bookingDateStr, String timeDurationStr) {
		if (bookingDateStr == null || timeDurationStr == null || bookingDateStr.isEmpty()
				|| timeDurationStr.isEmpty()) {
			return "Invalid data";
		}

		try {
			// Use LocalDate instead of LocalDateTime
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate bookingDate = LocalDate.parse(bookingDateStr, formatter);

			// Extract hours from "X hours" format
			int durationHours = Integer.parseInt(timeDurationStr.replaceAll("[^0-9]", ""));

			// Convert LocalDate to LocalDateTime (Assume start of day)
			LocalDateTime bookingTime = bookingDate.atStartOfDay().plusHours(durationHours);

			// Calculate elapsed time
			LocalDateTime now = LocalDateTime.now();
			Duration duration = Duration.between(bookingTime, now);

			long days = duration.toDays();
			long hours = duration.toHours() % 24;

			if (days > 0) {
				return days + " days " + hours + " hours ago";
			} else {
				return hours + " hours ago";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "Error in processing date";
		}
	}

}
