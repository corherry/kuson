package com.zhbit.admin.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zhbit.admin.dao.AdminDao;
import com.zhbit.admin.entity.TAdminInfo;

@Transactional
public class AdminDaoImpl implements AdminDao {
	
	@Resource
	private SessionFactory sessionFactory;
	
	//��ӹ���Ա
	@Override
	public void add(TAdminInfo admin) {
		sessionFactory.getCurrentSession().persist(admin);
	}

	//ɾ������Ա
	@Override
	public void delete(TAdminInfo admin) {
		sessionFactory.getCurrentSession().delete(admin);
	}
	
	//�޸Ĺ���Ա��Ϣ
	@Override
	public void update(TAdminInfo admin) {
		sessionFactory.getCurrentSession().merge(admin);
	}

	//��ѯ��Ʒ����Ա��Ϣ
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<TAdminInfo> queryByGoodsAdminInfo() {
		String hql = "from TadminInfo where adminAuthority = 0";
		List<TAdminInfo> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	//��ѯ��������Ա��Ϣ
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<TAdminInfo> queryByOrderAdminInfo() {
		String hql = "from TadminInfo where adminAuthority = 1";
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
}
