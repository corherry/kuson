package com.zhbit.order.service;

import java.util.List;

import org.hibernate.sql.Update;

import com.zhbit.order.entity.TOrder;
import com.zhbit.util.PageBean;

public interface OrderService {
	public PageBean<TOrder> findOrderByStatus(Integer status, Integer pageIndex);
	public TOrder findOrderByOid(Integer oid);
	public void update(TOrder order);
	public void addOrder(TOrder order);
	public PageBean<TOrder> findOrderByUid(Integer uid, Integer pageIndex);
}
