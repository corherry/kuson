package com.zhbit.cart.entity;

import com.zhbit.goods.entity.TGoods;

/**
 * @Title:CartItem
 * @Description:������ʵ��
 * @author:Rainbow.huahang.com
 * @date:2016��10��17�� ����2:08:02
 */
public class CartItem {
	// ������ʵ��
	private TGoods product;
	// С������
	private Integer count;
	// �ܽ���
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
