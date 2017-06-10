package com.zhbit.order.dao.impl;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.taglibs.standard.tag.common.core.SetSupport;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zhbit.order.dao.OrderDao;
import com.zhbit.order.entity.TOrder;
import com.zhbit.util.PageHibernateCallBack;

public class OrderDaoImpl extends HibernateDaoSupport implements OrderDao {

	@Resource
	private SessionFactory sessionFactory;

	@Override
	public List<TOrder> findOrderByStatus(int begin, int limit, int status) {
		if(status == 5){
			String hql = "from TOrder order by orderTime desc";
			List<TOrder> orderList = this.getHibernateTemplate().execute(new PageHibernateCallBack<TOrder>(hql, null, begin, limit));
			if(orderList != null && orderList.size() > 0)
				return orderList;
			return null;
		}
		String hql = "from TOrder where status = ? order by orderTime desc";
		List<TOrder> orderList = this.getHibernateTemplate().execute(new PageHibernateCallBack<TOrder>(hql, new Object[]{status}, begin, limit));
		if(orderList != null && orderList.size() > 0)
			return orderList;
		return null;
	}
	@Override
	public int findCountByStatus(int status) {
		if(status==5){
			String hql = "from TOrder";
			return sessionFactory.getCurrentSession().createQuery(hql).list().size();
		}
		String hql = "from TOrder where status = ?";
		return sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, status).list().size();
	}
	@Override
	public TOrder findOrderByOid(Integer oid) {
		TOrder order = (TOrder) sessionFactory.getCurrentSession().get(TOrder.class, oid);
		if(order != null)
			return order;
		return null;
	}
	@Override
	public void update(TOrder order) {
		sessionFactory.getCurrentSession().merge(order);
	}
	@Override
	public void addOrder(TOrder order) {
		sessionFactory.getCurrentSession().persist(order);
	}
	@Override
	public int findCountByUid(Integer uid) {
		String hql = "from TOrder o where o.emailuser.userId = ?";
		return sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, uid).list().size();
	}
	@Override
	public List<TOrder> findOrderByUid(int begin, int limit, Integer uid) {
		String hql = "from TOrder o where o.emailuser.userId = ? order by orderTime desc";
		List<TOrder> orderList = this.getHibernateTemplate().execute(new PageHibernateCallBack<TOrder>(hql, new Object[]{uid}, begin, limit));
		if(orderList != null && orderList.size() > 0)
			return orderList;
		return null;
	}
}
