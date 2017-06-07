package com.zhbit.order.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;
import com.zhbit.user.entity.TEmailuser;
/**
 * TOrder entity. @author MyEclipse Persistence Tools
 */

public class TOrder implements java.io.Serializable {

	// Fields

	private Integer orderId;
	private TEmailuser emailuser;
	private String orderNo;
	private Integer status;
	private Timestamp orderTime;
	private Double total;
	private String address;
	private String phone;
	private String receiver;
	private String postcode;
	private Set<TOrderItem> orderItems = new HashSet<TOrderItem>();

	// Constructors

	/** default constructor */
	public TOrder() {
	}

	/** minimal constructor */
	public TOrder(Integer orderId, TEmailuser TEmailuser, String orderNo, Timestamp orderTime, Double total,
			String address, String phone, String receiver, String postcode) {
		this.orderId = orderId;
		this.setEmailuser(TEmailuser);
		this.orderNo = orderNo;
		this.orderTime = orderTime;
		this.total = total;
		this.address = address;
		this.phone = phone;
		this.receiver = receiver;
		this.postcode = postcode;
	}

	/** full constructor */
	public TOrder(Integer orderId, TEmailuser TEmailuser, String orderNo, Integer status, Timestamp orderTime,
			Double total, String address, String phone, String receiver, String postcode, Set TOrderItems) {
		this.orderId = orderId;
		this.setEmailuser(TEmailuser);
		this.orderNo = orderNo;
		this.status = status;
		this.orderTime = orderTime;
		this.total = total;
		this.address = address;
		this.phone = phone;
		this.receiver = receiver;
		this.postcode = postcode;
		this.setOrderItems(TOrderItems);
	}

	// Property accessors

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getOrderNo() {
		return this.orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Timestamp getOrderTime() {
		return this.orderTime;
	}

	public void setOrderTime(Timestamp orderTime) {
		this.orderTime = orderTime;
	}

	public Double getTotal() {
		return this.total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getReceiver() {
		return this.receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getPostcode() {
		return this.postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public Set<TOrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(Set<TOrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	public TEmailuser getEmailuser() {
		return emailuser;
	}

	public void setEmailuser(TEmailuser emailuser) {
		this.emailuser = emailuser;
	}



}