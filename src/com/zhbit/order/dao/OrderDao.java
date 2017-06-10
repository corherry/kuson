package com.zhbit.order.dao;

import java.util.List;

import com.zhbit.order.entity.TOrder;
import com.zhbit.util.PageBean;

public interface OrderDao {
	public List<TOrder> findOrderByStatus(int begin, int limit, int status);
	public int findCountByStatus(int status);
	public TOrder findOrderByOid(Integer oid);
	public void update(TOrder order);
	public void addOrder(TOrder order);
	public int findCountByUid(Integer uid);
	public List<TOrder> findOrderByUid(int begin, int limit, Integer uid);
}
