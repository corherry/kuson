package com.zhbit.cart.dao.impl;

import com.zhbit.cart.dao.CartItemDao;
import com.zhbit.cart.entity.Cart;
import com.zhbit.cart.entity.CartItem;

public class CartItemDaoImpl implements CartItemDao {

	@Override
	public Cart updateCartItem(CartItem cartItem, Cart cart) {
		for(CartItem temp : cart.getCartItems()) {
			if(temp.getProduct().getGoodsId().equals(cartItem.getProduct().getGoodsId())) {
				temp.setCount(cartItem.getCount());
			}
		}
		return cart;
	}

}
