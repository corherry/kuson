package com.zhbit.order.entity;
import com.zhbit.goods.entity.TGoods;
/**
 * TOrderDetail entity. @author MyEclipse Persistence Tools
 */

public class TOrderDetail implements java.io.Serializable {

	// Fields

	private Integer orderDetailId;
	private Integer quantity;
	private TOrder TOrder;
	private TGoods TGoods;

	// Constructors

	/** default constructor */
	public TOrderDetail() {
	}

	/** minimal constructor */
	public TOrderDetail(Integer orderDetailId, TOrder TOrder, TGoods TGoods) {
		this.orderDetailId = orderDetailId;
		this.TOrder = TOrder;
		this.TGoods = TGoods;
	}

	/** full constructor */
	public TOrderDetail(Integer orderDetailId, TOrder TOrder, TGoods TGoods, Integer quantity) {
		this.orderDetailId = orderDetailId;
		this.TOrder = TOrder;
		this.TGoods = TGoods;
		this.quantity = quantity;
	}

	// Property accessors

	public Integer getOrderDetailId() {
		return this.orderDetailId;
	}

	public void setOrderDetailId(Integer orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public TOrder getTOrder() {
		return this.TOrder;
	}

	public void setTOrder(TOrder TOrder) {
		this.TOrder = TOrder;
	}

	public TGoods getTGoods() {
		return this.TGoods;
	}

	public void setTGoods(TGoods TGoods) {
		this.TGoods = TGoods;
	}

	public Integer getQuantity() {
		return this.quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

}