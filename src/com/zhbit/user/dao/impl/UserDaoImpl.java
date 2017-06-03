package com.zhbit.user.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.zhbit.admin.entity.TAdminInfo;
import com.zhbit.user.dao.UserDao;
import com.zhbit.user.entity.TEmailuser;
import com.zhbit.util.PageHibernateCallBack;
@Transactional
public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
	@Resource
	private SessionFactory sessionFactory;
	@Override
	public void addEmailUser(TEmailuser user) { 
		sessionFactory.getCurrentSession().persist(user);
	}

	@Override
	public TEmailuser checkEmailUser(TEmailuser user) {
		String hql = "from TEmailuser where email = :email and password = :password";
		TEmailuser emailUser = (TEmailuser) sessionFactory.getCurrentSession().createQuery(hql)
				.setString("email", user.getEmail())
				.setString("password", user.getPassword())
				.uniqueResult();
		return emailUser;
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public TEmailuser findByEmail(String signupEmail) {
		String hql = "from TEmailuser where email = :email";
		TEmailuser user = (TEmailuser) sessionFactory.getCurrentSession().createQuery(hql)
				.setString("email", signupEmail).uniqueResult();
		return user;
	}

	@Override
	public void updateEmailUser(TEmailuser user) {
		sessionFactory.getCurrentSession().merge(user);
	}
	
	//获取用户记录数
		@Override
		public int findCount() {
			String hql = "from TEmailuser";
			List<TEmailuser> list = sessionFactory.getCurrentSession().createQuery(hql).list();
			return list.size();
		}

		//获取当前显示用户数
		@Override
		@Transactional(propagation=Propagation.NOT_SUPPORTED)
		public List<TEmailuser> getUserPage(int pageSize, int pageIndex) {
			if(pageIndex - 1 < 0)
				return null;
			String hql = "from TAdminInfo";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setFirstResult((pageIndex - 1) * pageSize);
			query.setMaxResults(pageSize);
			List<TEmailuser> userList = query.list();
			return userList;
		}

		//按id删除用户
		@Override
		public void deleteUserById(Integer id) {
			TEmailuser userInfo = findByUserId(id);
			sessionFactory.getCurrentSession().delete(userInfo);
		}

		@Override
		public List<TEmailuser> findUserInfo(int begin, int limit) {
			String hql = "from TEmailuser";
			List<TEmailuser> userList = this.getHibernateTemplate().execute(new PageHibernateCallBack<TEmailuser>(hql, null, begin, limit));
			if(userList != null && userList.size() > 0)
				return userList;
			return null;
		}

		@Override
		public TEmailuser findByUserId(Integer userId) {
			TEmailuser userInfo = (TEmailuser) sessionFactory.getCurrentSession().get(TEmailuser.class, userId);
			if(userInfo != null)
				return userInfo;
			return null;
		}

}
