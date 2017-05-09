package com.zhbit.user.service.impl;

import javax.annotation.Resource;

import com.zhbit.user.dao.UserDao;
import com.zhbit.user.entity.TEmailuser;
import com.zhbit.user.service.UserService;

public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;

	@Override
	public void addEmailUser(TEmailuser user) {
		userDao.addEmailUser(user);
	}

	@Override
	public TEmailuser findByEmail(String signupEmail) {
		return userDao.findByEmail(signupEmail);
	}
	
	@Override
	public void updateEmailUser(TEmailuser user) {
		userDao.updateEmailUser(user);
	}
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


}
