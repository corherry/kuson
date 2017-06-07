package com.zhbit.cart.dao;

import com.zhbit.cart.entity.Cart;
import com.zhbit.cart.entity.CartItem;

public interface CartItemDao {
	public Cart updateCartItem(CartItem cartItem, Cart cart);
}
