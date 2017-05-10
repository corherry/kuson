package com.zhbit.admin.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zhbit.admin.dao.AdminDao;
import com.zhbit.admin.entity.TAdminInfo;

@Transactional
public class AdminDaoImpl implements AdminDao {
	
	@Resource
	private SessionFactory sessionFactory;
	
	//添加管理员
	@Override
	public void add(TAdminInfo admin) {
		sessionFactory.getCurrentSession().persist(admin);
	}

	//删除管理员
	@Override
	public void delete(TAdminInfo admin) {
		sessionFactory.getCurrentSession().delete(admin);
	}
	
	//修改管理员信息
	@Override
	public void update(TAdminInfo admin) {
		sessionFactory.getCurrentSession().merge(admin);
	}

	//查询商品管理员信息
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<TAdminInfo> queryByGoodsAdminInfo() {
		String hql = "from TAdminInfo where adminAuthority = 1";
		List<TAdminInfo> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	//查询订单管理员信息
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<TAdminInfo> queryByOrderAdminInfo() {
		String hql = "from TAdminInfo where adminAuthority = 2";
		List<TAdminInfo> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public TAdminInfo checkLogin(TAdminInfo admin) {
		String hql = "from TAdminInfo where adminAccount = :account and adminPassword = :password";
		TAdminInfo adminInfo = (TAdminInfo) sessionFactory.getCurrentSession().createQuery(hql)
				.setString("account", admin.getAdminAccount())
				.setString("password", admin.getAdminPassword())
				.uniqueResult();
		return adminInfo;
	}

	@Override
	public int getAdminCount(int adminAuthority) {
		String hql = "from TAdminInfo where adminAuthority = :adminAuthority";
		List<TAdminInfo> list = sessionFactory.getCurrentSession().createQuery(hql).
				setInteger("adminAuthority", adminAuthority).list();
		System.out.println(list.size());
		return list.size();
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<TAdminInfo> getAdminPage(int pageSize, int pageIndex, int adminAuthority) {
		if(pageIndex - 1 < 0)
			return null;
		String hql = "from TAdminInfo where adminAuthority = :adminAuthority";
		Query query = sessionFactory.getCurrentSession().createQuery(hql).setInteger("adminAuthority", adminAuthority);
		query.setFirstResult((pageIndex - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<TAdminInfo> adminList = query.list();
		System.out.println(adminList.size());
		return adminList;
	}

	@Override
	public void deleteAdminById(int id) {
		TAdminInfo adminInfo = (TAdminInfo) sessionFactory.getCurrentSession().get(TAdminInfo.class, id);
		sessionFactory.getCurrentSession().delete(adminInfo);
	}
	
}
