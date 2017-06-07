package com.zhbit.order.action;

import java.util.List;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.order.entity.TOrder;
import com.zhbit.order.service.OrderService;
import com.zhbit.util.PageBean;

public class OrderAction extends ActionSupport {
	@Resource
	private OrderService orderService;
	private Integer status;
	private Integer pageIndex;
	private Integer orderId;
	public String findOrderByStatus() throws Exception{
		PageBean<TOrder> pageBean = orderService.findOrderByStatus(status, pageIndex);
		ActionContext.getContext().put("pageBean",pageBean);
		return "show";
	}
	public String changeStatus() throws Exception{
		TOrder order = orderService.findOrderByOid(orderId);
		order.setStatus(status);
		orderService.update(order);
		return findOrderByStatus();
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
}
