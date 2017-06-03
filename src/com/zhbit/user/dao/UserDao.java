package com.zhbit.user.dao;

import java.util.List;


import com.zhbit.user.entity.TEmailuser;

public interface UserDao {
	public void addEmailUser(TEmailuser user);
	public TEmailuser checkEmailUser(TEmailuser user);
	public TEmailuser findByEmail(String signupEmail);
	public void updateEmailUser(TEmailuser user);
	public int findCount();
	public List<TEmailuser> getUserPage(int pageSize, int pageIndex);
	public void deleteUserById(Integer id);
	public TEmailuser findByUserId(Integer userId);
	public List<TEmailuser> findUserInfo(int begin, int limit);
}
