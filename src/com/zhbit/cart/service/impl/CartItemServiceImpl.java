package com.zhbit.cart.service.impl;

import javax.annotation.Resource;

import com.zhbit.cart.dao.CartItemDao;
import com.zhbit.cart.entity.Cart;
import com.zhbit.cart.entity.CartItem;
import com.zhbit.cart.service.CartItemService;

public class CartItemServiceImpl implements CartItemService {
	@Resource
	private CartItemDao cartItemDao;
	@Override
	public Cart updateCartItem(CartItem cartItem, Cart cart) {
		double total = 0.00;
		for(CartItem temp : cart.getCartItems()) {
			if(temp.getProduct().getGoodsId().equals(cartItem.getProduct().getGoodsId())) {
				temp.setCount(cartItem.getCount());
			}
			total += temp.getProduct().getGoodsPrice() * temp.getCount();
		}
		cart.setTotal(total);
		return cart;
	}

}
