package com.zhbit.order.entity;

import com.zhbit.goods.entity.TGoods;
/**
 * TOrderItem entity. @author MyEclipse Persistence Tools
 */

public class TOrderItem implements java.io.Serializable {

	// Fields

	private Integer orderItemId;
	private TOrder order;
	private TGoods product;
	private Integer quantity;
	private Double subtotal;

	// Constructors

	/** default constructor */
	public TOrderItem() {
	}

	public Integer getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(Integer orderItemId) {
		this.orderItemId = orderItemId;
	}

	public TOrder getOrder() {
		return order;
	}

	public void setOrder(TOrder order) {
		this.order = order;
	}

	public TGoods getProduct() {
		return product;
	}

	public void setProduct(TGoods product) {
		this.product = product;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}

	/** full constructor */
	
	

}