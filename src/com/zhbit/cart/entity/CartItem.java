package com.zhbit.cart.entity;

import com.zhbit.goods.entity.TGoods;

/**
 * @Title:CartItem
 * @Description:购物项实体
 * @author:Rainbow.huahang.com
 * @date:2016年10月17日 下午2:08:02
 */
public class CartItem {
	// 购物项实体
	private TGoods product;
	// 小计数量
	private Integer count;
	// 总结金额
	private Double subtotal;

	public Double getSubtotal() {
		return count * product.getGoodsPrice();
	}
	public TGoods getProduct() {
		return product;
	}

	public void setProduct(TGoods product) {
		this.product = product;
	}

	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

}
