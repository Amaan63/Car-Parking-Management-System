package com.utils;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class TimeUtils {
	// Method for booking duration calculation (date format: yyyy-MM-dd)
	public String getTimeElapsed(String bookingDateStr, String timeDurationStr) {
		if (bookingDateStr == null || timeDurationStr == null || bookingDateStr.isEmpty()
				|| timeDurationStr.isEmpty()) {
			return "Invalid data";
		}

		try {
			// Parse date-only format (yyyy-MM-dd)
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate bookingDate = LocalDate.parse(bookingDateStr, formatter);

			// Extract hours from "X hours" format
			int durationHours = Integer.parseInt(timeDurationStr.replaceAll("[^0-9]", ""));

			// Convert LocalDate to LocalDateTime (start of the day + duration)
			LocalDateTime bookingTime = bookingDate.atStartOfDay().plusHours(durationHours);

			// Convert booking time to system default timezone
			ZonedDateTime bookingZoned = bookingTime.atZone(ZoneId.of("UTC"))
					.withZoneSameInstant(ZoneId.systemDefault());

			// Current time in system default timezone
			ZonedDateTime now = ZonedDateTime.now(ZoneId.systemDefault());

			// Calculate elapsed time
			long days = ChronoUnit.DAYS.between(bookingZoned, now);
			long hours = ChronoUnit.HOURS.between(bookingZoned, now) % 24;

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

	// Method for payment calculation (date-time format: yyyy-MM-dd HH:mm:ss)
	public String getTimeElapsedWithTime(String dateTimeStr) {
		if (dateTimeStr == null || dateTimeStr.isEmpty()) {
			return "Invalid data";
		}

		try {
			// Parse date-time format (yyyy-MM-dd HH:mm:ss)
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime paymentTime = LocalDateTime.parse(dateTimeStr, formatter);

			// Convert payment time to system default timezone
			ZonedDateTime paymentZoned = paymentTime.atZone(ZoneId.of("UTC"))
					.withZoneSameInstant(ZoneId.systemDefault());

			// Current time in system default timezone
			ZonedDateTime now = ZonedDateTime.now(ZoneId.systemDefault());

			// Calculate elapsed time
			long days = ChronoUnit.DAYS.between(paymentZoned, now);
			long hours = ChronoUnit.HOURS.between(paymentZoned, now) % 24;
			long minutes = ChronoUnit.MINUTES.between(paymentZoned, now) % 60;

			if (days > 0) {
				return days + " days " + hours + " hours ago";
			} else if (hours > 0) {
				return hours + " hours " + minutes + " minutes ago";
			} else {
				return minutes + " minutes ago";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "Error in processing date";
		}
	}
}
