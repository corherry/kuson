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

	// ������Ʒpid
	private Integer pid;

	// ������Ʒ����
	private Integer quantity;

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	private HttpServletRequest request = ServletActionContext.getRequest();

	/**
	 * ��session �л�ȡ���ﳵ
	 */
	public Cart getCart(HttpServletRequest request) {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if (cart == null) {
			// �������ﳵ
			cart = new Cart();
			// �����ﳵ����Ž�session
			request.getSession().setAttribute("cart", cart);
		}
		return cart;

	}

	/**
	 * ��ӹ�������ﳵ
	 * 
	 * @return
	 */

	public String addCart() {
		// ��ѯ��Ʒ
		TGoods product = goodsService.findByGoodsId(pid);
		// ����������
		CartItem cartItem = new CartItem();
		cartItem.setProduct(product);
		cartItem.setCount(quantity);
		// ��ȡ���ﳵ����
		Cart cart = getCart(request);
		// ����������ӵ����ﳵ
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
		//�����µ��ܼ۸�
		request.getSession().setAttribute("cart", cart);
		//��������ʽ�����µ��ܼ۸�
		inputStream = new ByteArrayInputStream(cart.getTotal().toString().getBytes());
		return "stream";
	}

	/**
	 * ��չ��ﳵ
	 */
	public String clearCart() {
		Cart cart = getCart(request);
		cart.clearCartItem();
		return "lookCart";
	}

	/**
	 * �ӹ��ﳵ���Ƴ�
	 */
	public String romoveCart() {
		Cart cart = getCart(request);
		cart.removeCartItem(pid);
		return "lookCart";
	}

	/**
	 * �鿴���ﳵ
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
