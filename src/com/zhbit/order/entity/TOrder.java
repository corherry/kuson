package com.zhbit.order.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;
import com.zhbit.user.entity.TEmailuser;
import com.zhbit.goods.entity.TGoods;
import com.zhbit.user.entity.TAddress;

/**
 * TOrder entity. @author MyEclipse Persistence Tools
 */

public class TOrder implements java.io.Serializable {

	// Fields

	private Integer orderId;
	private String orderNo;
	private Integer status;
	private Timestamp orderTime;
	private TAddress TAddress;
	private TEmailuser TEmailuser;
	private Set<TGoods> goods = new HashSet<TGoods>();

	// Constructors

	/** default constructor */
	public TOrder() {
	}

	/** minimal constructor */
	public TOrder(Integer orderId, TAddress TAddress, TEmailuser TEmailuser, String orderNo, Timestamp orderTime) {
		this.orderId = orderId;
		this.TAddress = TAddress;
		this.TEmailuser = TEmailuser;
		this.orderNo = orderNo;
		this.orderTime = orderTime;
	}

	/** full constructor */
	public TOrder(Integer orderId, TAddress TAddress, TEmailuser TEmailuser, String orderNo, Integer status,
			Timestamp orderTime, Set goods) {
		this.orderId = orderId;
		this.TAddress = TAddress;
		this.TEmailuser = TEmailuser;
		this.orderNo = orderNo;
		this.status = status;
		this.orderTime = orderTime;
		this.setGoods(goods);
	}

	// Property accessors

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public TAddress getTAddress() {
		return this.TAddress;
	}

	public void setTAddress(TAddress TAddress) {
		this.TAddress = TAddress;
	}

	public TEmailuser getTEmailuser() {
		return this.TEmailuser;
	}

	public void setTEmailuser(TEmailuser TEmailuser) {
		this.TEmailuser = TEmailuser;
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

	public Set<TGoods> getGoods() {
		return goods;
	}

	public void setGoods(Set<TGoods> goods) {
		this.goods = goods;
	}


}