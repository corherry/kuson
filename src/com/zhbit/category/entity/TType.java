package com.zhbit.category.entity;

import java.util.HashSet;
import java.util.Set;

import com.zhbit.goods.entity.TGoods;

/**
 * TType entity. @author MyEclipse Persistence Tools
 */

public class TType implements java.io.Serializable {

	// Fields

	private Integer typeId;
	private String typeOne;
	private String typeTwo;
	private Set<TGoods> products = new HashSet<TGoods>();

	// Constructors

	/** default constructor */
	public TType() {
	}

	/** minimal constructor */
	public TType(Integer typeId, String typeOne, String typeTwo) {
		this.typeId = typeId;
		this.typeOne = typeOne;
		this.typeTwo = typeTwo;
	}

	/** full constructor */
	public TType(Integer typeId, String typeOne, String typeTwo, Set products) {
		this.typeId = typeId;
		this.typeOne = typeOne;
		this.typeTwo = typeTwo;
		this.setProducts(products);
	}

	// Property accessors

	public Integer getTypeId() {
		return this.typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getTypeOne() {
		return this.typeOne;
	}

	public void setTypeOne(String typeOne) {
		this.typeOne = typeOne;
	}

	public String getTypeTwo() {
		return this.typeTwo;
	}

	public void setTypeTwo(String typeTwo) {
		this.typeTwo = typeTwo;
	}

	public Set<TGoods> getProducts() {
		return products;
	}

	public void setProducts(Set<TGoods> products) {
		this.products = products;
	}


}