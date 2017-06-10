package com.zhbit.order.action;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.jboss.cache.StringFqn;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.cart.entity.CartItem;
import com.zhbit.goods.service.GoodsService;
import com.zhbit.cart.entity.Cart;
import com.zhbit.order.entity.TOrder;
import com.zhbit.order.entity.TOrderItem;
import com.zhbit.order.service.OrderService;
import com.zhbit.user.entity.TEmailuser;
import com.zhbit.user.service.UserService;
import com.zhbit.util.MD5Util;
import com.zhbit.util.PageBean;

public class OrderAction extends ActionSupport {
	@Resource
	private OrderService orderService;
	@Resource
	private GoodsService goodsService;
	@Resource
	private UserService userService;
	private String password;
	private Integer status;
	private Integer pageIndex;
	private Integer orderId;
	private Double total;
	private String address;
	private String phone;
	private String receiver;
	private String receive;
	public String findOrderByStatus() throws Exception{
		PageBean<TOrder> pageBean = orderService.findOrderByStatus(status, pageIndex);
		ActionContext.getContext().put("pageBean",pageBean);
		return "show";
	}
	public String findOrderByUid() throws Exception{
		TEmailuser user = (TEmailuser)ActionContext.getContext().getSession().get("user");
		PageBean<TOrder> pageBean = orderService.findOrderByUid(user.getUserId(), pageIndex);
		ActionContext.getContext().getSession().put("pageBean",pageBean);
		return "orderlist";
	}
	public String changeStatus() throws Exception{
		TOrder order = orderService.findOrderByOid(orderId);
		order.setStatus(status);
		orderService.update(order);
		return findOrderByStatus();
	}
	public String cancelOrder() throws Exception{
		TOrder order = orderService.findOrderByOid(orderId);
		order.setStatus(-1);
		orderService.update(order);
		return "cancel";
	}
	public String addOrder() throws Exception{
		TEmailuser user = (TEmailuser)ActionContext.getContext().getSession().get("user");
		Cart cart = (Cart)ActionContext.getContext().getSession().get("cart");
		int uuid = UUID.randomUUID().hashCode();
		if(uuid < 0)
			uuid = -uuid;
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		String orderNo = df.format(date).toString() + uuid;
		TOrder order = new TOrder();
		order.setOrderNo(orderNo);
		order.setAddress(address);
		String arr[] = receive.split(" ");
		order.setReceiver(arr[0]);
		order.setPhone(arr[1]);
		order.setTotal(cart.getTotal());
		order.setEmailuser(user);
		order.setOrderTime(new Timestamp((new Date()).getTime()));
		order.setStatus(0);
		for (CartItem cartItem : cart.getCartItems()) {
			TOrderItem orderItem = new TOrderItem();
			orderItem.setQuantity(cartItem.getCount());
			orderItem.setSubtotal(cartItem.getSubtotal());
			orderItem.setProduct(cartItem.getProduct());
			cartItem.getProduct().setGoodsAmount(cartItem.getProduct().getGoodsAmount() - cartItem.getCount());
			goodsService.update(cartItem.getProduct());
			orderItem.setOrder(order);
			order.getOrderItems().add(orderItem);
		}
		orderService.addOrder(order);
		ActionContext.getContext().getSession().put("order", order);
		ActionContext.getContext().getSession().put("address", address);
		ActionContext.getContext().getSession().put("receive", receive);
		ActionContext.getContext().getSession().remove("cart");
		return "add";
	}
	public String payOrder() throws Exception{
		TEmailuser user = (TEmailuser)ActionContext.getContext().getSession().get("user");
		TOrder order = orderService.findOrderByOid(orderId);
		if(MD5Util.encode2hex(password).equals(user.getPassword()) == true){
			if(user.getMoney() >= order.getTotal()){
				System.out.println(order.getTotal());
				user.setMoney(user.getMoney() - order.getTotal());
				userService.updateEmailUser(user);
				order.setStatus(1);
				orderService.update(order);
				ActionContext.getContext().getSession().put("user", user);
				ActionContext.getContext().getSession().put("successMessage", "¹§Ï²Äú!Ö§¸¶³É¹¦!");
				ActionContext.getContext().getSession().remove("payMessage");
			}else{
				ActionContext.getContext().getSession().put("payMessage", "Óà¶î²»×ã!");
				ActionContext.getContext().getSession().remove("successMessage");
			}
		}else{
			ActionContext.getContext().getSession().put("payMessage", "ÃÜÂë´íÎó!");
			ActionContext.getContext().getSession().remove("successMessage");
		}
		return "pay";
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getReceive() {
		return receive;
	}
	public void setReceive(String receive) {
		this.receive = receive;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
