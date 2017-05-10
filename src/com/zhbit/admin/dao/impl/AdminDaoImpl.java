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
		String hql = "from TAdminInfo where adminAuthority = 1";
		List<TAdminInfo> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	//��ѯ��������Ա��Ϣ
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<TAdminInfo> queryByOrderAdminInfo() {
		String hql = "from TAdminInfo where adminAuthority = 2";
		List<TAdminInfo> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	
	//��ѯ��½�û��Ƿ����
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

	//��Ȩ�޻�ȡ��¼��
	@Override
	public int getAdminCount(int adminAuthority) {
		String hql = "from TAdminInfo where adminAuthority = :adminAuthority";
		List<TAdminInfo> list = sessionFactory.getCurrentSession().createQuery(hql).
				setInteger("adminAuthority", adminAuthority).list();
		System.out.println(list.size());
		return list.size();
	}

	//��Ȩ�޻�ȡ��ǰ��ʾ����Ա
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
		return adminList;
	}

	//��idɾ������Ա
	@Override
	public void deleteAdminById(int id) {
		TAdminInfo adminInfo = (TAdminInfo) sessionFactory.getCurrentSession().get(TAdminInfo.class, id);
		sessionFactory.getCurrentSession().delete(adminInfo);
	}
	
}
