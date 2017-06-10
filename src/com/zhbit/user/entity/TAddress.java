package com.zhbit.user.entity;

/**
 * TAddress entity. @author MyEclipse Persistence Tools
 */

public class TAddress implements java.io.Serializable {

	// Fields

	private Integer addressId;
	private TEmailuser user;
	private String receiver;
	private String phone;
	private String address;

	// Constructors

	/** default constructor */
	public TAddress() {
	}


	public Integer getAddressId() {
		return this.addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public String getReceiver() {
		return this.receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public TEmailuser getUser() {
		return user;
	}

	public void setUser(TEmailuser user) {
		this.user = user;
	}

}