package com.zhbit.user.service;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;

import com.zhbit.user.entity.TEmailuser;
import com.zhbit.util.PageBean;

public interface UserService {
	public void addEmailUser(TEmailuser user);
	public TEmailuser findByEmail(String signupEmail);
	public void updateEmailUser(TEmailuser user);
	public void deleteUserById(Integer id);
	public PageBean<TEmailuser> findUserInfo(Integer pageIndex);
	public TEmailuser findByUserId(Integer userId);
	public TEmailuser checkEmailUser(TEmailuser user);
}
