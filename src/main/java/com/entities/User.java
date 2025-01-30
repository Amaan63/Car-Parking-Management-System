package com.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;


@Entity

public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 10, name = "user_id")
	private int userId;

	@Column(length = 100, name = "user_name")
	private String userFullName;

	@Column(length = 100, name = "user_email")
	private String userEmail;

	@Column(length = 100, name = "user_password")
	private String userPassword;

	@Column(length = 2500, name = "user_address")
	private String userAddress;

	@Column(length = 12, name = "user_phoneNumber")
	private String userPhoneNumber;

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Vehicle> vehicles;

	// Constructors, getters, and setters
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int userId, String userFullName, String userEmail, String userPassword, String userAddress,
			String userPhoneNumber, List<Vehicle> vehicles) {
		super();
		this.userId = userId;
		this.userFullName = userFullName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userAddress = userAddress;
		this.userPhoneNumber = userPhoneNumber;
		this.vehicles = vehicles;
	}

	public User(String userFullName, String userEmail, String userPassword, String userAddress,
			String userPhoneNumber) {
		super();
		this.userFullName = userFullName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userAddress = userAddress;
		this.userPhoneNumber = userPhoneNumber;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserFullName() {
		return userFullName;
	}

	public void setUserFullName(String userFullName) {
		this.userFullName = userFullName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}

	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}

	public List<Vehicle> getVehicles() {
		return vehicles;
	}

	public void setVehicles(List<Vehicle> vehicles) {
		this.vehicles = vehicles;
	}

}
