package com.zhbit.user.dao.impl;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zhbit.user.dao.UserDao;
import com.zhbit.user.entity.TEmailuser;
@Transactional
public class UserDaoImpl implements UserDao {
	@Resource
	private SessionFactory sessionFactory;
	@Override
	public void addEmailUser(TEmailuser user) { 
		sessionFactory.getCurrentSession().persist(user);
	}

	@Override
	public void checkEmailUser(TEmailuser user) {
		
		
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

}
