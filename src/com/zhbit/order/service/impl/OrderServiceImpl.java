package com.zhbit.order.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zhbit.order.dao.OrderDao;
import com.zhbit.order.entity.TOrder;
import com.zhbit.order.service.OrderService;
import com.zhbit.util.PageBean;

@Transactional
public class OrderServiceImpl implements OrderService {
	@Resource
	private OrderDao orderDao;

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean<TOrder> findOrderByStatus(Integer status, Integer pageIndex) {
		PageBean<TOrder> pageBean = new PageBean<TOrder>();
		int limit = 5;
		int totalCount = orderDao.findCountByStatus(status);
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		if(totalCount == 0)
			pageIndex = 0;
		if(pageIndex > totalPage)
			pageIndex = totalPage;
		pageBean.setLimit(limit);
		pageBean.setTotalCount(totalCount);
		pageBean.setPageIndex(pageIndex);
		pageBean.setTotalPage(totalPage);
		int begin = (pageIndex - 1) * limit;
		List<TOrder> orderList = null;
		if(begin >= 0)
			orderList = orderDao.findOrderByStatus(begin, limit, status);
		pageBean.setList(orderList);
		return pageBean;
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public TOrder findOrderByOid(Integer oid) {
		return orderDao.findOrderByOid(oid);
	}

	@Override
	public void update(TOrder order) {
		orderDao.update(order);
		
	}

	@Override
	public void addOrder(TOrder order) {
		orderDao.addOrder(order);
		
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean<TOrder> findOrderByUid(Integer uid, Integer pageIndex) {
		PageBean<TOrder> pageBean = new PageBean<TOrder>();
		int limit = 5;
		int totalCount = orderDao.findCountByUid(uid);
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		if(totalCount == 0)
			pageIndex = 0;
		if(pageIndex > totalPage)
			pageIndex = totalPage;
		pageBean.setLimit(limit);
		pageBean.setTotalCount(totalCount);
		pageBean.setPageIndex(pageIndex);
		pageBean.setTotalPage(totalPage);
		int begin = (pageIndex - 1) * limit;
		List<TOrder> orderList = null;
		if(begin >= 0)
			orderList = orderDao.findOrderByUid(begin, limit, uid);
		pageBean.setList(orderList);
		return pageBean;
	}
}
