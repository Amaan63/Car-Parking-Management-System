package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "payments")
public class Payment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "order_id", unique = true)
	private String orderId; // To store the actual order ID from Razorpay
	
	@Column(name = "razorpay_payment_id", unique = true)
	private String razorpayPaymentId; // To store the actual payment ID from Razorpay

	@Column(name = "amount")
	private long amount;

	@Column(name="email")
	private String email;

	@Column(name = "status")
	private String status; // PENDING, SUCCESS, FAILED

	@Column(name = "payment_date")
	private String paymentDate;

	@Column(name = "vehicle_number")
	private String vehicleNumber;
	
	@Column(name = "parking_token")
	private String parkingToken;

	// Constructors
	public Payment() {
	}

	public Payment(String email,long amount, String status, String paymentDate, String vehicleNumber, String parkingToken,String paymentId,String orderId) {
		super();
		this.email=email;
		this.amount = amount;
		this.status = status;
		this.paymentDate = paymentDate;
		this.vehicleNumber = vehicleNumber;
		this.parkingToken = parkingToken;
		this.razorpayPaymentId = paymentId;
		this.orderId = orderId;
	}

	
	

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getParkingToken() {
		return parkingToken;
	}



	public void setParkingToken(String parkingToken) {
		this.parkingToken = parkingToken;
	}



	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}


	public String getRazorpayPaymentId() {
		return razorpayPaymentId;
	}

	public void setRazorpayPaymentId(String razorpayPaymentId) {
		this.razorpayPaymentId = razorpayPaymentId;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getVehicleNumber() {
		return vehicleNumber;
	}

	public void setVehicleNumber(String vehicleNumber) {
		this.vehicleNumber = vehicleNumber;
	}

}
