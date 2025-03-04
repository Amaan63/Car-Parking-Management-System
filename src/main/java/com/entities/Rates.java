package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "rates_of_parking")
public class Rates {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ratesId;

	@Column(name = "rate_per_hour", nullable = false)
	private long ratePerHour; // Stored in paise

	// Getters and Setters
	public Long getRatesId() {
		return ratesId;
	}

	public void setRatesId(Long ratesId) {
		this.ratesId = ratesId;
	}

	public long getRatePerHour() {
		return ratePerHour;
	}

	public void setRatePerHour(long ratePerHour) {
		this.ratePerHour = ratePerHour;
	}
}
