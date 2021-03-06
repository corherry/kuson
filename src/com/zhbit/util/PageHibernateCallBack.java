package com.zhbit.util;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

public class PageHibernateCallBack<T> implements HibernateCallback<List<T>> {

	private String hql;// hql查询语句
	private Object[] params;// 参数
	private int startIndex;// 起始位置
	private int pageSize;// 每页显示个数

	public PageHibernateCallBack(String hql, Object[] params, int startIndex, int pageSize) {
		super();
		this.hql = hql;
		this.params = params;
		this.startIndex = startIndex;
		this.pageSize = pageSize;
	}


	@Override
	public List<T> doInHibernate(Session session) throws HibernateException {
		Query query = session.createQuery(hql);
		// 循环设置查询参数
		if (params != null) {
			for (int i = 0; i < params.length; i++) {
				query.setParameter(i, params[i]);
			}
		}
		query.setFirstResult(startIndex);
		query.setMaxResults(pageSize);
		List<T> list = query.list();
		return list;
	}

}
