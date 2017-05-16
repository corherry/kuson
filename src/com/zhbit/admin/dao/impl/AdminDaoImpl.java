package com.zhbit.admin.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zhbit.admin.dao.AdminDao;
import com.zhbit.admin.entity.TAdminInfo;
import com.zhbit.util.PageHibernateCallBack;

@Transactional
public class AdminDaoImpl extends HibernateDaoSupport implements AdminDao{

	@Resource
	private SessionFactory sessionFactory;

	//��ӹ���Ա
	@Override
	public void add(TAdminInfo admin) {
		sessionFactory.getCurrentSession().persist(admin);
	}

	//�޸Ĺ���Ա��Ϣ
	@Override
	public void update(TAdminInfo admin) {
		sessionFactory.getCurrentSession().merge(admin);
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
	public int findCount(int adminAuthority) {
		String hql = "from TAdminInfo where adminAuthority = :adminAuthority";
		List<TAdminInfo> list = sessionFactory.getCurrentSession().createQuery(hql).
				setInteger("adminAuthority", adminAuthority).list();
		return list.size();
	}

	//��idɾ������Ա
	@Override
	public void deleteAdminById(Integer id) {
		TAdminInfo adminInfo = findByAdminId(id);
		sessionFactory.getCurrentSession().delete(adminInfo);
	}

	@Override
	public List<TAdminInfo> findAdminByAuthority(int begin, int limit, int adminAuthority) {
		String hql = "from TAdminInfo where adminAuthority = ?";
		List<TAdminInfo> adminList = this.getHibernateTemplate().execute(new PageHibernateCallBack<TAdminInfo>(hql, new Object[]{adminAuthority}, begin, limit));
		if(adminList != null && adminList.size() > 0)
			return adminList;
		return null;
	}

	@Override
	public TAdminInfo findByAdminId(Integer adminId) {
		TAdminInfo adminInfo = (TAdminInfo) sessionFactory.getCurrentSession().get(TAdminInfo.class, adminId);
		if(adminInfo != null)
			return adminInfo;
		return null;
	}
	
}
