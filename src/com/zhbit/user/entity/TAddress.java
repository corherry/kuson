package com.zhbit.user.entity;

import java.util.HashSet;
import java.util.Set;

import com.zhbit.order.entity.TOrder;

/**
 * TAddress entity. @author MyEclipse Persistence Tools
 */

public class TAddress implements java.io.Serializable {

	// Fields

	private Integer addressId;
	private String receiver;
	private String phone;
	private String address;
	private String postcode;
	private TEmailuser TEmailuser;
	private Set<TOrder> TOrders = new HashSet<TOrder>();

	// Constructors

	/** default constructor */
	public TAddress() {
	}

	/** minimal constructor */
	public TAddress(Integer addressId, TEmailuser TEmailuser, String receiver, String phone, String address,
			String postcode) {
		this.addressId = addressId;
		this.TEmailuser = TEmailuser;
		this.receiver = receiver;
		this.phone = phone;
		this.address = address;
		this.postcode = postcode;
	}

	/** full constructor */
	public TAddress(Integer addressId, TEmailuser TEmailuser, String receiver, String phone, String address,
			String postcode, Set TOrders) {
		this.addressId = addressId;
		this.TEmailuser = TEmailuser;
		this.receiver = receiver;
		this.phone = phone;
		this.address = address;
		this.postcode = postcode;
		this.TOrders = TOrders;
	}

	// Property accessors

	public Integer getAddressId() {
		return this.addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public TEmailuser getTEmailuser() {
		return this.TEmailuser;
	}

	public void setTEmailuser(TEmailuser TEmailuser) {
		this.TEmailuser = TEmailuser;
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

	public String getPostcode() {
		return this.postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public Set getTOrders() {
		return this.TOrders;
	}

	public void setTOrders(Set TOrders) {
		this.TOrders = TOrders;
	}

}