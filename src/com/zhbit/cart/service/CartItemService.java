package com.zhbit.cart.service;

import com.zhbit.cart.entity.Cart;
import com.zhbit.cart.entity.CartItem;

public interface CartItemService {
	public Cart updateCartItem(CartItem cartItem, Cart cart);
}
