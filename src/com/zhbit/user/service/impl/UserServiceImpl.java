package com.zhbit.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.zhbit.user.dao.UserDao;
import com.zhbit.user.entity.TEmailuser;
import com.zhbit.user.service.UserService;
import com.zhbit.util.PageBean;

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
	
	@Override
	public void deleteUserById(Integer id) {
		userDao.deleteUserById(id);
	}

	@Override
	public PageBean<TEmailuser> findUserInfo(Integer pageIndex) {
		PageBean<TEmailuser> pageBean = new PageBean<TEmailuser>();
		int limit = 2;
		int totalCount = userDao.findCount();
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
		List<TEmailuser> userList = null;
		if(begin >= 0)
			userList = userDao.findUserInfo(begin, limit);
		pageBean.setList(userList);
		return pageBean;
	}
	
	public TEmailuser findByUserId(Integer userId) {
		return userDao.findByUserId(userId);
	}
	
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public TEmailuser checkEmailUser(TEmailuser user) {
		return userDao.checkEmailUser(user);
	}


}
