package com.zhbit.goods.entity;

import java.util.HashSet;
import java.util.Set;

import com.zhbit.order.entity.TOrder;

/**
 * TGoods entity. @author MyEclipse Persistence Tools
 */

public class TGoods implements java.io.Serializable {

	// Fields

	private Integer goodsId;
	private String goodsNo;
	private String goodsTitle;
	private String goodsSize;
	private String goodsColor;
	private Integer goodsAmount;
	private String goodsDescription;
	private String goodsPicUrl;
	private Double goodsPrice;
	private TType TType;
	private Set<TOrder> orders = new HashSet<TOrder>();
	private Set<TEvaluation> TEvaluations = new HashSet<TEvaluation>();

	// Constructors

	/** default constructor */
	public TGoods() {
	}

	/** minimal constructor */
	public TGoods(Integer goodsId, TType TType, String goodsNo, String goodsTitle, String goodsSize, String goodsColor,
			Double goodsPrice) {
		this.goodsId = goodsId;
		this.TType = TType;
		this.goodsNo = goodsNo;
		this.goodsTitle = goodsTitle;
		this.goodsSize = goodsSize;
		this.goodsColor = goodsColor;
		this.goodsPrice = goodsPrice;
	}

	/** full constructor */
	public TGoods(Integer goodsId, TType TType, String goodsNo, String goodsTitle, String goodsSize, String goodsColor,
			Integer goodsAmount, String goodsDescription, String goodsPicUrl, Double goodsPrice, Set orders,
			Set TEvaluations) {
		this.goodsId = goodsId;
		this.TType = TType;
		this.goodsNo = goodsNo;
		this.goodsTitle = goodsTitle;
		this.goodsSize = goodsSize;
		this.goodsColor = goodsColor;
		this.goodsAmount = goodsAmount;
		this.goodsDescription = goodsDescription;
		this.goodsPicUrl = goodsPicUrl;
		this.goodsPrice = goodsPrice;
		this.orders = orders;
		this.TEvaluations = TEvaluations;
	}

	// Property accessors

	public Integer getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public TType getTType() {
		return this.TType;
	}

	public void setTType(TType TType) {
		this.TType = TType;
	}

	public String getGoodsNo() {
		return this.goodsNo;
	}

	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}

	public String getGoodsTitle() {
		return this.goodsTitle;
	}

	public void setGoodsTitle(String goodsTitle) {
		this.goodsTitle = goodsTitle;
	}

	public String getGoodsSize() {
		return this.goodsSize;
	}

	public void setGoodsSize(String goodsSize) {
		this.goodsSize = goodsSize;
	}

	public String getGoodsColor() {
		return this.goodsColor;
	}

	public void setGoodsColor(String goodsColor) {
		this.goodsColor = goodsColor;
	}

	public Integer getGoodsAmount() {
		return this.goodsAmount;
	}

	public void setGoodsAmount(Integer goodsAmount) {
		this.goodsAmount = goodsAmount;
	}

	public String getGoodsDescription() {
		return this.goodsDescription;
	}

	public void setGoodsDescription(String goodsDescription) {
		this.goodsDescription = goodsDescription;
	}

	public String getGoodsPicUrl() {
		return this.goodsPicUrl;
	}

	public void setGoodsPicUrl(String goodsPicUrl) {
		this.goodsPicUrl = goodsPicUrl;
	}

	public Double getGoodsPrice() {
		return this.goodsPrice;
	}

	public void setGoodsPrice(Double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}


	public Set getTEvaluations() {
		return this.TEvaluations;
	}

	public void setTEvaluations(Set TEvaluations) {
		this.TEvaluations = TEvaluations;
	}

	public Set<TOrder> getOrders() {
		return orders;
	}

	public void setOrders(Set<TOrder> orders) {
		this.orders = orders;
	}

}