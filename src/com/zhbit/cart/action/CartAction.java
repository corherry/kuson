package com.zhbit.cart.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.InputStream;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.cart.entity.Cart;
import com.zhbit.cart.entity.CartItem;
import com.zhbit.cart.service.CartItemService;
import com.zhbit.goods.entity.TGoods;
import com.zhbit.goods.service.GoodsService;

public class CartAction extends ActionSupport {

	private static final long serialVersionUID = 9165427322371781332L;
	protected InputStream inputStream;
	@Resource
	private GoodsService goodsService;
	@Resource
	private CartItemService cartItemService;
	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Integer getQuantity() {
		return quantity;
	}

	// 接收商品pid
	private Integer pid;

	// 接收商品数量
	private Integer quantity;

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	private HttpServletRequest request = ServletActionContext.getRequest();

	/**
	 * 从session 中获取购物车
	 */
	public Cart getCart(HttpServletRequest request) {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if (cart == null) {
			// 创建购物车
			cart = new Cart();
			// 将购物车对象放进session
			request.getSession().setAttribute("cart", cart);
		}
		return cart;

	}

	/**
	 * 添加购物项到购物车
	 * 
	 * @return
	 */

	public String addCart() {
		// 查询商品
		TGoods product = goodsService.findByGoodsId(pid);
		// 创建购物项
		CartItem cartItem = new CartItem();
		cartItem.setProduct(product);
		cartItem.setCount(quantity);
		// 获取购物车对象
		Cart cart = getCart(request);
		// 将购物项添加到购物车
		cart.aadCartItem(cartItem);
		return "lookCart";

	}
	public String updateCart()throws Exception{
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		TGoods product = goodsService.findByGoodsId(pid);
		CartItem cartItem = new CartItem();
		cartItem.setProduct(product);
		if(quantity <= product.getGoodsAmount())
			cartItem.setCount(quantity);
		else {
			cartItem.setCount(product.getGoodsAmount());
		}
		cartItem.setSubtotal(cartItem.getSubtotal());
		cart = cartItemService.updateCartItem(cartItem, cart);
		//计算新的总价格
		request.getSession().setAttribute("cart", cart);
		//以流的形式返回新的总价格
		inputStream = new ByteArrayInputStream(cart.getTotal().toString().getBytes());
		return "stream";
	}

	/**
	 * 清空购物车
	 */
	public String clearCart() {
		Cart cart = getCart(request);
		cart.clearCartItem();
		return "lookCart";
	}

	/**
	 * 从购物车中移除
	 */
	public String romoveCart() {
		Cart cart = getCart(request);
		cart.removeCartItem(pid);
		return "lookCart";
	}

	/**
	 * 查看购物车
	 */
	public String lookCart() {
		return "lookCart";
	}
	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

}
