package com.entities;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;

@Entity
@Table(name = "vehicleBooking")
public class Vehicle {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int vehicleId;

	@Column(length = 100, name = "user_name")
	private String userName;

	public Slot getSlot() {
		return slot;
	}

	public void setSlot(Slot slot) {
		this.slot = slot;
	}

	@Column(length = 100, name = "user_email")
	private String userEmailId;

	@Column(length = 100, name = "vehicle_company")
	private String vehicleCompany;

	@Column(length = 1000, name = "vehicle_name")
	private String vehicleName;

	@Column(length = 1000, name = "vehicle_numberplate")
	private String vehicleNumberPlate;

	@Column(length = 100, name = "vehicle_vehicletype")
	private String vehicleType;

	@Column(length = 1000, name = "booking_date")
	private String BookingDate;

	@Column(length = 1000, name = "time_duration")
	private String timeDuration;

	@Column(length = 20, name = "parking_tokenNumber")
	private String parkingTokennumber;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;
	
	@OneToOne
	@JoinColumn(name = "slot_id", referencedColumnName = "slotId", unique = true)
	private Slot slot;
	
	
	public Vehicle() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Vehicle(int vehicleId, String userName, String userEmailId, String vehicleCompany, String vehicleName,
			String vehicleNumberPlate, String vehicleType, String bookingDate, String timeDuration,
			String parkingTokennumber, User user) {
		super();
		this.vehicleId = vehicleId;
		this.userName = userName;
		this.userEmailId = userEmailId;
		this.vehicleCompany = vehicleCompany;
		this.vehicleName = vehicleName;
		this.vehicleNumberPlate = vehicleNumberPlate;
		this.vehicleType = vehicleType;
		BookingDate = bookingDate;
		this.timeDuration = timeDuration;
		this.parkingTokennumber = parkingTokennumber;
		this.user = user;
	}

	public Vehicle(String userName, String userEmailId, String vehicleCompany, String vehicleName,
			String vehicleNumberPlate, String vehicleType, String bookingDate, String timeDuration) {
		super();
		this.userName = userName;
		this.userEmailId = userEmailId;
		this.vehicleCompany = vehicleCompany;
		this.vehicleName = vehicleName;
		this.vehicleNumberPlate = vehicleNumberPlate;
		this.vehicleType = vehicleType;
		BookingDate = bookingDate;
		this.timeDuration = timeDuration;
	}
	
	
	

	public int getVehicleId() {
		return vehicleId;
	}

	public void setVehicleId(int vehicleId) {
		this.vehicleId = vehicleId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmailId() {
		return userEmailId;
	}

	public void setUserEmailId(String userEmailId) {
		this.userEmailId = userEmailId;
	}

	public String getVehicleCompany() {
		return vehicleCompany;
	}

	public void setVehicleCompany(String vehicleCompany) {
		this.vehicleCompany = vehicleCompany;
	}

	public String getVehicleName() {
		return vehicleName;
	}

	public void setVehicleName(String vehicleName) {
		this.vehicleName = vehicleName;
	}

	public String getVehicleNumberPlate() {
		return vehicleNumberPlate;
	}

	public void setVehicleNumberPlate(String vehicleNumberPlate) {
		this.vehicleNumberPlate = vehicleNumberPlate;
	}

	public String getVehicleType() {
		return vehicleType;
	}

	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}

	public String getBookingDate() {
		return BookingDate;
	}

	public void setBookingDate(String bookingDate) {
		BookingDate = bookingDate;
	}

	public String getTimeDuration() {
		return timeDuration;
	}

	public void setTimeDuration(String timeDuration) {
		this.timeDuration = timeDuration;
	}

	public String getParkingTokennumber() {
		return parkingTokennumber;
	}

	public void setParkingTokennumber(String parkingTokennumber) {
		this.parkingTokennumber = parkingTokennumber;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	// Generate the token before Saving the entity in to DB
	@PrePersist // this annotation is used to genrate the token before saving the data to
				// database
	public void generateParkingToken() {
		this.parkingTokennumber = UUID.randomUUID().toString().replace("-", "").substring(0, 8).toUpperCase();
	}

}
